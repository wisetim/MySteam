package com.mysteam.util;

import com.mysteam.constant.StorageConstants;
import com.mysteam.dao.GameDao;
import com.mysteam.entity.Game;
import org.apache.commons.io.FileUtils;
import org.jetbrains.annotations.Nullable;

import java.io.*;

/**
 * Created by Tim on 2018/1/8
 */
public class MyFileUtil {
    private MyFileUtil() {
    }

    @Nullable
    public static String saveApplyingGameFile(int gameId, String gameFileName, File gameFile) {
        File saveFile = new File(new File(StorageConstants.FILE_TEMP_PATH), gameFileName);
        try {
            FileUtils.copyFile(gameFile, saveFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        GameStoragePath storagePath = new GameStoragePath.Builder(
                StorageConstants.APPLYING_PATH,
                gameId).build();
        File file = new File(storagePath.getPath());
        if (!file.mkdirs()) return "游戏已存在！";

        try (InputStream inputStream = new FileInputStream(saveFile);
             OutputStream outputStream
                     = new FileOutputStream(storagePath.getPath() + "\\" + gameFileName)
        ) {
            byte buffer[] = new byte[1024];
            int cnt;
            while ((cnt = inputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, cnt);
            }
        } catch (IOException e) {
            e.printStackTrace();
            return "游戏文件上传失败！";
        }
        while (true) if (saveFile.delete()) break;
        return null;
    }

    public static void removeApplyingGameFile(int applyId) {
        GameStoragePath storagePath = new GameStoragePath.Builder(
                StorageConstants.APPLYING_PATH,
                applyId).build();
        String applyPath = storagePath.getPath();
        File dir = new File(applyPath);
        if (dir.exists()) {
            String[] filenames = dir.list();
            assert filenames != null;
            for (String filename : filenames) {
                File file = new File(applyPath + "\\" + filename);
                if (file.isFile())
                    while (true) if (file.delete()) break;
            }
            while (true) if (dir.delete()) break;
        }
    }

    public static String saveApplyingGameCover(int gameId, String coverName, File gameCover) {
        String imageType = coverName.substring(coverName.indexOf('.'));
        coverName = "cover" + imageType;
        GameStoragePath storagePath = new GameStoragePath.Builder(
                StorageConstants.APPLYING_PATH,
                gameId).build();
        File saveCover = new File(new File(storagePath.getPath()), coverName);
        try {
            FileUtils.copyFile(gameCover, saveCover);
        } catch (IOException e) {
            e.printStackTrace();
            return "保存图片文件出错";
        }
        return null;
    }

    private static void clearCover(File storageDir) {
        String[] filenames = storageDir.list();
        assert filenames != null;
        for (String filename : filenames) {
            if (filename.startsWith("cover")) {
                File cover = new File(storageDir, filename);
                while (true) if (cover.delete()) break;
            }
        }
    }

    private static void clearGameFile(File storageDir) {
        String[] filenames = storageDir.list();
        assert filenames != null;
        for (String filename : filenames) {
            if (!filename.startsWith("cover")) {
                File file = new File(storageDir, filename);
                while (true) if (file.delete()) break;
            }
        }
    }

    private static void clearAllFile(File storageDir) {
        clearCover(storageDir);
        clearGameFile(storageDir);
    }

    private static void moveFromApplyingToStorage(String applyPath, File storageDir,
                                                  String[] filenames, Game game) {
        for (String filename : filenames) {
            if (filename.endsWith(".rar"))
                filename = game.getGameName() + "_" + game.getVersion();
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
    }

    public static void moveUpdateFileToStorage(int applyId, int updatedId) {
        GameDao dao = new GameDao();
        Game game = dao.selectByGameId(updatedId);
        GameStoragePath storagePath = new GameStoragePath.Builder(
                StorageConstants.APPLYING_PATH,
                applyId).build();
        String applyPath = storagePath.getPath();
        File applyDir = new File(applyPath);

        storagePath = new GameStoragePath.Builder(
                StorageConstants.GAME_STORAGE_PATH,
                updatedId).build();
        File storageDir = new File(storagePath.getPath());
        String[] filenames = applyDir.list();
        if (filenames != null && filenames.length > 0) {
            if (filenames.length == 1) {
                if (filenames[0].startsWith("cover")) clearCover(storageDir);
                else clearGameFile(storageDir);
            } else clearAllFile(storageDir);

            moveFromApplyingToStorage(applyPath, storageDir, filenames, game);
        }
    }

    public static void moveNewFileToStorage(int applyId, int newId) {
        GameDao dao = new GameDao();
        Game game = dao.selectByGameId(newId);
        GameStoragePath storagePath = new GameStoragePath.Builder(
                StorageConstants.APPLYING_PATH,
                applyId).build();
        String applyPath = storagePath.getPath();
        File dir = new File(applyPath);

        storagePath = new GameStoragePath.Builder(
                StorageConstants.GAME_STORAGE_PATH,
                newId).build();
        File storageDir = new File(storagePath.getPath());
        String[] filenames = dir.list();
        assert filenames != null;
        moveFromApplyingToStorage(applyPath, storageDir, filenames, game);
    }

    public static String getGameFilePath(int gameId) {
        GameStoragePath storagePath = new GameStoragePath.Builder(
                StorageConstants.APPLYING_PATH,
                gameId).build();
        File storageDir = new File(storagePath.getPath());
        String[] filenames = storageDir.list();
        if (filenames == null) return null;
        for (String filename : filenames) {
            if (filename.endsWith(".rar")) return filename;
        }
        return null;
    }

}
