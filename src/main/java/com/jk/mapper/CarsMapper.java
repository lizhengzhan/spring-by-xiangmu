package com.jk.mapper;

import com.jk.bean.CarsBean;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CarsMapper {

    List<CarsBean> carsList();
}
