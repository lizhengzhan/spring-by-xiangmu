package com.jk.mapper;

import com.jk.bean.AreaBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AreaMapper {

    @Select("select * from kf_area where grade = #{ids}")
    List<AreaBean> queryArea(@Param("ids") Integer ids);

    @Select("select * from kf_area where parentid = #{ids}")
    List<AreaBean> queryArea2(@Param("ids") Integer ids);
}
