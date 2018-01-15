package com.mysteam.service;

import com.mysteam.constant.GameState;
import com.mysteam.dao.GameDao;
import com.mysteam.entity.Game;
import com.mysteam.util.MyFileUtil;

import java.util.List;

/**
 * Created by Tim on 2018/1/8
 */
public class GameService {
    private GameDao dao;

    public int applyNewGame(Game game) {
        return dao.insertApplyGame(game);
    }

    public void acceptApplyAddNew(int applyId) {
        int newId = dao.applyAddNewPassed(applyId);
        MyFileUtil.moveNewFileToStorage(applyId, newId);
        MyFileUtil.removeApplyingGameFile(applyId);
    }

    public void acceptApplyUpdate(int applyId) {
        int updatedId = dao.applyUpdatePassed(applyId);
        MyFileUtil.moveUpdateFileToStorage(applyId, updatedId);
        MyFileUtil.removeApplyingGameFile(applyId);
    }

    public void acceptApplyRemove(int applyId) {
        int gameId = dao.selectOriginIdById(applyId);
        Game game = dao.selectByGameId(gameId);
        dao.updateGameStateById(gameId, (short) (game.getState()
                & (1023 ^ GameState.ON_SALE)
                & (1023 ^ GameState.ON_APPLYING_REMOVE)));
        dao.deleteApplyingGameById(applyId);
    }

    public void refuseApplyAddNew(int applyId) {
        dao.applyAddNewFailed(applyId);
    }

    public void refuseApplyUpdate(int applyId) {
        dao.applyUpdateFailed(applyId);
    }

    public void refuseApplyRemove(int applyId) {
        dao.applyRemoveFailed(applyId);
    }

    public GameDao getDao() {
        return dao;
    }

    public void setDao(GameDao dao) {
        this.dao = dao;
    }

    public List<Game> getProducts(int userId) {
        return dao.selectGamesByDeveloper(userId);
    }

    public List<Game> getApplyingProducts(int userId) {
        return dao.selectAppplyingGamesByDeveloper(userId);
    }

    public List<Game> getApplyList() {
        return dao.selectApplyingGames();
    }

    public void confirmApplyResult(int applyId) {
        Integer gameId = dao.selectOriginIdById(applyId);
        Game game = null;
        if (gameId!= null ) game = dao.selectByGameId(gameId);
        if (game != null) {
            short state = (short) (game.getState()
                    & (1023 ^ GameState.APPLYING_ADD_FAILED)
                    & (1023 ^ GameState.APPLYING_UPDATE_FAILED)
                    & (1023 ^ GameState.APPLYING_REMOVE_FAILED)
                    & (1023 ^ GameState.ON_APPLYING_ADD)
                    & (1023 ^ GameState.ON_APPLYING_UPDATE)
                    & (1023 ^ GameState.ON_APPLYING_REMOVE));
            game.setState(state);
            dao.updateGameStateById(gameId, state);
        }
        dao.deleteApplyingGameById(applyId);
        MyFileUtil.removeApplyingGameFile(applyId);
    }

    public void cancelApply(int applyId) {
        int gameId = dao.selectOriginIdById(applyId);
        Game game = dao.selectByGameId(gameId);
        if (game != null) {
            short state = (short) (game.getState()
                    & (1023 ^ GameState.ON_APPLYING_ADD)
                    & (1023 ^ GameState.ON_APPLYING_UPDATE)
                    & (1023 ^ GameState.ON_APPLYING_REMOVE));
            game.setState(state);
            dao.updateGameStateById(gameId, state);
        }
        dao.deleteApplyingGameById(applyId);
    }

    public Game getGameToUpdate(int applyId) {
        return dao.selectByGameId(applyId);
    }

    public int applyUpdateGame(Game game) {
        game.setState((short) (game.getState() | GameState.ON_APPLYING_UPDATE));
        dao.updateGameStateById(game.getGameId(), game.getState());
        game.setState((short) (game.getState() & (1023 ^ GameState.ON_SALE)));
        return dao.insertApplyGame(game);
    }

    public void applyRemoveGame(int applyId) {
        Game game = dao.selectByGameId(applyId);
        game.setState((short) (game.getState() | GameState.ON_APPLYING_REMOVE));
        dao.updateGameStateById(game.getGameId(), game.getState());
        game.setState((short) (game.getState() & (1023 ^ GameState.ON_SALE)));
        game.setOriginId(game.getGameId());
        dao.insertApplyGame(game);
    }

}