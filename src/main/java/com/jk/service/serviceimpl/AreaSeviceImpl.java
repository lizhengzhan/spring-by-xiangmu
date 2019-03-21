package com.jk.service.serviceimpl;

import com.jk.bean.AreaBean;
import com.jk.mapper.AreaMapper;
import com.jk.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AreaSeviceImpl implements AreaService {

    @Autowired
    private AreaMapper areaMapper;

    @Override
    public List<AreaBean> queryArea(Integer ids) {
        return areaMapper.queryArea(ids);
    }

    @Override
    public List<AreaBean> queryArea2(Integer ids) {
        return areaMapper.queryArea2(ids);
    }

    @Override
    public HashMap<String, Object> queryAreaList(Integer page, Integer rows, AreaBean areaBean, Integer ids) {
        HashMap<String, Object> hashMap = new HashMap<>();
        long total = 0;
        List<AreaBean> list = null;
        if(ids == 0){
            //查询总条数
            total = areaMapper.queryAreaListSum(areaBean,ids);
            //查询显示信息
            //开始位置
            Integer start = (page-1)*rows;
            list = areaMapper.queryAreaList(start,rows,areaBean,ids);
        }else{
            //查询总条数
            total = areaMapper.queryAreaListSumByPid(areaBean,ids);
            //查询显示信息
            //开始位置
            Integer start = (page-1)*rows;
            list = areaMapper.queryAreaListByPid(start,rows,areaBean,ids);
        }
        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }

    @Override
    public AreaBean queryAreaByid(Integer id) {
        return areaMapper.queryAreaByid(id);
    }

    @Override
    public void addAreaAdd(AreaBean areaBean) {
        areaBean.setFullName(areaBean.getFullName()+areaBean.getName());
        if(areaBean.getId() != null){
            areaMapper.updateArea(areaBean);
        }else{
            areaMapper.addAreaAdd(areaBean);
        }
    }
}
