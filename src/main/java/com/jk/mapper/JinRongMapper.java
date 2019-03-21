package com.jk.mapper;

import com.jk.bean.YiXiangUserBean;
import com.jk.bean.YuYueBean;
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


    @Select("select * from t_yuyue")
    List<YuYueBean> queryYuYueList();

    @Insert("insert into t_yuyue (id,cheid,chepinpai,yuyuename,yuyuephone,kefuid,status) values " +
            "(0,#{y.cheId},#{y.chePinPai},#{y.yuYueName},#{y.yuYuePhone},#{y.keFuId},0)")
    void saveYuYue(@Param("y")YuYueBean yuYueBean);

    @Delete({
            "<script>",
            "delete from t_yuyue where id in ",
            "<foreach collection='idList' item='item' separator=',' open='(' close=')'>",
            "#{item}",
            "</foreach>",
            "</script>"
    })
    void delYuYue(@Param("idList")String[] idList);

    //@Select("select * from t_yuyue where kefuid = #{id} and status = 0")
    @Select("select * from t_yuyue where status = 0")
    List<YuYueBean> queryDaiChuLiByKeFuId(@Param("id")String id);

   // @Select("select * from t_yuyue where kefuid = #{id} and status = 1")
    @Select("select * from t_yuyue where status = 1")
    List<YuYueBean> queryYiChuLiByKeFuId(@Param("id")String id);

    @Select("select * from t_yuyue where id = #{id}")
    YuYueBean selectYuYueById(@Param("id")String id);

    @Update("update t_yuyue set yuyuetime = #{y.yuYueTime},yuyuecity = #{y.yuYueCity} where id = #{y.id}")
    void updateYuYue(@Param("y")YuYueBean yuYueBean);
}
