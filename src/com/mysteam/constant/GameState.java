package com.mysteam.constant;

/**
 * Created by Tim on 2017/12/28
 */
public class GameState {

    public static final short ON_SALE = 1; //上架中
    public static final short ON_APPLYING_ADD = 2; //上架申请中
    public static final short ON_APPLYING_UPDATE = 4; //更新申请中
    public static final short ON_APPLYING_REMOVE = 8; //下架申请中
    public static final short APPLYING_ADD_FAILED = 16; //上架申请失败
    public static final short APPLYING_UPDATE_FAILED = 32; //更新申请失败
    public static final short APPLYING_REMOVE_FAILED = 64; //下架申请失败
    public static final short PURCHARSED = 128; //已购买
    public static final short DOWNLOADED = 256; //已下载
    public static final short UPDATABLE = 512; //可更新

}
