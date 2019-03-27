package com.jk.controller;


import com.jk.bean.Time;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
public class SolrController {

    @Autowired
    private SolrClient client;



    @RequestMapping("/solrSearch")
    @ResponseBody
    public List<Time> carlist(Time time)throws IOException, SolrServerException {
        List<Time> carslist=new ArrayList<>();

        SolrQuery solrQuery = new SolrQuery();
        //q:查询条件   判断页面传来的查询是否为空，若不判断会报错
        if(time.getRtime() != "" & time.getRtime() != null){
            solrQuery.set("q", time.getRtime());
        }else{
            solrQuery.set("q", "*:*");
        }
        //fl:需要展示的字段
        solrQuery.set("fl", "id,product_title,product_point");
        //条件查询的字段
        solrQuery.set("df", "product_point");
        //高亮打开开关
        solrQuery.setHighlight(true);
        //指定高亮域
        solrQuery.addHighlightField("product_point");
        //设置前缀
        solrQuery.setHighlightSimplePre("<span style='color:red'>");
        //设置后缀
        solrQuery.setHighlightSimplePost("</span>");

        //设置使用的Solr数据库  核心库
        QueryResponse queryResponse = client.query("core1",solrQuery);
        //返回的查询数据
        SolrDocumentList results = queryResponse.getResults();
        //返回数据的总条数
        long numFound = results.getNumFound();
        //获取高亮显示的结果, 高亮显示的结果和查询结果是分开放的
        Map<String, Map<String, List<String>>> highlight = queryResponse.getHighlighting();
        for (SolrDocument result : results) {
           Time time1 =  new Time();
            String highname="";
            Map<String, List<String>> map = highlight.get(result.get("id"));
            List<String> list = map.get("product_point");
            if(list==null){
                highname=(String)result.get("product_point");
            }else{
                highname=list.get(0);
            }
            time1.setId((String)result.get("id"));
            time1.setName((String)result.get("product_title"));
            time1.setRtime(highname);
            carslist.add(time1);
        }
        return carslist;
    }

    /**
     * 新增/修改 索引
     * 当 id 存在的时候, 此方法是修改, 如果 id 不存在, 则是新增  solr会自动判断
     * 如果spring.data.solr.host 里面配置到 core了, 那么这里就不需要传 new_core 这个参数
     * @return
     */
    @RequestMapping("/addCar")
    @ResponseBody
    public String addCar(Time time) throws IOException, SolrServerException {
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        SolrInputDocument doc = new SolrInputDocument();
        doc.setField("id",uuid);
        doc.setField("product_title", time.getName());
        doc.setField("product_point",time.getRtime());

        client.add("core1", doc);
        client.commit("core1");
        return "1";
    }


    /**
     *通过id查询
     * @param id
     * @return
     * @throws IOException
     * @throws SolrServerException
     */
    @RequestMapping("/queryCarById")
    @ResponseBody
    public Time queryWbxUserById(@RequestParam(value="id") String id) throws IOException, SolrServerException {
        SolrDocument document = client.getById("core1", id);
        Time  time = new Time();
        time.setId((String)document.get("id"));
        time.setName((String)document.get("product_title"));
        time.setRtime((String)document.get("product_point")); ;
        return time;
    }

    /**
     * 修改信息
     *
     */
    @RequestMapping("/updateCar")
    @ResponseBody
    public String updateCar(Time time){
        try {
            SolrInputDocument doc = new SolrInputDocument();
            doc.setField("id", time.getId());
            doc.setField("product_title", time.getName());
            doc.setField("product_point",time.getRtime());

            client.add("core1", doc);
            client.commit("core1");
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error22";
    }


    /**
     * 根据id删除索引
     * @param id
     * @return
     */
    @RequestMapping("/deleteCar")
    @ResponseBody
    public String delete(String id)  {
        try {
            client.deleteById("core1",id);
            client.commit("core1");
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }


}
