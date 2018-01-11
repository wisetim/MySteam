package com.mysteam.action;

import com.mysteam.service.GameService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by Tim on 2018/1/10
 */
public class ConfirmResultAction extends ActionSupport {
    private GameService service;
    private int applyId;

    public String confirm() {
        service.confirmApplyResult(applyId);
        return SUCCESS;
    }

    public int getApplyId() {
        return applyId;
    }

    public void setApplyId(int applyId) {
        this.applyId = applyId;
    }

    public GameService getService() {
        return service;
    }

    public void setService(GameService service) {
        this.service = service;
    }
}
