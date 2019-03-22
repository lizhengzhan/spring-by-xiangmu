package com.jk.mapper;

import com.jk.bean.ServerBean;
import com.jk.bean.UserBean;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ServerMapper {

    @Select("select count(*) from t_server")
    Integer queryTotalCount();
    @Select("select t.id as id, t1.fullName as area, t.auth_men as authMen, t.get_money as getMoney,t.make_money as makeMoney,t.order_id as orderId,t.status as status ,t2.user_name as userWang  from t_server t,kf_area t1,t_sites_user t2 where t.adress_id = t1.id and t.user_id = t2.id limit #{start},#{rows} ")
    List<ServerBean> queryListPage(@Param("start") int start, @Param("rows")int rows);

    @Insert("insert into t_server (adress_id,auth_men,get_money,make_money,order_id,status,user_id) values (#{adressId},#{authMen},#{getMoney},#{makeMoney},#{orderId},0,#{userId})")
    void addServer(ServerBean serverBean);

    @Select("select t.id as id, t1.id as adressId, t1.parentId as pid,t2.user_name as userWang, t.auth_men as authMen, t.get_money as getMoney,t.make_money as makeMoney,t.order_id as orderId,t.status as status ,t.user_id as userId  from t_server t,kf_area t1,t_sites_user t2 where t.adress_id = t1.id and t.id = #{id} and t.user_id = t2.id")
    ServerBean queryServerById(Integer id);
    @Update("update t_server set adress_id = #{adressId},auth_men = #{authMen},get_money = #{getMoney},make_money = #{makeMoney},order_id = #{orderId},status = #{status},user_id = #{userId} where id = #{id}")
    void updateServer(ServerBean serverBean);

    @Delete("delete from t_server where id = #{parseInt}")
    void delServerById(int parseInt);

    @Select("select t.username as userName from t_user t,t_server t1 where t.areapid = t1.adress_id and t1.id = #{id} and t.roleid = 1 limit 0,9")
    List<UserBean> allotAuth(Integer id);

    @Update("update t_server set status = 1 where id=#{id}")
    void updateStatus(Integer id);
}
