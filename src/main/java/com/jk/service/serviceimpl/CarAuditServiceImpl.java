package com.jk.service.serviceimpl;

import com.jk.bean.BrandBean;
import com.jk.bean.CompanyBean;
import com.jk.mapper.CarAuditMapper;
import com.jk.service.CarAuditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CarAuditServiceImpl implements CarAuditService {

    @Autowired
    private CarAuditMapper  carAuditMapper;

    @Override
    public HashMap<String, Object> queryCarAudit(Integer page, Integer rows, BrandBean  brandBean) {
        HashMap<String, Object> hashMap = new HashMap<>();
        //查询总条数
        long total = carAuditMapper.queryCarAuditTotal(brandBean);
        //查询显示信息
        //开始位置
        int start = (page-1)*rows;
        List<CompanyBean> list = carAuditMapper.queryCarAudit(start,rows,brandBean);
        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }

    @Override
    public void pass(Integer id) {
        carAuditMapper.pass(id);
    }

    //认证
    @Override
    public void authentication(Integer id) {
        carAuditMapper.authentication(id);
    }


}
