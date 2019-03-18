package com.jk.mapper;

import com.jk.bean.CompanyBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;


@Mapper
public interface CompanyMapper {

    /**
     *      查询总条数
     * @param companyBean
     * @return
     */
    @Select("select  count(*) from t_company")
    long queryUserTotal(@Param("companyBean") CompanyBean companyBean);

    /**
     * 查询企业数据
     * @param start
     * @param rows
     * @param companyBean
     * @return
     */
    @Select("SELECT\n" +
            "\tt.id id,\n" +
            "\tt.company_name as companyName,\n" +
            "\tt.company_emall as companyEmall,\n" +
            "\tcontact as contact,\n" +
            "\tcreate_time as createTime,\n" +
            "\tuser_name  as userName,\n" +
            "\tuser_id  as userIdl,\n" +
            "\tcompany_phone as companyPhone\n" +
            "FROM\n" +
            "\tt_company t \n" +
            "GROUP BY\n" +
            "\tt.id \n" +
            "\tLIMIT #{start},#{rows}")
    List<CompanyBean> queryCompany(@Param("start") int start, @Param("rows")Integer rows, @Param("companyBean")CompanyBean companyBean);


}
