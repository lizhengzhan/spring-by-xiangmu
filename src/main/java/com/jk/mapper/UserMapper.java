package com.jk.mapper;

import com.jk.bean.UserBean;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {

    long queryUserTotal(@Param("userBean") UserBean userBean);

    List<UserBean> queryUser(@Param("start")int start,@Param("rows") Integer rows,@Param("userBean") UserBean userBean);

    @Delete({
            "<script>",
            "delete from t_user where userid in ",
            "<foreach collection='idList' item='item' separator=',' open='(' close=')'>",
            "#{item}",
            "</foreach>",
            "</script>"
    })
    void delUserAll(@Param("idList")String[] idList);
}
