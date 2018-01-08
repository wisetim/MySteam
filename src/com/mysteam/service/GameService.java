package com.mysteam.service;

import com.mysteam.dao.GameDao;
import com.mysteam.entity.Game;

/**
 * Created by Tim on 2018/1/8
 */
public class GameService {
    GameDao dao;

    public int applyNewGame(Game game) {
        return dao.insertApplyNewGame(game);
    }

    public GameDao getDao() {
        return dao;
    }

    public void setDao(GameDao dao) {
        this.dao = dao;
    }
}
