package com.jk.mapper;

import com.jk.bean.AreaBean;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AreaMapper {

    @Select("select * from kf_area where grade = #{ids}")
    List<AreaBean> queryArea(@Param("ids") Integer ids);

    @Select("select * from kf_area where parentid = #{ids}")
    List<AreaBean> queryArea2(@Param("ids") Integer ids);

    long queryAreaListSum(@Param("areaBean") AreaBean areaBean,@Param("ids") Integer ids);

    List<AreaBean> queryAreaList(@Param("start") Integer start,@Param("rows") Integer rows,@Param("areaBean") AreaBean areaBean,@Param("ids") Integer ids);

    long queryAreaListSumByPid(@Param("areaBean") AreaBean areaBean,@Param("ids")  Integer ids);

    List<AreaBean> queryAreaListByPid(@Param("start") Integer start,@Param("rows") Integer rows,@Param("areaBean") AreaBean areaBean,@Param("ids") Integer ids);

    @Select("select * from kf_area where id = #{id}")
    AreaBean queryAreaByid(Integer id);

    @Insert("INSERT INTO kf_area(createDate,modifyDate,fullName,grade,parentId,name) " +
            "VALUES(sysdate(),sysdate(),#{areaBean.fullName},#{areaBean.grade},#{areaBean.parentId},#{areaBean.name})")
    void addAreaAdd(@Param("areaBean") AreaBean areaBean);

    @Update("update kf_area set modifyDate = sysdate(),name = #{areaBean.name} where id = #{areaBean.id}")
    void updateArea(@Param("areaBean") AreaBean areaBean);
}
