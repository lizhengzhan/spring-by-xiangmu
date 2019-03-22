package com.jk.service.serviceimpl;

import com.jk.bean.BrandBean;
import com.jk.bean.BuyingBean;
import com.jk.mapper.BuyingMapper;
import com.jk.service.BuyingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BuyingServiceImpl implements BuyingService {

    @Autowired
    private BuyingMapper buyingMapper;


    @Override
    public HashMap<String, Object> queryBuyingList(Integer page, Integer rows, BuyingBean buyingBean) {
        HashMap<String, Object> hashMap = new HashMap<>();

        long total = buyingMapper.queryBuyingListToal(buyingBean);

        int start = (page-1)*rows;

        List<BrandBean> list = buyingMapper.queryBuyingList(start,rows,buyingBean);

        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }

    @Override
    public void deleteBuying(String[] ids) {
        buyingMapper.deleteBuying(ids);
    }
}
