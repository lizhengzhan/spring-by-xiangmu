package com.jk.controller;

import com.jk.bean.YiXiangUserBean;
import com.jk.bean.YuYueBean;
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

    @RequestMapping("toYuYueList")
    public String toYuYueList(){
        return "jinrong/yuList";
    }

    @RequestMapping("queryYuYueList")
    @ResponseBody
    public List<YuYueBean> queryYuYueList(){
        return jinRongService.queryYuYueList();
    }

    @RequestMapping("toAddYuYue")
    public String toAddYuYue(){
        return "jinrong/yuAdd";
    }

    @RequestMapping("saveYuYue")
    @ResponseBody
    public void saveYuYue(HttpSession session, YuYueBean yuYueBean){
        jinRongService.saveYuYue(yuYueBean);
    }

    @RequestMapping("delYuYue")
    @ResponseBody
    public void delYuYue(String ids){
        jinRongService.delYuYue(ids);
    }


    @RequestMapping("toDaiChuLi")
    public String toDaiChuLi(){
        return "jinrong/daichuli";
    }

    @RequestMapping("toYiChuLi")
    public String toYiChuLi(){
        return "jinrong/yichuli";
    }

    @RequestMapping("queryDaiChuLiByKeFuId")
    @ResponseBody
    public List<YuYueBean> queryDaiChuLiByKeFuId(String id){
        return jinRongService.queryDaiChuLiByKeFuId(id);
    }

    @RequestMapping("queryYiChuLiByKeFuId")
    @ResponseBody
    public List<YuYueBean> queryYiChuLiByKeFuId(String id){
        return jinRongService.queryYiChuLiByKeFuId(id);
    }

    @RequestMapping("toUpdateYuYue1")
    public String toUpdateYuYue(){
        return "jinrong/updateYuYue";
    }

    @RequestMapping("selectYuYueById")
    @ResponseBody
    public YuYueBean selectYuYueById(String id){
        return jinRongService.selectYuYueById(id);
    }

    @RequestMapping("updateYuYue")
    @ResponseBody
    public void updateYuYue(YuYueBean yuYueBean){
        jinRongService.updateYuYue(yuYueBean);
    }




}
