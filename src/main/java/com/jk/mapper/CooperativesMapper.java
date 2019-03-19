package com.jk.mapper;

import com.jk.bean.CompanyBean;
import com.jk.bean.CooperativesBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface CooperativesMapper {



    long queryCooperativesTotal(@Param("cooperativesBean") CooperativesBean cooperativesBean);



    List<CompanyBean> queryCooperatives(@Param("start") int start, @Param("rows")Integer rows, @Param("cooperativesBean")CooperativesBean cooperativesBean);


    //新增
    void addCooperativen(CooperativesBean cooperativesBean);
}
