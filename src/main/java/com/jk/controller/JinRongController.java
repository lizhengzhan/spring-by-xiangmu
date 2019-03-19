package com.jk.controller;

import com.jk.bean.YiXiangUserBean;
import com.jk.service.JinRongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("jinRong")
public class JinRongController {

    @Autowired
    private JinRongService jinRongService;

    @RequestMapping("queryConsumerList")
    @ResponseBody
    public List<YiXiangUserBean> queryConsumerList(HttpSession session,String name){
        List<YiXiangUserBean> list = jinRongService.queryConsumerList(name);
        return list;
    }


    @RequestMapping("toAdd")
    public String toAdd(HttpSession session){
        return "jinrong/add";
    }

    @RequestMapping("saveConsumer")
    @ResponseBody
    public void saveConsumer(HttpSession session, YiXiangUserBean yiXiangUserBean){
       jinRongService.saveConsumer(yiXiangUserBean);
    }

    @RequestMapping("delConsumer")
    @ResponseBody
    public void delConsumer(String ids){
        jinRongService.delConsumer(ids);
    }

    @RequestMapping("toUpdate")
    public String toUpdate(HttpSession session){
        return "jinrong/add";
    }

    @RequestMapping("queryConsumerById")
    @ResponseBody
    public YiXiangUserBean queryConsumerById(String id){
        return jinRongService.queryConsumerById(id);
    }
}
