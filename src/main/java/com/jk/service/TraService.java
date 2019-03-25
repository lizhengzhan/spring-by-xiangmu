package com.jk.service;

import com.jk.bean.TraBean;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;

public interface TraService {

    /**
     * 分页+查询
     * @param page
     * @param rows
     * @param traBean
     * @return
     */
    HashMap<String, Object> queryTraList(Integer page, Integer rows, TraBean traBean);

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
