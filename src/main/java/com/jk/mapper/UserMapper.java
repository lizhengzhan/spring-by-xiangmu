package com.jk.mapper;

import com.jk.bean.UserBean;
import org.apache.ibatis.annotations.*;

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

    @Insert("insert into t_user(username,loginnumber,password,usersex," +
            "email,userbirthday,areapid,roleid) VALUES(" +
            "#{userName},#{loginNumber},#{password}," +
            "#{userSex},#{email},#{userBirthday}," +
            "#{areapid},#{roleId})")
    void addUserAdd(UserBean userBean);

    @Select("select u.*,a.parentid grade from t_user u,kf_area a where u.areapid = a.id and u.userid = #{id}")
    UserBean queryUserById(Integer id);

    @Update("update t_user set username = #{userBean.userName}," +
            "loginnumber = #{userBean.loginNumber}," +
            "usersex = #{userBean.userSex},email = #{userBean.email}," +
            "userbirthday = #{userBean.userBirthday}," +
            "areapid = #{userBean.areapid},roleid = #{userBean.roleId} " +
            "where userid = #{userBean.userId}")
    void updateUserById(@Param("userBean") UserBean userBean);

    @Update("update t_user set password = #{userBean.password} where userid = #{userBean.userId}")
    void updateUserPassword(@Param("userBean") UserBean userBean);
}
