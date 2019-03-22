package com.jk.controller;

import com.jk.bean.BuyingBean;
import com.jk.service.BuyingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
public class BuyingController {

    @Autowired
    private BuyingService buyingService;

    /**
     * 卖车查询+分页
     * @param page
     * @param rows
     * @param buyingBean
     * @return
     */
    @RequestMapping("queryBuyingList")
    @ResponseBody
    public HashMap<String,Object> queryBuyingList(Integer page, Integer rows, BuyingBean buyingBean){
        return buyingService.queryBuyingList(page,rows,buyingBean);
    }

    /**mm
     * 批删+单删
     * @param ids
     * @return
     */
    @RequestMapping("deleteBuying")
    @ResponseBody
    public void deleteBuying(String[] ids){
        buyingService.deleteBuying(ids);
    }

}
