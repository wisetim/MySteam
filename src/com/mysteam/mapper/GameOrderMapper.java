package com.mysteam.mapper;

import com.mysteam.entity.GameOrder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Mapper
@Component("gameOrderMapper")
public interface GameOrderMapper {
    int deleteByPrimaryKey(
            @Param("ownerId") Integer ownerId,
            @Param("gameId") Integer gameId
    );

    int insert(GameOrder record);

    int insertSelective(GameOrder record);

    GameOrder selectByPrimaryKey(
            @Param("ownerId") Integer ownerId,
            @Param("gameId") Integer gameId
    );

    int updateByPrimaryKeySelective(GameOrder record);

    int updateByPrimaryKey(GameOrder record);
}