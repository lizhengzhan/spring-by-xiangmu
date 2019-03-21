package com.jk.controller;

import com.jk.bean.RoleBean;
import com.jk.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("queryRole")
    @ResponseBody
    public List<RoleBean> queryRole(){
        return roleService.queryRole();
    }
}
