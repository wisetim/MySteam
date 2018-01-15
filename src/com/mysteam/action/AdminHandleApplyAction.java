package com.mysteam.action;

import com.mysteam.service.GameService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by Tim on 2018/1/9
 */
public class AdminHandleApplyAction extends ActionSupport {
    private int applyId;
    private GameService service;

    public String acceptApplyAddNew() {
        System.out.println(applyId);
        service.acceptApplyAddNew(applyId);
        return SUCCESS;
    }

    public String acceptApplyUpdate() {
        service.acceptApplyUpdate(applyId);
        return SUCCESS;
    }

    public String acceptApplyRemove() {
        service.acceptApplyRemove(applyId);
        return SUCCESS;
    }

    public String refuseApplyAddNew() {
        service.refuseApplyAddNew(applyId);
        return SUCCESS;
    }

    public String refuseApplyUpdate() {
        service.refuseApplyUpdate(applyId);
        return SUCCESS;
    }

    public String refuseApplyRemove() {
        service.refuseApplyRemove(applyId);
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
