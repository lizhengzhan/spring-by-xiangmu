/** 
 * <pre>项目名称:ssm-maven-wdd 
 * 文件名称:LogBean.java 
 * 包名:com.jk.wdd.pojo 
 * 创建日期:2018年12月24日下午3:42:10 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.bean;

import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;

@Document(collection="log")
public class LogBean {
	private String id;
	private Integer userId;
	private Date createDate;
	private String ip;
	private String className;
	private String method;
	private String reqParam;
	private String repParam;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getReqParam() {
		return reqParam;
	}
	public void setReqParam(String reqParam) {
		this.reqParam = reqParam;
	}
	public String getRepParam() {
		return repParam;
	}
	public void setRepParam(String repParam) {
		this.repParam = repParam;
	}
	
}
