package com.jk.service.serviceimpl;

import com.jk.bean.LogBean;
import com.jk.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

import java.util.HashMap;
import java.util.List;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public List<LogBean> queryLog() {
        return mongoTemplate.findAll(LogBean.class);
    }

    @Override
    public HashMap<String, Object> findLog(Integer page, Integer rows, LogBean logBean) {
        HashMap<String, Object> hashMap = new HashMap<>();
        Query query = new Query();
        //条件查询
        if(logBean.getUserId()!=null){
            query.addCriteria(Criteria.where("method").regex(logBean.getMethod(),"i"));
        }
        //总条数
        long count = mongoTemplate.count(query, LogBean.class);
        query.with(new Sort(Direction.DESC, "createDate"));
        query.with(new Sort(Direction.ASC, "userId"));
        // 每页条数
        query.skip((page - 1) * rows).limit(rows);
        //实现分页查询
        List<LogBean> find = mongoTemplate.find(query,LogBean.class);
        hashMap.put("total", count);
        hashMap.put("rows", find);
        return hashMap;
    }
}
