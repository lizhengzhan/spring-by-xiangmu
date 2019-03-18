package com.jk.mapper;

import com.jk.bean.CompanyBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface CompanyMapper {

    /**
     *      查询总条数
     * @param companyBean
     * @return
     */

    long queryUserTotal(@Param("companyBean") CompanyBean companyBean);

    /**
     * 查询企业数据
     * @param start
     * @param rows
     * @param companyBean
     * @return
     */

    List<CompanyBean> queryCompany(@Param("start") int start, @Param("rows")Integer rows, @Param("companyBean")CompanyBean companyBean);


    //新增
    void addCompany(CompanyBean companyBean);
}
