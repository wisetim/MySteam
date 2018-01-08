package com.mysteam.util;

import com.mysteam.constant.StorageConstants;
import org.apache.commons.io.FileUtils;
import org.jetbrains.annotations.Nullable;

import java.io.*;

/**
 * Created by Tim on 2018/1/8
 */
public class FileUtil {
    private FileUtil() {
    }

    @Nullable
    public static String getString(int gameId, String gameFileName, File gameFile) {
        File savefile = new File(new File(StorageConstants.FILE_TEMP_PATH), gameFileName);
        try {
            FileUtils.copyFile(gameFile, savefile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String directory = StorageConstants.APPLYING_NEW_PATH;
        directory = directory + "id_" + gameId;
        File file = new File(directory);
        if (!file.mkdirs()) return "游戏已存在！";

        try (InputStream inputStream = new FileInputStream(savefile);
             OutputStream outputStream
                     = new FileOutputStream(directory + "\\" + gameFileName)
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
        while (true) if (savefile.delete()) break;
        return null;
    }
}
