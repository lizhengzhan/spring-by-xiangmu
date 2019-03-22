package com.jk.service.serviceimpl;

import com.jk.bean.YuYueBean;
import com.jk.mapper.TheMapper;
import com.jk.service.TheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TheServiceImpl implements TheService {

    @Autowired
    private TheMapper theMapper;
    @Override
    public List<YuYueBean> queryTheList() {
        return theMapper.queryTheList();
    }
}
