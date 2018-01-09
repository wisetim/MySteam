package com.mysteam.service;

import com.mysteam.dao.GameDao;
import com.mysteam.entity.Game;

import java.util.List;

/**
 * Created by Tim on 2018/1/8
 */
public class GameService {
    GameDao dao;

    public int applyNewGame(Game game) {
        return dao.insertApplyNewGame(game);
    }

    public List<Game> getProducts(int userId) {
        return dao.selectGamesByDeveloper(userId);
    }

    public List<Game> getApplyList() { return dao.selectApplyingGames();}

    public GameDao getDao() {
        return dao;
    }

    public void setDao(GameDao dao) {
        this.dao = dao;
    }
}
