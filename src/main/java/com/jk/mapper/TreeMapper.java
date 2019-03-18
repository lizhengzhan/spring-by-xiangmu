package com.jk.mapper;

import com.jk.bean.TreeBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TreeMapper {

    @Select("select n.id,n.text,n.pid,n.href,n.iconCls  from t_tree n where pid=#{pid}")
    List<TreeBean> findTree(int pid);
}
