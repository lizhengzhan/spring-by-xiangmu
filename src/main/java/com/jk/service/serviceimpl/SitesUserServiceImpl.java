package com.jk.service.serviceimpl;

import com.jk.bean.CompanyBean;
import com.jk.bean.SitesUserBean;
import com.jk.mapper.SitesUserMapper;
import com.jk.service.SitesUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class SitesUserServiceImpl implements SitesUserService {

    @Autowired
    private SitesUserMapper  sitesUserMapper;

    @Override
    public HashMap<String, Object> querySitesUser(Integer page, Integer rows, SitesUserBean sitesUserBean) {
        HashMap<String, Object> hashMap = new HashMap<>();
        //查询总条数
        long total = sitesUserMapper.querySitesUserTotal(sitesUserBean);
        //查询显示信息
        //开始位置
        int start = (page-1)*rows;
        List<CompanyBean> list = sitesUserMapper.querySitesUser(start,rows,sitesUserBean);
        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }

    @Override
    public SitesUserBean queryLogin(String userName) {
        return sitesUserMapper.queryLogin(userName);
    }
}
