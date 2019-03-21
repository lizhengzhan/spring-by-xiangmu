package com.jk.controller;

import com.jk.bean.UserBean;
import com.jk.service.UserServiec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserServiec userServiec;

    @RequestMapping("queryUser")
    @ResponseBody
    public HashMap<String, Object> queryUser(Integer page, Integer rows, UserBean userBean){
        return userServiec.queryUser(page,rows,userBean);
    }

    @RequestMapping("delUserAll")
    @ResponseBody
    public void delUserAll(String ids){
        userServiec.delUserAll(ids);
    }

    @ResponseBody
    @RequestMapping("addUserAdd")
    public void addUserAdd(UserBean userBean){
        System.out.println("111");
        userServiec.addUserAdd(userBean);
    }

    @ResponseBody
    @RequestMapping("queryUserById")
    public UserBean queryUserById(Integer id){
        return userServiec.queryUserById(id);
    }

    @ResponseBody
    @RequestMapping("updateUserPassword")
    public void updateUserPassword(UserBean userBean){
        userServiec.updateUserPassword(userBean);
    }
}
