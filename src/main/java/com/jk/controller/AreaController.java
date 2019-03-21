package com.jk.controller;

import com.jk.bean.AreaBean;
import com.jk.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("area")
public class AreaController {

    @Autowired
    private AreaService areaService;

    @RequestMapping("queryArea")
    @ResponseBody
    public List<AreaBean> queryArea(Integer ids){
        return areaService.queryArea(ids);
    }

    @RequestMapping("queryArea2")
    @ResponseBody
    public List<AreaBean> queryArea2(Integer ids){
        /*System.out.println(111);*/
        return areaService.queryArea2(ids);
    }

    @RequestMapping("queryAreaList")
    @ResponseBody
    public HashMap<String, Object> queryAreaList(Integer page, Integer rows, AreaBean areaBean, Integer ids){
        return areaService.queryAreaList(page,rows,areaBean,ids);
    }


    @RequestMapping("queryAreaByid")
    @ResponseBody
    public AreaBean queryAreaByid(Integer id){
        return areaService.queryAreaByid(id);
    }

    @ResponseBody
    @RequestMapping("addAreaAdd")
    public void addAreaAdd(AreaBean areaBean){
        areaService.addAreaAdd(areaBean);
    }
}
