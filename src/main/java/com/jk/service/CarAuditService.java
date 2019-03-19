package com.jk.service;

import com.jk.bean.BrandBean;

import java.util.HashMap;

public interface CarAuditService {

    HashMap<String, Object> queryCarAudit(Integer page, Integer rows, BrandBean brandBean);


    void  pass(Integer  id);

    //认证
    void   authentication(Integer  id);

}
