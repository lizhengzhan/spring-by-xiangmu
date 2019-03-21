package com.jk.service;

import com.jk.bean.YiXiangUserBean;
import com.jk.bean.YuYueBean;

import java.util.List;

public interface JinRongService {
    List<YiXiangUserBean> queryConsumerList(String name);

    void saveConsumer(YiXiangUserBean yiXiangUserBean);

    void delConsumer(String ids);

    YiXiangUserBean queryConsumerById(String id);

    List<YuYueBean> queryYuYueList();

    void saveYuYue(YuYueBean yuYueBean);

    void delYuYue(String ids);

    List<YuYueBean> queryDaiChuLiByKeFuId(String id);

    List<YuYueBean> queryYiChuLiByKeFuId(String id);

    YuYueBean selectYuYueById(String id);

    void updateYuYue(YuYueBean yuYueBean);
}
