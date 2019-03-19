package com.jk.controller;

import com.jk.bean.ServerBean;
import com.jk.service.ServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

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
    public void addServer(ServerBean serverBean){

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
}
