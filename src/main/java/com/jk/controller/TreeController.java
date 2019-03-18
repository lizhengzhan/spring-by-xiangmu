package com.jk.controller;

import com.jk.bean.TreeBean;
import com.jk.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TreeController {

    @Autowired
    private TreeService  treeService;


    @RequestMapping("findTree")
    @ResponseBody
    public List<TreeBean>  findTree(){
        return treeService.findTree();
    }
}
