package com.jk.service.serviceimpl;

import com.jk.bean.AreaBean;
import com.jk.mapper.AreaMapper;
import com.jk.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaSeviceImpl implements AreaService {

    @Autowired
    private AreaMapper areaMapper;

    @Override
    public List<AreaBean> queryArea(Integer ids) {
        return areaMapper.queryArea(ids);
    }

    @Override
    public List<AreaBean> queryArea2(Integer ids) {
        return areaMapper.queryArea2(ids);
    }
}
