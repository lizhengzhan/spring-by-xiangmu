package com.jk.service.serviceimpl;

import com.jk.bean.CarsBean;
import com.jk.mapper.CarsMapper;
import com.jk.service.CarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarsServiceImpl implements CarsService {

    @Autowired
    private CarsMapper carsMapper;
    @Override
    public List<CarsBean> carsList() {
        return carsMapper.carsList();
    }
}
