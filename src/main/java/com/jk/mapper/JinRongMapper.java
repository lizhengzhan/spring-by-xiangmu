package com.jk.mapper;

import com.jk.bean.YiXiangUserBean;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface JinRongMapper {


    @Select({
            "<script>",
            "select * from t_yixiang t where 1=1",
            "<if test=\"name !=null and name != \'\'\">",
            "and t.consumername like '%${name}%'",
            "</if>",
            "</script>"
    })
    List<YiXiangUserBean> queryConsumerList(@Param("name") String name);

    @Insert("insert into t_yixiang (consumerid,wangzhanid,consumername,consumercastid," +
            "consumerphone,consumercode,consumercity,consumerjob,consumerincome,kefuid) values " +
            "(0,#{y.wangZhanId},#{y.consumerName},#{y.consumerCastId},#{y.consumerPhone},#{y.consumerCode}," +
            "#{y.consumerCity},#{y.consumerJob},#{y.consumerIncome},#{y.keFuId})")
    void saveConsumer(@Param("y") YiXiangUserBean yiXiangUserBean);

    @Delete({
            "<script>",
            "delete from t_yixiang where consumerid in ",
            "<foreach collection='idList' item='item' separator=',' open='(' close=')'>",
            "#{item}",
            "</foreach>",
            "</script>"
    })
    void delConsumer(@Param("idList")String[] idList);

    @Update("update t_yixiang set consumername = #{y.consumerName},consumercastid = #{y.consumerCastId}," +
            "consumerphone = #{y.consumerPhone},consumercode = #{y.consumerCode},consumercity = #{y.consumerCity}," +
            "consumerjob = #{y.consumerJob},consumerincome = #{y.consumerIncome},kefuid = #{y.keFuId} where consumerid = #{y.consumerId}")
    void updateConsumerById(@Param("y") YiXiangUserBean yiXiangUserBean);

    @Select("select * from t_yixiang where consumerid = #{id}")
    YiXiangUserBean queryConsumerById(@Param("id") String id);
}
