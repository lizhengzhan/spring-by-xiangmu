package com.jk.service.serviceimpl;

import com.jk.bean.CompanyBean;
import com.jk.mapper.CompanyMapper;
import com.jk.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyMapper   companyMapper;



    @Override
    public HashMap<String, Object> queryCompany(Integer page, Integer rows, CompanyBean companyBean) {
        HashMap<String, Object> hashMap = new HashMap<>();
        //查询总条数
        long total = companyMapper.queryUserTotal(companyBean);
        //查询显示信息
        //开始位置
        int start = (page-1)*rows;
        List<CompanyBean> list = companyMapper.queryCompany(start,rows,companyBean);
        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }

    @Override
    public void addCompany(CompanyBean companyBean) {
        Integer id = companyBean.getId();
        if (id != null) {
            companyMapper.updateCompany(companyBean);
        } else {
            companyMapper.addCompany(companyBean);
        }

    }

    @Override
    public CompanyBean queryCompanyById(Integer id) {
        return companyMapper.queryCompanyById(id);
    }

    @Override
    public void deleteAll(String[] ids) {
        companyMapper.deleteAll(ids);
    }

    @Override
    public void relation(Integer id) {
        companyMapper.relation(id);
    }

    @Override
    public void await(Integer id) {
        companyMapper.await(id);
    }


}
