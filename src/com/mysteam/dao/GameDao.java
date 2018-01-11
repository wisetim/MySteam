package com.mysteam.dao;

import com.mysteam.constant.GameState;
import com.mysteam.entity.Game;
import com.mysteam.mapper.GameMapper;
import com.mysteam.tag.GameStateTag;

import java.util.ArrayList;
import java.util.Date;
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
        System.out.println(game.getGameId());
        gameMapper.insertApplyingGame(game);
        System.out.println(game.getGameId());
        return game.getGameId();
    }

    public Game selectByGameId(Integer gameId) {
        return gameMapper.selectByPrimaryKey(gameId);
    }

    public Game selectApplyingGameById(Integer gameId) {
        return gameMapper.selectApplyingGameById(gameId);
    }

    public List<Game> findByType(String type, int page, int pageSize) {
        return gameMapper.selectByType(type, (page - 1) * pageSize, pageSize);
    }

    public int getPageNumByType(String type) {
        return gameMapper.selectPageNumByType(type);
    }

    public List<Game> selectGamesByDeveloper(int userId) {
        List<Game> games = gameMapper.selectGamesByDeveloper(userId,false);
        List<Game> applyingGames = gameMapper.selectGamesByDeveloper(userId,true);
        if (games == null) games = new ArrayList<>();
        games.addAll(applyingGames);
        return games;
    }

    public List<Game> selectApplyingGames() {
        return gameMapper.selectApplyingGames();
    }

    public int applyAddNewPassed(int applyId) {
        Game applyingGame = gameMapper.selectApplyingGameById(applyId);
        applyingGame.setState(GameState.ON_SALE);
        applyingGame.setOnSaleDate(new Date());
        int newId = gameMapper.insert(applyingGame);
        gameMapper.deleteApplyingGameById(applyId);
        return newId;
    }

    public int applyUpdatePassed(int applyId) {
        Game applyingGame = gameMapper.selectApplyingGameById(applyId);
        Game game = gameMapper.selectMostSimilarGame(applyingGame);
        game.setVersion(applyingGame.getVersion());
        game.setCover(applyingGame.getCover());
        game.setPrice(applyingGame.getPrice());
        game.setIntroduction(applyingGame.getIntroduction());
        gameMapper.updateByPrimaryKey(game);

        //TODO 这里有问题

        gameMapper.deleteApplyingGameById(applyId);
        return applyId;
    }

    public void applyAddNewFailed(int applyId) {
        gameMapper.updateApplyingGameState(applyId, GameState.APPLYING_ADD_FAILED);
    }

    public void applyUpdateOrRemoveFailed(int applyId) {
        gameMapper.updateGameState(applyId, GameState.APPLYING_UPDATE_FAILED);
    }

    public void updateGameStateById(int applyId, short state) {
        Game temp = new Game();
        temp.setGameId(applyId);
        temp.setState(state);
        gameMapper.updateByPrimaryKeySelective(temp);
    }

    public void deleteApplyingGameById(int applyId) {
        gameMapper.deleteApplyingGameById(applyId);
    }
}
