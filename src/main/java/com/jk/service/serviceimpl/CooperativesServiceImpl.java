package com.jk.service.serviceimpl;

import com.jk.bean.CompanyBean;
import com.jk.bean.CooperativesBean;
import com.jk.mapper.CooperativesMapper;
import com.jk.service.CooperativesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CooperativesServiceImpl  implements   CooperativesService{
    @Override
    public List<CooperativesBean> queryCooperative() {
        return null;
    }


}
