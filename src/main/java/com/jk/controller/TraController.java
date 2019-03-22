package com.jk.controller;

import com.jk.bean.TraBean;
import com.jk.service.TraService;
import com.jk.utils.OssUpFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

@Controller
public class TraController {

    @Autowired
    private TraService traService;

    /**
     * 分页+查询
     * @param page
     * @param rows
     * @param traBean
     * @return
     */
    @RequestMapping("queryTraList")
    @ResponseBody
    public HashMap<String,Object> queryTraList(Integer page, Integer rows, TraBean traBean){
        return traService.queryTraList(page,rows,traBean);
    }

    /**
     * 新增
     * @param traBean
     */
    @RequestMapping("addTra")
    @ResponseBody
    public void addTra(TraBean traBean){


        traService.addTra(traBean);

    }

    //OOS图片上传
    @ResponseBody
    @RequestMapping("addFiletwo")
    public String addFile(@RequestParam("headimg") MultipartFile file){
        Map<String, Object> stringObjectMap = OssUpFileUtil.uploadFile(file);
        String count = "";
        for(String key : stringObjectMap.keySet()){
            Object o = stringObjectMap.get(key);
            System.out.println("key: " + key + " value: " + o);
            if(key=="url"){
                count+=o;
            }
        }
        return count;
    }
    //OOS图片上传
    @ResponseBody
    @RequestMapping("addFiletwo1")
    public String addFile1(@RequestParam("headimg1") MultipartFile file){
        Map<String, Object> stringObjectMap = OssUpFileUtil.uploadFile(file);
        String count = "";
        for(String key : stringObjectMap.keySet()){
            Object o = stringObjectMap.get(key);
            System.out.println("key: " + key + " value: " + o);
            if(key=="url"){
                count+=o;
            }
        }
        return count;
    }

    /**
     * 删除批删
     * @param ids
     */
    @RequestMapping("deleteTra")
    @ResponseBody
    public void deleteTra(String[] ids){
        traService.deleteTra(ids);
    }

    /**
     * 修改回显跳转页面
     * @return
     */
    @RequestMapping("toUpdateTra")
    public String toUpdate(){
        return "tra/updateTra";
    }

    /**
     * 新增跳转页面
     * @return
     */
    @RequestMapping("toAddTra")
    public String toAddTra(){
        return "tra/traAdd";
    }

    /**
     * 跳转列表页面
     * @return
     */
    @RequestMapping("toTra")
    public String toTra(){
        return "tra/traList";
    }


}
