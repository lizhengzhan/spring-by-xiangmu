package com.jk.controller;

import com.jk.bean.ServerBean;
import com.jk.bean.SitesUserBean;
import com.jk.bean.UserBean;
import com.jk.service.ServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("server")
public class ServerController {

    @Autowired
    private ServerService service;

    @RequestMapping("queryList")
    public HashMap<String, Object> queryListPage(Integer page, Integer rows){
        return service.queryListPage(page,rows);
    }

    @RequestMapping("addServer")
    public void addServer(ServerBean serverBean,HttpSession session){
        SitesUserBean sitesUser = (SitesUserBean)session.getAttribute("sitesUser");
        Integer id = sitesUser.getId();
        serverBean.setUserId(id);
        System.out.println(id);
        service.addServer(serverBean);
    }

    @RequestMapping("queryServerById")
    public ServerBean queryServerById(Integer id){

       ServerBean serverBean =  service.queryServerById(id);
       return serverBean;
    }

    @RequestMapping("delServerById")
    public void delServerById(String ids){
        String[] strarr = ids.split(",");
        for (int i = 0; i < strarr.length; i++){
            service.delServerById(Integer.parseInt(strarr[i]));
        }
    }

    //查询认证员
    @RequestMapping("allotAuth")
    public List<UserBean> allotAuth(HttpSession session){
        Integer id = (Integer)session.getAttribute("serverId");
        List<UserBean> list = service.allotAuth(id);
        return list;
    }

    @RequestMapping("updateStatus")
    public void updateStatus(HttpSession session){
        Integer id = (Integer)session.getAttribute("serverId");
        service.updateStatus(id);
    }
}
