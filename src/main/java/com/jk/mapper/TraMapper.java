package com.jk.mapper;

import com.jk.bean.TraBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TraMapper {

    /**
     *查询总条数
     * @param traBean
     * @return
     */
    long queryTraListToal(@Param("traBean") TraBean traBean);

    /**
     * 查询+分页
     * @param start
     * @param rows
     * @param traBean
     * @return
     */
    List<TraBean> queryTraList(@Param("start") int start, @Param("rows") Integer rows, @Param("traBean") TraBean traBean);

    /**
     * 删除批删
     * @param ids
     */
    void deleteTra(String[] ids);

    /**
     * 新增
     * @param traBean
     */
    void addTra(TraBean traBean);

}
