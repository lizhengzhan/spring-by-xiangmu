package com.jk.service.serviceimpl;


import com.jk.bean.TraBean;
import com.jk.mapper.TraMapper;
import com.jk.service.TraService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class TraServiceImpl implements TraService {

    @Autowired
    private TraMapper traMapper;

    @Override
    public HashMap<String, Object> queryTraList(Integer page, Integer rows, TraBean traBean) {
        HashMap<String, Object> hashMap = new HashMap<>();

        long total = traMapper.queryTraListToal(traBean);

        int start = (page-1)*rows;

        List<TraBean> list = traMapper.queryTraList(start,rows,traBean);

        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }

    @Override
    public void deleteTra(String[] ids) {
        traMapper.deleteTra(ids);
    }

    @Override
    public void addTra(TraBean traBean) {
        traMapper.addTra(traBean);
    }




}
