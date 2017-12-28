package com.mysteam.dao;

import com.mysteam.entity.Game;
import com.mysteam.mapper.GameMapper;
import org.springframework.context.ApplicationContext;

/**
 * Created by Tim on 2017/12/28
 */
public class GameDao {
    private GameMapper getGameMapper() {
        ApplicationContext context = ApplicationContextSingleton.getContext();
        return (GameMapper) context.getBean("gameMapper");
    }

    public void insert(Game game) {
        GameMapper mapper = getGameMapper();
        mapper.insert(game);
    }

    public Game findByGameId(Integer gameId) {
        GameMapper mapper = getGameMapper();
        return mapper.selectByPrimaryKey(gameId);
    }
}
