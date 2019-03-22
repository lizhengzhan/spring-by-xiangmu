package com.jk.mapper;

import com.jk.bean.YuYueBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TheMapper {

    /**
     * 订单中心查询
     * @return
     */
    @Select("select * from t_yuyue")
    List<YuYueBean> queryTheList();
}
