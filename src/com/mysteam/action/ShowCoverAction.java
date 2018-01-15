package com.mysteam.action;

import com.mysteam.constant.StorageConstants;
import com.mysteam.dao.GameDao;
import com.mysteam.util.GameStoragePath;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;

/**
 * Created by Tim on 2018/1/9
 */
public class ShowCoverAction {
    private int gameId;
    private boolean onSale;

    //封面的位置有三种情况
    //1. 申请文件夹中的最新封面
    //2. 申请文件夹中没有，找到上架游戏中的封面（需要根据id进行查询）
    //3. 直接到上架游戏中根据id找
    public String showCover() {
        System.out.println(onSale);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("multipart/form-data");
        File imageFile = null;
        if (onSale) {
            imageFile = findCoverFile(StorageConstants.GAME_STORAGE_PATH, gameId);
        }
        if (imageFile == null) {
            imageFile = findCoverFile(StorageConstants.APPLYING_PATH, gameId);
        }
        if (imageFile == null) {
            GameDao dao = new GameDao();
            Integer originId = dao.selectOriginIdById(gameId);
            if (originId != null) {
                imageFile = findCoverFile(StorageConstants.GAME_STORAGE_PATH, originId);
            }
        }
        if (imageFile == null) {
            imageFile = findCoverFile(StorageConstants.GAME_STORAGE_PATH, gameId);
        }
        if (imageFile == null) return null;
        try (InputStream inputStream = new FileInputStream(imageFile);
             OutputStream writer = response.getOutputStream()) {
            byte[] buf = new byte[1024];
            int len;
            while ((len = inputStream.read(buf)) != -1) {
                writer.write(buf, 0, len);
            }
            inputStream.close();
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

    public boolean isOnSale() {
        return onSale;
    }

    public void setOnSale(boolean onSale) {
        this.onSale = onSale;
    }

    private File findCoverFile(String basePath, int gameId) {
        GameStoragePath storagePath = new GameStoragePath.Builder(basePath,
                gameId).build();
        System.out.println("---------------------------" + storagePath.getPath());
        File dir = new File(storagePath.getPath());
        File imageFile = null;
        String[] filenames = dir.list();
        if (filenames != null) {
            System.out.println(Arrays.toString(filenames));
            for (String filename : filenames)
                if (filename.startsWith("cover")) {
                    imageFile = new File(dir, filename);
                    break;
                }
        }
        return imageFile;
    }
}
