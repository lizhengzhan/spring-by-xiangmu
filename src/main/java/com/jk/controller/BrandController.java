package com.jk.controller;

import com.jk.bean.BrandBean;
import com.jk.bean.CarsBean;
import com.jk.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;


@Controller
public class BrandController {

    @Autowired
    private BrandService brandService;


    /**
     * 分页查询
     * @param page
     * @param rows
     * @param brand
     * @return
     */
    @RequestMapping("queryBrandList")
    @ResponseBody
    public HashMap<String,Object> queryBrandList(Integer page,Integer rows,BrandBean brand){
        return brandService.queryBrandList(page,rows,brand);
    }

    /**
     * 新增
     * @param brand
     */
    @RequestMapping("addBrand")
    @ResponseBody
    public void addBrand(BrandBean brandBean){
        brandService.addBrand(brandBean);
    }

    /**
     * 删除
     * @param id
     */
    @RequestMapping("deleteBrand")
    @ResponseBody
    public void deleteBrand(Integer id){
        brandService.deleteBrand(id);
    }
}
