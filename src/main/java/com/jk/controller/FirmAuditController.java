package com.jk.controller;

import com.jk.bean.CooperativesBean;
import com.jk.service.FirmAuditService;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;

@RestController
public class FirmAuditController {

    @Resource
    private FirmAuditService  firmAuditService;

    @ResponseBody
    @RequestMapping("queryFirmAudit")
    public HashMap<String, Object> queryFirmAudit(Integer page, Integer rows, CooperativesBean cooperativesBean){
        return  firmAuditService.queryFirmAudit(page,rows,cooperativesBean);
    }

    //正在审核中
    @RequestMapping("FiemAuditVia")
    public void FiemAuditVia(Integer id){
        firmAuditService.FiemAuditVia(id);
    }

}
