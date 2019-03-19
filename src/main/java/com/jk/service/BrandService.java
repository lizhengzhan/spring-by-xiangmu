package com.jk.service;

import com.jk.bean.BrandBean;

import java.util.HashMap;

public interface BrandService {

    //分页查询
    HashMap<String, Object> queryBrandList(Integer page, Integer rows, BrandBean brandBean);

    //新增
    void addBrand(BrandBean brand);

    //删除
    void deleteBrand(Integer id);
}
