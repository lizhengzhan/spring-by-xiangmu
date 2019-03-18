package com.jk.service.serviceimpl;

import com.jk.bean.TreeBean;
import com.jk.mapper.TreeMapper;
import com.jk.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TreeServiceImpl implements TreeService {

    @Autowired
    private TreeMapper TreeMapper;


    @Override
    public List<TreeBean> findTree() {
        int pid = 0;
        List<TreeBean> list = findTreeNode(pid);
        return list;
    }

    private List<TreeBean> findTreeNode(int pid) {
        List<TreeBean> list = TreeMapper.findTree(pid);
        for (TreeBean treeBean : list) {
            Integer id = treeBean.getId();
            List<TreeBean> nodeList = findTreeNode(id);
            //null   []
            if(nodeList.size()<=0){
                treeBean.setSelectable(true);
            }else{
                treeBean.setNodes(nodeList);
                treeBean.setSelectable(false);
            }
        }
        return list;
    }

}
