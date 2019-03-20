package com.jk.service;

import com.jk.bean.ServerBean;

import java.util.HashMap;

public interface ServerService {


    HashMap<String, Object> queryListPage(Integer page, Integer rows);

    void addServer(ServerBean serverBean);

    ServerBean queryServerById(Integer id);

    void delServerById(int parseInt);
}
