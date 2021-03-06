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

    //回显
    CompanyBean queryCompanyById(Integer id);

//修改
    void updateCompany(CompanyBean companyBean);

    //批量删除
    void deleteAll(String[] ids);

    //联系
    void relation(Integer id);

    //等待联系
    void await(Integer id);
}
