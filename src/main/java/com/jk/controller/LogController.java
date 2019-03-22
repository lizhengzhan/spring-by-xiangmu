package com.jk.controller;

import com.jk.bean.LogBean;
import com.jk.bean.UserBean;
import com.jk.service.LogService;
import com.jk.utils.CommonUtils;
import com.jk.utils.MongUtils;
import com.mongodb.client.result.UpdateResult;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("log")
public class LogController {

    @Autowired
    private LogService logService;

    @RequestMapping("queryLog")
    @ResponseBody
    public List<LogBean> queryLog(){
        return logService.queryLog();
    }

    @ResponseBody
    @RequestMapping("findLog")
    public HashMap<String, Object> querypage(Integer page, Integer rows, LogBean logBean){
        return logService.findLog(page,rows,logBean);
    }

    @RequestMapping("delpage")
    @ResponseBody
    public void delmongo(String ids){
        String[] split = ids.split(",");
        MongUtils.delByIds("1807b","log",split);
    }

    @RequestMapping("queryLogId")
    @ResponseBody
    public Document queryLogId(String ids){
        Document findOneById = MongUtils.findOneById("1807b", "log", ids);
        findOneById.append("id",findOneById.get("_id").toString());
        return findOneById;
    }

    @RequestMapping("updateLog")
    @ResponseBody
    public void updateLog(LogBean logBean, HttpSession session){
        Document document = new Document();
        UserBean user = (UserBean) session.getAttribute("user");
        document.get("userId",user.getUserId());
        //获取request对象
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        //获取ip地址
        String ip = CommonUtils.getIp(request);
        document.get("ip",ip);
        UpdateResult log = MongUtils.updateById("1807b", "log", logBean.getId(), document);
        System.out.println(log);
    }

}
