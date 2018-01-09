package com.mysteam.action;

import com.mysteam.entity.Game;
import com.mysteam.entity.User;
import com.mysteam.service.GameService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;
import java.util.Map;

/**
 * Created by Tim on 2018/1/8
 */
public class GetGameProductsAction extends ActionSupport {
    private List<Game> productions;
    private GameService service;

    public String getGameProducts() {
        Map session = ActionContext.getContext().getSession();
        Map request = (Map) ActionContext.getContext().get("request");
        User developer = (User) session.get("user");
//        productions = service.getProducts(developer.getUserId());
        productions = service.getProducts(1);
        for (Game game : productions) System.out.println(game.getGameName());
        request.put("gameProducts", productions);
        return productions != null ? SUCCESS : ERROR;
    }

    public GameService getService() {
        return service;
    }

    public void setService(GameService service) {
        this.service = service;
    }

    public List<Game> getProductions() {
        return productions;
    }

    public void setProductions(List<Game> productions) {
        this.productions = productions;
    }
}
