package com.chen.lms.dao;

import com.chen.lms.bean.Orst;
import com.chen.lms.bean.OrstExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrstMapper {
    long countByExample(OrstExample example);

    int deleteByExample(OrstExample example);

    int insert(Orst record);

    int insertSelective(Orst record);

    List<Orst> selectByExample(OrstExample example);
    //new
    List<Orst> SelectORCount();
    List<Orst> SelectORCount2();

    int updateByExampleSelective(@Param("record") Orst record, @Param("example") OrstExample example);

    int updateByExample(@Param("record") Orst record, @Param("example") OrstExample example);
}