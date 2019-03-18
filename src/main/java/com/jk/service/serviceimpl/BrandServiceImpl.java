package com.jk.service.serviceimpl;

import com.jk.bean.BrandBean;
import com.jk.mapper.BrandMapper;
import com.jk.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BrandServiceImpl implements BrandService {

    @Autowired
    private BrandMapper brandMapper;

    @Override
    public HashMap<String, Object> queryBrandList(Integer page, Integer rows, BrandBean brand) {
        HashMap<String, Object> hashMap = new HashMap<>();

        long total = brandMapper.queryBrandListToal(brand);

        int start = (page-1)*rows;

        List<BrandBean> list = brandMapper.queryBrandList(start,rows,brand);

        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }

    @Override
    public void addBrand(BrandBean brand) {
        brandMapper.addBrand(brand);
    }

    @Override
    public void deleteBrand(Integer id) {
        brandMapper.deleteBrand(id);
    }
}
