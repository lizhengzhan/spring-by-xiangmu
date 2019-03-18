package com.jk.service;



import com.jk.bean.CooperativesBean;

import java.util.HashMap;

public interface CooperativesService {

    HashMap<String, Object> queryCooperatives(Integer page, Integer rows, CooperativesBean  cooperativesBean);
}
