package com.chen.lms.dao;

import com.chen.lms.bean.Storehouse;
import com.chen.lms.bean.StorehouseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StorehouseMapper {
    long countByExample(StorehouseExample example);

    int deleteByExample(StorehouseExample example);

    int deleteByPrimaryKey(Integer storeId);

    int insert(Storehouse record);

    int insertSelective(Storehouse record);

    List<Storehouse> selectByExampleWithBLOBs(StorehouseExample example);
  //2
    List<Storehouse> selecttype(StorehouseExample example);
    List<Storehouse> selecttypeCount();

    List<Storehouse> selectByExample(StorehouseExample example);

    Storehouse selectByPrimaryKey(Integer storeId);

    int updateByExampleSelective(@Param("record") Storehouse record, @Param("example") StorehouseExample example);

    int updateByExampleWithBLOBs(@Param("record") Storehouse record, @Param("example") StorehouseExample example);

    int updateByExample(@Param("record") Storehouse record, @Param("example") StorehouseExample example);

    int updateByPrimaryKeySelective(Storehouse record);

    int updateByPrimaryKeyWithBLOBs(Storehouse record);

    int updateByPrimaryKey(Storehouse record);
}