package com.mysteam.action;

import com.mysteam.entity.Game;
import com.mysteam.service.GameService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;
import java.util.Map;

/**
 * Created by Tim on 2018/1/9
 */
public class GetApplyingGamesAction extends ActionSupport {
    private List<Game> applyList;
    private GameService service;

    public String getApplyingGames() {
        Map session = ActionContext.getContext().getSession();
        Map request = (Map) ActionContext.getContext().get("request");

        applyList = service.getApplyList();
        for (Game game : applyList) System.out.println(game.getGameName());
        request.put("applyList", applyList);
        return SUCCESS;
    }

    public List<Game> getApplyList() {
        return applyList;
    }

    public void setApplyList(List<Game> applyList) {
        this.applyList = applyList;
    }

    public GameService getService() {
        return service;
    }

    public void setService(GameService service) {
        this.service = service;
    }
}
