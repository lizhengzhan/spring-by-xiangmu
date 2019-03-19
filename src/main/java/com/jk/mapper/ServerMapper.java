package com.jk.mapper;

import com.jk.bean.ServerBean;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ServerMapper {

    @Select("select count(*) from t_server")
    Integer queryTotalCount();
    @Select("select id as id, adress_id as adressId, auth_men as authMen, get_money as getMoney,make_money as makeMoney,order_id as orderId,status as status ,user_id as userId  from t_server limit #{start},#{rows} ")
    List<ServerBean> queryListPage(@Param("start") int start, @Param("rows")int rows);

    @Insert("insert into t_server (adress_id,auth_men,get_money,make_money,order_id,status,user_id) values (#{adressId},#{authMen},#{getMoney},#{makeMoney},#{orderId},0,#{userId})")
    void addServer(ServerBean serverBean);

    @Select("select id as id, adress_id as adressId, auth_men as authMen, get_money as getMoney,make_money as makeMoney,order_id as orderId,status as status ,user_id as userId  from t_server where id = #{id}")
    ServerBean queryServerById(Integer id);
    @Update("update t_server set adress_id = #{adressId},auth_men = #{authMen},get_money = #{getMoney},make_money = #{makeMoney},order_id = #{orderId},status = #{status},user_id = #{userId} where id = #{id}")
    void updateServer(ServerBean serverBean);

    @Delete("delete from t_server where id = #{parseInt}")
    void delServerById(int parseInt);
}
