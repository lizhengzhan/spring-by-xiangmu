package com.jk.bean;

import java.util.List;

public class TreeBean {

    private Integer id;
    private String text;
    private Integer pid;
    private String href;
    private List<TreeBean> nodes;
    private Boolean selectable;
    private   String iconCls;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public List<TreeBean> getNodes() {
        return nodes;
    }

    public void setNodes(List<TreeBean> nodes) {
        this.nodes = nodes;
    }

    public Boolean getSelectable() {
        return selectable;
    }

    public void setSelectable(Boolean selectable) {
        this.selectable = selectable;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public TreeBean(Integer id, String text, Integer pid, String href, List<TreeBean> nodes, Boolean selectable, String iconCls) {
        this.id = id;
        this.text = text;
        this.pid = pid;
        this.href = href;
        this.nodes = nodes;
        this.selectable = selectable;
        this.iconCls = iconCls;
    }

    public TreeBean() {
    }

    @Override
    public String toString() {
        return "TreeBean{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", pid=" + pid +
                ", href='" + href + '\'' +
                ", nodes=" + nodes +
                ", selectable=" + selectable +
                ", iconCls='" + iconCls + '\'' +
                '}';
    }
}
