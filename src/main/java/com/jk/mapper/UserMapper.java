package com.jk.mapper;

import com.jk.bean.UserBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("select count(*) from t_user")
    long queryUserTotal(UserBean userBean);

    @Select("select u.*,date_format(a.createDate,'%Y-%m-%d') createDate,a.modifyDate modifyDate,a.sort sort" +
            ",a.fullName fullName,a.name name,r.text text,r.info info " +
            "from t_user u,kf_area a,t_role r where u.cityid = a.sort " +
            "and u.roleid = r.id and a.parentId = u.rolepid " +
            "limit #{start},#{rows}")
    List<UserBean> queryUser(@Param("start")int start,@Param("rows") Integer rows, UserBean userBean);
}
