package com.jk.service.serviceimpl;

import com.jk.bean.YiXiangUserBean;
import com.jk.bean.YuYueBean;
import com.jk.mapper.JinRongMapper;
import com.jk.service.JinRongService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JinRongServiceImpl implements JinRongService {

    @Autowired
    private JinRongMapper jinRongMapper;


    @Override
    public List<YiXiangUserBean> queryConsumerList(String name) {
        return jinRongMapper.queryConsumerList(name);
    }

    @Override
    public void saveConsumer(YiXiangUserBean yiXiangUserBean) {
        Integer id = yiXiangUserBean.getConsumerId();
        if(id!=null){
            //修改用户信息
            jinRongMapper.updateConsumerById(yiXiangUserBean);
        }else{
            jinRongMapper.saveConsumer(yiXiangUserBean);        }
    }

    @Override
    public void delConsumer(String ids) {
        String[] idList = ids.split(",");
        jinRongMapper.delConsumer(idList);
    }

    @Override
    public YiXiangUserBean queryConsumerById(String id) {
        return jinRongMapper.queryConsumerById(id);
    }

    @Override
    public List<YuYueBean> queryYuYueList() {
        return jinRongMapper.queryYuYueList();
    }

    @Override
    public void saveYuYue(YuYueBean yuYueBean) {
        jinRongMapper.saveYuYue(yuYueBean);
    }

    @Override
    public void delYuYue(String ids) {
        String[] idList = ids.split(",");
        jinRongMapper.delYuYue(idList);
    }

    @Override
    public List<YuYueBean> queryDaiChuLiByKeFuId(String id) {
        return jinRongMapper.queryDaiChuLiByKeFuId(id);
    }

    @Override
    public List<YuYueBean> queryYiChuLiByKeFuId(String id) {
        return jinRongMapper.queryYiChuLiByKeFuId(id);
    }

    @Override
    public YuYueBean selectYuYueById(String id) {
        return jinRongMapper.selectYuYueById(id);
    }

    @Override
    public void updateYuYue(YuYueBean yuYueBean) {
        jinRongMapper.updateYuYue(yuYueBean);
    }
}
