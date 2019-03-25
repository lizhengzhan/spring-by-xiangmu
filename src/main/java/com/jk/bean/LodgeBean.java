package com.jk.bean;

import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.Date;

@Document(collection="lodge")
public class LodgeBean  implements Serializable {

    private static final long serialVersionUID = 7828521374909375741L;

    private String id;

    private Integer userId;

    private String lodgeName;

    private Date createTime;

    public String getId() {
        return id;
    }

    public Integer getUserId() {
        return userId;
    }

    public String getLodgeName() {
        return lodgeName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setLodgeName(String lodgeName) {
        this.lodgeName = lodgeName;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
