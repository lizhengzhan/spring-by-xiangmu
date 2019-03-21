package com.jk.controller;



import com.jk.bean.SitesUserBean;
import com.jk.service.SitesUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class SitesUserController {


    @Autowired
    private SitesUserService  sitesUserService;


    @RequestMapping("querySitesUser")
    @ResponseBody
    public HashMap<String, Object> queryUSer(Integer page, Integer rows, SitesUserBean  sitesUserBean){
        return sitesUserService.querySitesUser(page,rows,sitesUserBean);
    }

    //登录
    @RequestMapping("queryLogin")
    @ResponseBody
    public String queryLogin(SitesUserBean  sitesUserBean, HttpSession session, HttpServletRequest request){
        //根据用户名查询用户信息
        SitesUserBean sitesUserBean2 = sitesUserService.queryLogin(sitesUserBean.getUserEmail());
        //验证用户名
        if(sitesUserBean2==null){
            return "邮箱错误";
        }
        //验证密码
        if(!sitesUserBean2.getPassword().equals(sitesUserBean.getPassword())){
            return "密码错误";
        }
        session.setAttribute("user", sitesUserBean2);
        return "登录成功";
    }

   /* //注销
    @RequestMapping("remove")
    public String remove(HttpSession session){
        session.removeAttribute("user");
        return "../index";
    }*/

		/*//注册
		@RequestMapping("register")
		@ResponseBody
		public String register(User user){
			return userService.register(user);
		}*/


}
