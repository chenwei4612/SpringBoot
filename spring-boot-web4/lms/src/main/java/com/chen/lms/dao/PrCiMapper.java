package com.chen.lms.dao;

import com.chen.lms.bean.PrCi;
import com.chen.lms.bean.PrCiExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PrCiMapper {
    long countByExample(PrCiExample example);

    int deleteByExample(PrCiExample example);

    int insert(PrCi record);

    int insertSelective(PrCi record);

    List<PrCi> selectByExample(PrCiExample example);
    //2
    List<PrCi> selectByExampleWPC(PrCiExample example);

    int updateByExampleSelective(@Param("record") PrCi record, @Param("example") PrCiExample example);

    int updateByExample(@Param("record") PrCi record, @Param("example") PrCiExample example);
}