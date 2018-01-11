package com.mysteam.action;

import com.mysteam.dao.GameDao;
import com.mysteam.entity.Game;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Tim on 2018/1/9
 */
public class ShowCoverAction {
    private int gameId;

    public String showCover() {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("multipart/form-data");
        GameDao dao = new GameDao();
        Game game = dao.selectByGameId(gameId);
        if (game == null)
            game = dao.selectApplyingGameById(gameId);
        try (ServletOutputStream out = response.getOutputStream()) {
            out.write(game.getCover());
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }
}
