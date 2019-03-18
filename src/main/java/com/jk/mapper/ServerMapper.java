package com.jk.mapper;

import com.jk.bean.ServerBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ServerMapper {

    @Select("select count(*) from t_server")
    Integer queryTotalCount();
    @Select("select id as id, adress_id as adressId, auth_men as authMen, get_money as getMoney,make_money as makeMoney,order_id as orderId,status as status ,user_id as userId  from t_server limit #{start},#{rows} ")
    List<ServerBean> queryListPage(@Param("start") int start, @Param("rows")int rows);
}
