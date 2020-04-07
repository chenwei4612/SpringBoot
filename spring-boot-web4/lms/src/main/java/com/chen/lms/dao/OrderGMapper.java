package com.chen.lms.dao;

import com.chen.lms.bean.OrderG;
import com.chen.lms.bean.OrderGExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderGMapper {
    long countByExample(OrderGExample example);

    int deleteByExample(OrderGExample example);

    int deleteByPrimaryKey(String ordId);

    int insert(OrderG record);

    int insertSelective(OrderG record);

    List<OrderG> selectByExampleWithBLOBs(OrderGExample example);

    List<OrderG> selectByExample(OrderGExample example);
    List<OrderG> selectByOCN();
    List<OrderG> selectByOCN2();

    OrderG selectByPrimaryKey(String ordId);

    int updateByExampleSelective(@Param("record") OrderG record, @Param("example") OrderGExample example);

    int updateByExampleWithBLOBs(@Param("record") OrderG record, @Param("example") OrderGExample example);

    int updateByExample(@Param("record") OrderG record, @Param("example") OrderGExample example);

    int updateByPrimaryKeySelective(OrderG record);

    int updateByPrimaryKeyWithBLOBs(OrderG record);

    int updateByPrimaryKey(OrderG record);
}