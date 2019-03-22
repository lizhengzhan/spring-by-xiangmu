package com.jk.controller;

import com.jk.util.HttpClientUtil;
import com.jk.utils.MD5Util;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;

@RestController
@RequestMapping("http")
public class HttpController {

    //获取验证码
    @RequestMapping("getCode")
    public boolean getCode(String phone, HttpServletRequest request, Integer id) {

        String url = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
        HashMap<String , Object> params = new HashMap<>();
        params.put("accountSid", "d49fde831ecf40cd8805aa7074e51d2d");
        params.put("to", phone);
        String time = new Date().toString();
        params.put("timestamp", time);
        String md5 = "d49fde831ecf40cd8805aa7074e51d2d"+"79b0c1fe1b084d5c9310d9e07400ab79"+time;
        params.put("sig", MD5Util.getMD5(md5));
        params.put("templateid", "1119657900");//短信模板ID
        Integer ran = (int)(Math.random()*1000000);
        //((int)Math.random()*1000000);
        params.put("param", ran);//短信模板ID
        String string = HttpClientUtil.post(url, params);
        System.out.println(string);
        request.getSession().setAttribute("code", ran);
        request.getSession().setAttribute("phone", phone);
        if(string !=null & string !="") {
            return true;
        }else {
            return false;
        }

    }

    //验证码登陆
    @RequestMapping("codeLogin")
    public boolean codeLogin(String phone,String code,HttpServletRequest request) {
        Integer codes = (int)request.getSession().getAttribute("code");
        String phones = (String)request.getSession().getAttribute("phone");
        if(codes==Integer.parseInt(code)&&phones.equals(phone)) {
            return true;
        }
        return false;
    }
}
