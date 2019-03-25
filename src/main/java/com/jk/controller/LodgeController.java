package com.jk.controller;

import com.jk.bean.LodgeBean;
import com.jk.utils.MongUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("lodge")
public class LodgeController {

    @Autowired
    private MongoTemplate mongoTemplate;
    @Resource(name="redisTemplate")
    private RedisTemplate<String,List<LodgeBean>> redisTemplate;

    //新增
    @RequestMapping("addLodge")
    public void  addLodge(){
        LodgeBean lodgeBean = new LodgeBean();
        lodgeBean.setId("1");
        lodgeBean.setCreateTime(new Date());
        lodgeBean.setLodgeName("李正展是sb");
        lodgeBean.setUserId(1);
        mongoTemplate.save(lodgeBean);
        List<LodgeBean> lodgeBeans = mongoTemplate.findAll(LodgeBean.class);
        System.out.println(lodgeBeans);
        String keys = "lizhengzhan";
        redisTemplate.opsForValue().set(keys,lodgeBeans);
    }

    //删除
    @RequestMapping("delLodge")
    public void  delLodge(String ids){

        String[] split = ids.split(",");
        MongUtils.delByIds("1807b","log",split);
    }

    //修改
    @RequestMapping("updateLodge")
    public void  updateLodge(){

    }

    //查询
    @RequestMapping("queryLodge")
    public List<LodgeBean>  queryLodge(){

        List<LodgeBean> list = redisTemplate.opsForValue().get("lizhengzhan");
        for (LodgeBean ll: list) {
            System.out.println(ll.getLodgeName());
        }
        return list;
    }


}
