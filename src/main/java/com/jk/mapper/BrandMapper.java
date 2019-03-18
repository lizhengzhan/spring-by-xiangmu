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
    @Select("select count(*) from t_brand")
    long queryBrandListToal(BrandBean brand);

    /**
     * 分页查询
     * @param start
     * @param rows
     * @param brand
     * @return
     */
    @Select("select b.*,o.old_name as oldName,c.cars_name as carsName,m.models_name as modelsName,\n" +
            "m1.mileage_name as mileageName,d.displacement_name as displaceName,b.brand_name as brandName from t_brand b\n" +
            "left join t_cars c on b.cars_id = c.id\n" +
            "left join t_old o on b.old_id = o.id\n" +
            "left join t_models m on b.models_id = m.id\n" +
            "left join t_mileage m1 on b.mileage_id = m1.id\n" +
            "left join t_displace d on b.displace_id = d.id\n" +
            "group by b.id  limit #{start},#{rows}")
    List<BrandBean> queryBrandList(@Param("start") int start, @Param("rows") Integer rows, @Param("brand") BrandBean brand);


    /**
     * 新增
     * @param brand
     */
    @Select("")
    void addBrand(BrandBean brand);

    /**
     * 删除`
     * @param id
     */
    @Select("delete from t_brand where id=#{id}")
    void deleteBrand(Integer id);
}
