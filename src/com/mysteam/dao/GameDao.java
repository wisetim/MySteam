package com.mysteam.dao;

import com.mysteam.constant.GameState;
import com.mysteam.entity.Game;
import com.mysteam.mapper.GameMapper;

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

    public int insertApplyGame(Game game) {
        gameMapper.insertApplyingGame(game);
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
        List<Game> games = gameMapper.selectApplyingGamesByDeveloper(userId);
        List<Game> applyingGames = gameMapper.selectOnSaleGamesByDeveloper(userId);
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
        gameMapper.insert(applyingGame);
        gameMapper.deleteApplyingGameById(applyId);
        return applyingGame.getGameId();
    }

    public int applyUpdatePassed(int applyId) {
        Game applyingGame = gameMapper.selectApplyingGameById(applyId);
        Game game = gameMapper.selectByPrimaryKey(applyingGame.getOriginId());
        game.setState((short) (game.getState() & (1023 ^ GameState.ON_APPLYING_UPDATE)));
        game.setVersion(applyingGame.getVersion());
        game.setPrice(applyingGame.getPrice());
        game.setIntroduction(applyingGame.getIntroduction());
        gameMapper.updateByPrimaryKey(game);
        gameMapper.deleteApplyingGameById(applyId);
        return game.getGameId();
    }

    public void applyAddNewFailed(int applyId) {
        gameMapper.updateApplyingGameState(applyId, GameState.APPLYING_ADD_FAILED);
    }

    public void applyUpdateFailed(int applyId) {
        gameMapper.updateApplyingGameState(applyId, GameState.APPLYING_UPDATE_FAILED);
    }

    public void applyRemoveFailed(int applyId) {
        gameMapper.updateApplyingGameState(applyId, GameState.APPLYING_REMOVE_FAILED);
    }

    public void updateGameStateById(int gameId, short state) {
        Game temp = new Game();
        temp.setGameId(gameId);
        temp.setState(state);
        gameMapper.updateByPrimaryKeySelective(temp);
    }

    public void deleteApplyingGameById(int applyId) {
        gameMapper.deleteApplyingGameById(applyId);
    }

    public Integer selectOriginIdById(int applyId) {
        return gameMapper.selectOriginIdById(applyId);
    }
}
