package com.jk.service;

import com.jk.bean.YiXiangUserBean;

import java.util.List;

public interface JinRongService {
    List<YiXiangUserBean> queryConsumerList(String name);

    void saveConsumer(YiXiangUserBean yiXiangUserBean);

    void delConsumer(String ids);

    YiXiangUserBean queryConsumerById(String id);
}
