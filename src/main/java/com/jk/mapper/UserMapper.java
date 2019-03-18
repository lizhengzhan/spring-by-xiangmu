package com.jk.mapper;

import com.jk.bean.UserBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("select count(*) from t_user")
    long queryUserTotal(UserBean userBean);

    @Select("select *")
    List<UserBean> queryUser(int start, Integer rows, UserBean userBean);
}
