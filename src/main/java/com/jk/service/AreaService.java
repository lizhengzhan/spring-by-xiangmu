package com.jk.service;

import com.jk.bean.AreaBean;

import java.util.List;

public interface AreaService {
    List<AreaBean> queryArea(Integer ids);

    List<AreaBean> queryArea2(Integer ids);
}
