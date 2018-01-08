package com.mysteam.dao;

import com.mysteam.entity.Game;
import com.mysteam.mapper.GameMapper;

import java.util.List;

/**
 * Created by Tim on 2017/12/28
 */
public class GameDao {
    private GameMapper gameMapper;

    public GameDao() {
        gameMapper = (GameMapper) ApplicationContextSingleton.getContext()
                .getBean("gameMapper");
    }

    public void insert(Game game) {
        gameMapper.insert(game);
    }

    public int insertApplyNewGame(Game game) {
        gameMapper.insertApplyingGame(game);
        return game.getGameId();
    }

    public Game findByGameId(Integer gameId) {
        return gameMapper.selectByPrimaryKey(gameId);
    }

    public List<Game> findByType(String type, int page, int pageSize) {
        return gameMapper.selectByType(type, (page - 1) * pageSize, pageSize);
    }

    public int getPageNumByType(String type) {
        return gameMapper.selectPageNumByType(type);
    }
}
