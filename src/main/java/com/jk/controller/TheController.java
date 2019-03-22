package com.jk.controller;



import com.jk.bean.YuYueBean;
import com.jk.service.TheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 订单中心
 */


@Controller
public class TheController {

    @Autowired
    private TheService theService;

    /**
     * 订单中心查询
     * @return
     */
    @RequestMapping("queryTheList")
    @ResponseBody
    public List<YuYueBean> queryTheList(){
        return theService.queryTheList();
    }

    @RequestMapping("toThe")
    public String toThe(){
        return "the/theList";
    }
}
