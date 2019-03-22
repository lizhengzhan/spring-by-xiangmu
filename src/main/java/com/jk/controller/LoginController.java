package com.jk.controller;

import com.jk.bean.UserBean;
import com.jk.service.LoginService;
import com.jk.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @GetMapping(value = "loginUser")
    @ResponseBody
    public String loginUser(UserBean userBean, HttpSession session){

        if(userBean == null){
            return "请输入";
        }

        UserBean user = loginService.loginUser(userBean.getUserName());

        if(user == null){
            return "请确认是否有此账号？";
        }
        if(userBean.getUserName() != null && !user.getUserName().equals(userBean.getUserName())){
            return "请确认是否有此账号？";
        }
        if(userBean.getPassword() != null && !user.getPassword().equals(MD5Util.getMD5(userBean.getPassword()))){
            return "请确认您的密码是正确的！";
        }
        session.setAttribute("user",user);
        return "登陆成功！";
    }

    //注销
    @RequestMapping("toRemove")
    public String remove(HttpSession session){
        session.removeAttribute("user");
        return "login";
    }

}
