package com.jk.service;

import com.jk.bean.ServerBean;
import com.jk.bean.UserBean;

import java.util.HashMap;
import java.util.List;

public interface ServerService {


    HashMap<String, Object> queryListPage(Integer page, Integer rows);

    void addServer(ServerBean serverBean);

    ServerBean queryServerById(Integer id);

    void delServerById(int parseInt);

    List<UserBean> allotAuth(Integer id);

    void updateStatus(Integer id);
}
