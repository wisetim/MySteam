package com.mysteam.constant;

/**
 * Created by Tim on 2017/12/28
 */
public class GameState {
    //上架申请中
    public static final short APPLYING_NEW = 0;
    //更新申请中
    public static final short APPLYING_UPDATE = 1;
    //下架申请中
    public static final short APPLYING_REMOVE = 2;
    //申请被拒绝
    public static final short APPLYING_REFUSED = 3;


    //上架中
    public static final short ON_THE_SHELF = 4;
    //已下架
    public static final short OFF_THE_SHELF = 5;


    //未购买
    public static final short NOT_PURCHASED = 0;
    //未下载
    public static final short NOT_DOWNLOADED = 1;
    //已下载
    public static final short DOWNLOADED = 2;
    //可更新
    public static final short UPDATABLE = 3;

}
