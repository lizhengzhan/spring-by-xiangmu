package com.jk.service;

import com.jk.bean.UserBean;

import java.util.HashMap;

public interface UserServiec {


    HashMap<String, Object> queryUser(Integer page, Integer rows, UserBean userBean);

    void delUserAll(String ids);
}
