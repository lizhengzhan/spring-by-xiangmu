package com.jk.service.serviceimpl;

import com.jk.bean.CompanyBean;
import com.jk.bean.CooperativesBean;
import com.jk.mapper.CooperativesMapper;
import com.jk.service.CooperativesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CooperativesServiceImpl  implements   CooperativesService{

    @Autowired
    private   CooperativesMapper  cooperativesMapper;


    @Override
    public HashMap<String, Object> queryCooperatives(Integer page, Integer rows, CooperativesBean cooperativesBean) {
        HashMap<String, Object> hashMap = new HashMap<>();
        //查询总条数
        long total = cooperativesMapper.queryCooperativesTotal(cooperativesBean);
        //查询显示信息
        //开始位置
        int start = (page-1)*rows;
        List<CompanyBean> list = cooperativesMapper.queryCooperatives(start,rows,cooperativesBean);
        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }



}
