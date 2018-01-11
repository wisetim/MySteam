package com.mysteam.service;

import com.mysteam.constant.GameState;
import com.mysteam.constant.StorageConstants;
import com.mysteam.dao.GameDao;
import com.mysteam.entity.Game;
import com.mysteam.util.FileUtil;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Tim on 2018/1/8
 */
public class GameService {
    private GameDao dao;

    public int applyNewGame(Game game) {
        return dao.insertApplyNewGame(game);
    }

    public void acceptApplyAddNew(int applyId) {
        int newId = dao.applyAddNewPassed(applyId);
        String applyPath = StorageConstants.APPLYING_NEW_PATH + "id_" + applyId;
        File dir = new File(applyPath);
        File storageDir = new File(StorageConstants.GAME_STORAGE_PATH + "id_" + newId);
        String[] filenames = dir.list();
        assert filenames != null;
        for (String filename : filenames) {
            File file = new File(applyPath + "\\" + filename);
            if (file.isFile()) {
                File newFile = new File(storageDir, filename);
                try {
                    FileUtils.copyFile(file, newFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        FileUtil.removeApplyingGameFile(applyId);
    }


    public void acceptApplyUpdate(int applyId) {
        //TODO 下面要改
        int newId = dao.applyUpdatePassed(applyId);
        String applyPath = StorageConstants.APPLYING_NEW_PATH + "id_" + applyId;
        File dir = new File(applyPath);
        File storageDir = new File(StorageConstants.GAME_STORAGE_PATH + "id_" + newId);
        String[] filenames = dir.list();
        assert filenames != null;
        for (String filename : filenames) {
            File file = new File(applyPath + "\\" + filename);
            if (file.isFile()) {
                File newFile = new File(storageDir, filename);
                try {
                    FileUtils.copyFile(file, newFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        FileUtil.removeApplyingGameFile(applyId);
    }

    public void refuseApplyAddNew(int applyId) {
        FileUtil.removeApplyingGameFile(applyId);
        dao.applyAddNewFailed(applyId);
    }



    public void refuseApplyUpdateOrRemove(int applyId) {
        FileUtil.removeApplyingGameFile(applyId);
        dao.applyUpdateOrRemoveFailed(applyId);
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

    public List<Game> getApplyList() {
        return dao.selectApplyingGames();
    }

    public void confirmApplyResult(int applyId) {
        Game game = dao.selectByGameId(applyId);
        if (game != null) {
            short state = (short) (game.getState()
                    &(GameState.APPLYING_UPDATE_FAILED-1)
                    &(GameState.APPLYING_REMOVE_FAILED-1));
            game.setState(state);
            dao.updateGameStateById(applyId, state);
        } else {
            dao.deleteApplyingGameById(applyId);
        }
    }

    public void cancelApply(int applyId) {
        Game game = dao.selectByGameId(applyId);
        if (game != null) {
            short state = (short) (game.getState()
                    &(GameState.ON_APPLYING_UPDATE-1)
                    &(GameState.ON_APPLYING_REMOVE-1));
            game.setState(state);
            dao.updateGameStateById(applyId, state);
        } else {
            dao.deleteApplyingGameById(applyId);
        }
    }
}
