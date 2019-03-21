package com.jk.service.serviceimpl;

import com.jk.bean.CompanyBean;
import com.jk.bean.CooperativesBean;
import com.jk.mapper.FirmAuditMapper;
import com.jk.service.FirmAuditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class FirmAuditServiceImpl implements FirmAuditService {

    @Autowired
    private FirmAuditMapper firmAuditMapper;

    @Override
    public HashMap<String, Object> queryFirmAudit(Integer page, Integer rows, CooperativesBean cooperativesBean) {

        HashMap<String, Object> hashMap = new HashMap<>();
        //查询总条数
        long total = firmAuditMapper.queryFirmAuditTotal(cooperativesBean);
        //查询显示信息
        //开始位置
        int start = (page-1)*rows;
        List<CompanyBean> list = firmAuditMapper.queryFirmAudit(start,rows,cooperativesBean);
        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }

    @Override
    public void FiemAuditVia(Integer id) {
        firmAuditMapper.FiemAuditVia(id);
    }

}
