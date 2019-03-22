package com.jk.service;

import com.jk.bean.LogBean;

import java.util.HashMap;
import java.util.List;

public interface LogService {

    List<LogBean> queryLog();

    HashMap<String, Object> findLog(Integer page, Integer rows, LogBean logBean);
}
