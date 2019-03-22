package com.jk.mapper;


import com.jk.bean.BrandBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.test.context.jdbc.Sql;

import java.util.List;


@Mapper
public interface BrandMapper {

    /**
     * 查询总条数
     * @param brand
     * @return
     */
    long queryBrandListToal(@Param("brandBean")BrandBean brandBean);

    /**
     * 分页查询
     * @param start
     * @param rows
     * @param brandBean
     * @return
     */
    List<BrandBean> queryBrandList(@Param("start") int start, @Param("rows") Integer rows, @Param("brandBean") BrandBean brandBean);


    /**
     * 新增
     * @param brand
     */
    void addBrand(BrandBean brand);



    /**
     * 批删+单删
     * @param ids
     */
    void deleteBrand(String[] ids);
}
