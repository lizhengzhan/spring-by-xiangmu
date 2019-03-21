package com.jk.service.serviceimpl;

import com.jk.bean.ServerBean;
import com.jk.bean.UserBean;
import com.jk.mapper.ServerMapper;
import com.jk.service.ServerService;
import com.jk.util.PageUtil;
import com.jk.util.ResultPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ServerServiceImpl implements ServerService {

    @Autowired
    private ServerMapper mapper;

    @Override
    public HashMap<String, Object> queryListPage(Integer page, Integer rows) {
        HashMap<String, Object> hashMap = new HashMap<>();
        //查询总条数
        long total = mapper.queryTotalCount();
        //查询显示信息
        //开始位置
        int start = (page-1)*rows;
        List<ServerBean> list = mapper.queryListPage(start,rows);
        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }

    @Override
    public void addServer(ServerBean serverBean) {
        if(serverBean.getId()==null){
            System.out.println(serverBean.getId());
        mapper.addServer(serverBean);
        }else {
            mapper.updateServer(serverBean);
        }
    }

    @Override
    public ServerBean queryServerById(Integer id) {
        return mapper.queryServerById(id);
    }

    @Override
    public void delServerById(int parseInt) {
        mapper.delServerById(parseInt);
    }

    @Override
    public List<UserBean> allotAuth(Integer id) {
        return mapper.allotAuth(id);
    }

    @Override
    public void updateStatus(Integer id) {
        mapper.updateStatus(id);
    }
}
