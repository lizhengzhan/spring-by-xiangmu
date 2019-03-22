package com.jk.controller;



import com.jk.bean.SitesUserBean;
import com.jk.service.SitesUserService;
import com.jk.utils.MD5Util;
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
    @RequestMapping("querySites")
    public String queryLogin(SitesUserBean  sitesUserBean, HttpSession session, HttpServletRequest request){
        //根据用户名查询用户信息
        SitesUserBean sitesUserBean2 = sitesUserService.queryLogin(sitesUserBean.getUserEmail());
        //验证用户名
        if(sitesUserBean2==null){
            return "邮箱错误";
        }
        //验证密码
        if(!sitesUserBean2.getPassword().equals(MD5Util.getMD5(sitesUserBean.getPassword()))){
            return "密码错误";
        }
        session.setAttribute("sitesUser", sitesUserBean2);
        return "index";
    }


    //注销
    @RequestMapping("remove")
    public String remove(HttpSession session){
        session.removeAttribute("sitesUser");
        return "index";
    }


		//注册
		@RequestMapping("enroll")
		public String enroll(SitesUserBean sitesUserBean,HttpServletRequest  request){
            sitesUserBean.setPassword(MD5Util.getMD5(sitesUserBean.getPassword()));
			 sitesUserService.enroll(sitesUserBean);
			 return  "redirect:toIndex";
		}


}
