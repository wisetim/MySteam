package com.mysteam.mapper;

import com.mysteam.entity.Game;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component("gameMapper")
public interface GameMapper {
    int deleteByPrimaryKey(Integer gameId);

    int insert(Game record);

    int insertApplyingGame(Game record);

    int insertSelective(Game record);

    Game selectByPrimaryKey(Integer gameId);

    int updateByPrimaryKeySelective(Game record);

    int updateByPrimaryKeyWithBLOBs(Game record);

    int updateByPrimaryKey(Game record);

    List<Game> selectByType (
            @Param("type") String type,
            @Param("skipRows") int skipRows,
            @Param("pageSize") int pageSize);

    int selectPageNumByType(String type);


    List<Game> selectGamesByDeveloper(
            @Param("developer") int developer,
            @Param("applying") boolean applying);

    List<Game> selectApplyingGames();

    Game selectApplyingGameById(int applyId);

    int deleteApplyingGameById(int applyId);

    int updateApplyingGameState(
            @Param("applyId") int applyId,
            @Param("state") short state);

    int updateGameState(
            @Param("applyId") int applyId,
            @Param("state") short state);

    void updateMostSimilarGame(@Param("applyingGame") Game applyingGame);

    Game selectMostSimilarGame(@Param("applyingGame") Game applyingGame);
}