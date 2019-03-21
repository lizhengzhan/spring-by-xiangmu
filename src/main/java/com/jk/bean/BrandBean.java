package com.jk.bean;

import javax.persistence.*;

//品牌表

@Entity
@Table(name = "t_brand")
public class BrandBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String brandName;

    //车系表
    private Integer carsId;

    //车龄表
    private Integer oldId;

    //车型表
    private Integer modelsId;

    //里程表
    private Integer mileageId;

    //排量表
    private Integer displaceId;

    private  Integer  status;


    //业务字段
    @Transient
    private String carsName;
    @Transient
    private String oldName;
    @Transient
    private String modelsName;
    @Transient
    private String mileageName;
    @Transient
    private String displaceName;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public void setCarsId(Integer carsId) {
        this.carsId = carsId;
    }

    public void setOldId(Integer oldId) {
        this.oldId = oldId;
    }

    public void setModelsId(Integer modelsId) {
        this.modelsId = modelsId;
    }

    public void setMileageId(Integer mileageId) {
        this.mileageId = mileageId;
    }

    public void setDisplaceId(Integer displaceId) {
        this.displaceId = displaceId;
    }

    public Integer getId() {
        return id;
    }

    public String getBrandName() {
        return brandName;
    }

    public Integer getCarsId() {
        return carsId;
    }

    public Integer getOldId() {
        return oldId;
    }

    public Integer getModelsId() {
        return modelsId;
    }

    public Integer getMileageId() {
        return mileageId;
    }

    public Integer getDisplaceId() {
        return displaceId;
    }

    public void setCarsName(String carsName) {
        this.carsName = carsName;
    }

    public void setOldName(String oldName) {
        this.oldName = oldName;
    }

    public void setModelsName(String modelsName) {
        this.modelsName = modelsName;
    }

    public void setMileageName(String mileageName) {
        this.mileageName = mileageName;
    }

    public void setDisplaceName(String displaceName) {
        this.displaceName = displaceName;
    }

    public String getCarsName() {
        return carsName;
    }

    public String getOldName() {
        return oldName;
    }

    public String getModelsName() {
        return modelsName;
    }

    public String getMileageName() {
        return mileageName;
    }

    public String getDisplaceName() {
        return displaceName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }




}
