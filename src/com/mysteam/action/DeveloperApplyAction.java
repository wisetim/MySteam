package com.mysteam.action;

import com.mysteam.constant.GameState;
import com.mysteam.constant.StorageConstants;
import com.mysteam.entity.Game;
import com.mysteam.service.GameService;
import com.mysteam.util.FileUtil;
import com.mysteam.util.ImageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;

import java.io.*;
import java.util.Map;

/**
 * Created by Tim on 2018/1/8
 */
public class DeveloperApplyAction extends ActionSupport {
    private Game game;
    private File gameCover;
    private String coverName;
    private File gameFile;
    private String gameFileName;
    private int applyId;

    private GameService service;


    public String applyNew() {
        Map request = (Map) ActionContext.getContext().get("request");
        if (gameCover != null) {
            File savefile = new File(new File(StorageConstants.IMAGE_TEMP_PATH), coverName);
            try {
                FileUtils.copyFile(gameCover, savefile);
            } catch (IOException e) {
                e.printStackTrace();
            }
            game.setCover(ImageUtil.getImageBinary(savefile));
            //while (true) if (savefile.delete()) break;
        }
        if (gameFile != null) {
            game.setState(GameState.ON_APPLYING_ADD);
            int gameId = service.applyNewGame(game);
            String message = FileUtil.saveApplyingGameFile(gameId, gameFileName, gameFile);
            if (message != null) {
                request.put("message",message);
                return ERROR;
            }
        } else return ERROR;
        request.put("message","申请成功！");
        return SUCCESS;
    }

    public String cancelApply() {
        service.cancelApply(applyId);
        return SUCCESS;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public File getGameCover() {
        return gameCover;
    }

    public void setGameCover(File gameCover) {
        this.gameCover = gameCover;
    }

    public File getGameFile() {
        return gameFile;
    }

    public void setGameFile(File gameFile) {
        this.gameFile = gameFile;
    }

    public String getCoverName() {
        return coverName;
    }

    public void setCoverName(String coverName) {
        this.coverName = coverName;
    }

    public String getGameFileName() {
        return gameFileName;
    }

    public void setGameFileName(String gameFileName) {
        this.gameFileName = gameFileName;
    }

    public GameService getService() {
        return service;
    }

    public void setService(GameService service) {
        this.service = service;
    }

    public int getApplyId() {
        return applyId;
    }

    public void setApplyId(int applyId) {
        this.applyId = applyId;
    }
}
