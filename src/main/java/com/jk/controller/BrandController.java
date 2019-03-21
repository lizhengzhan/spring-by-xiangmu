package com.jk.controller;

import com.jk.bean.BrandBean;
import com.jk.bean.CarsBean;
import com.jk.service.BrandService;
import com.jk.service.CarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;


@RestController
public class BrandController {

    @Autowired
    private BrandService brandService;

    @Autowired
    private CarsService carsService;

    @RequestMapping("carsList")
    @ResponseBody
    public List<CarsBean> carsList(){
        return carsService.carsList();
    }

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
     *
     * 新增
     * @param brand
     */
    @RequestMapping("addBrand")
    @ResponseBody
    public void addBrand(BrandBean brandBean){
        brandService.addBrand(brandBean);
    }

    /**mm
     * 批删+单删
     * @param ids
     * @return
     */
    @RequestMapping("deleteBrand")
    @ResponseBody
    public void deleteBrand(String[] ids){
        brandService.deleteBrand(ids);
    }

  /*  @RequestMapping("failure")
    @ResponseBody
    public void failure(Integer id){
        brandService.failure(id);
    }*/
}


