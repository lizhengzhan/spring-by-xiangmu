package com.jk.controller;

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
}
