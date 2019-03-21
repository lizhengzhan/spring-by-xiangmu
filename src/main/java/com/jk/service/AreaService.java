package com.jk.service;

import com.jk.bean.AreaBean;

import java.util.HashMap;
import java.util.List;

public interface AreaService {
    List<AreaBean> queryArea(Integer ids);

    List<AreaBean> queryArea2(Integer ids);

    HashMap<String, Object> queryAreaList(Integer page, Integer rows, AreaBean areaBean, Integer ids);

    AreaBean queryAreaByid(Integer id);

    void addAreaAdd(AreaBean areaBean);
}
