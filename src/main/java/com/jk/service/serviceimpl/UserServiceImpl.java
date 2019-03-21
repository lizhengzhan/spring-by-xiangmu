package com.jk.service.serviceimpl;

import com.jk.bean.UserBean;
import com.jk.mapper.UserMapper;
import com.jk.service.UserServiec;
import com.jk.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class UserServiceImpl implements UserServiec {

    @Autowired
    private UserMapper userMapper;

    @Override
    public HashMap<String, Object> queryUser(Integer page, Integer rows, UserBean userBean) {
        HashMap<String, Object> hashMap = new HashMap<>();
        //查询总条数
        long total = userMapper.queryUserTotal(userBean);
        //查询显示信息
        //开始位置
        Integer start = (page-1)*rows;
        List<UserBean> list = userMapper.queryUser(start,rows,userBean);
        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }

    @Override
    public void delUserAll(String ids) {
        String[] idList = ids.split(",");
        userMapper.delUserAll(idList);
    }

    @Override
    public void addUserAdd(UserBean userBean) {
        if(userBean.getUserId()!=null){
            //修改用户信息
            userMapper.updateUserById(userBean);
        }else{
            userBean.setPassword(MD5Util.getMD5(userBean.getPassword()));
            userMapper.addUserAdd(userBean);
        }

    }

    @Override
    public UserBean queryUserById(Integer id) {
        return userMapper.queryUserById(id);
    }

    @Override
    public void updateUserPassword(UserBean userBean) {
        userBean.setPassword(MD5Util.getMD5(userBean.getPassword()));
        userMapper.updateUserPassword(userBean);
    }
}
