package com.jk.mapper;

import com.jk.bean.RoleBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RoleMapper {

    @Select("select * from t_role")
    List<RoleBean> queryRole();

}
