package com.jk.mapper;

import com.jk.bean.BrandBean;
import com.jk.bean.BuyingBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BuyingMapper {

    /**
     * 查询总条数
     * @param buyingBean
     * @return
     */
    long queryBuyingListToal(@Param("buyingBean")BuyingBean buyingBean);

    /**
     * 分页查询
     * @param start
     * @param rows
     * @param buyingBean
     * @return
     */
    List<BrandBean> queryBuyingList(@Param("start")int start,@Param("rows")Integer rows,@Param("buyingBean")BuyingBean buyingBean);

    /**
     * 删除批删
     * @param ids
     */
    void deleteBuying(String[] ids);
}
