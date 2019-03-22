/** 
 * <pre>项目名称:ssm-maven-lzz 
 * 文件名称:LogAspect.java 
 * 包名:com.jk.lzz.service.impl 
 * 创建日期:2018年12月27日上午9:59:03 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.service.serviceimpl;

import com.jk.bean.LogBean;
import com.jk.bean.UserBean;
import com.jk.utils.CommonUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Aspect
@Component
public class LogAspect {

	@Autowired
	private MongoTemplate mongoTemplate;
	
	@Pointcut("execution(* com.jk.service..*.*(..))")
	public void logPoinCut(){}
	
	@AfterReturning(value="logPoinCut()",returning="rtv")
	public void afterLog(JoinPoint joinpoint,Object rtv){
		System.out.println("进去切点。。。。。");
		LogBean logBean = new LogBean();
		logBean.setCreateDate(new Date());
		//获取类名
		String classname = joinpoint.getTarget().getClass().getSimpleName();
		logBean.setClassName(classname);
		//获取方法名
		String method = joinpoint.getSignature().getName();
		logBean.setMethod(method);
		//获取请求参数
		String reqparam = "";
		Object[] args = joinpoint.getArgs();
		for (Object object : args) {
			reqparam+="||"+object.toString();
		}
		logBean.setReqParam(reqparam);
		//返回值
		if(rtv!=null){
			logBean.setRepParam(rtv.toString());
		}
		//获取request对象
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = requestAttributes.getRequest();
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		if(user!=null){
			logBean.setUserId(user.getUserId());
		}
		//获取ip地址
		String ip = CommonUtils.getIp(request);
		logBean.setIp(ip);
		//保存mongodb
		mongoTemplate.save(logBean);
	}
}
