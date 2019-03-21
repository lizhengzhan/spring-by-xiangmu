package com.jk.mapper;

import com.jk.bean.BrandBean;
import com.jk.bean.CompanyBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CarAuditMapper {


    List<CompanyBean> queryCarAudit(@Param("start") int start, @Param("rows") Integer rows, @Param("brandBean")BrandBean brandBean);

    long queryCarAuditTotal(@Param("brandBean") BrandBean brandBean);

    void pass(Integer id);

    //认证
    void authentication(Integer id);
}
