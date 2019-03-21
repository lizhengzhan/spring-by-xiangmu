package com.jk.service.serviceimpl;

import com.jk.bean.RoleBean;
import com.jk.mapper.RoleMapper;
import com.jk.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<RoleBean> queryRole() {
        return roleMapper.queryRole();
    }
}
