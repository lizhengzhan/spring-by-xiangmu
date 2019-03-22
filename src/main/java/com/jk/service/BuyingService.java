package com.jk.service;

import com.jk.bean.BuyingBean;

import java.util.HashMap;

public interface BuyingService {

    /**
     * 卖车查询+分页
     * @param page
     * @param rows
     * @param buyingBean
     * @return
     */
    HashMap<String, Object> queryBuyingList(Integer page, Integer rows, BuyingBean buyingBean);

    /**
     * 批删单删
     * @param ids
     */
    void deleteBuying(String[] ids);
}
