package com.jk.mapper;

import com.jk.bean.CompanyBean;
import com.jk.bean.CooperativesBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FirmAuditMapper {

    long queryFirmAuditTotal(@Param("cooperativesBean") CooperativesBean cooperativesBean);

    List<CompanyBean> queryFirmAudit(@Param("start") int start, @Param("rows")Integer rows, @Param("cooperativesBean")CooperativesBean cooperativesBean);

    //正在审核中
    void FiemAuditVia(Integer id);
}
