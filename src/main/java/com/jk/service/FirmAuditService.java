package com.jk.service;

import com.jk.bean.CooperativesBean;

import java.util.HashMap;
import java.util.List;

/**
 *   企业审核
 */
public interface FirmAuditService {

    HashMap<String, Object> queryFirmAudit(Integer page, Integer rows, CooperativesBean  cooperativesBean);

    void FiemAuditVia(Integer id);
}
