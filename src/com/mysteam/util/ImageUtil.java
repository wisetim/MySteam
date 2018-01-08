package com.mysteam.util;

import com.mysteam.constant.StorageConstants;
import org.jetbrains.annotations.Nullable;
import sun.awt.image.PNGImageDecoder;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.Blob;

/**
 * Created by Tim on 2018/1/8
 */
public class ImageUtil {
    private ImageUtil() {
    }

    @Nullable
    public static byte[] getImageBinary(File file) {
        String filename = file.getName();
//        System.out.println(filename);
        String fileType = filename.substring(filename.lastIndexOf('.') + 1);
//        System.out.println(fileType);
        BufferedImage image;
        File cacheDirectory =
                new File(StorageConstants.IMAGE_TEMP_PATH);
        try {
            image = ImageIO.read(file);
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            //经测试转换的图片是格式这里就什么格式，否则会失真
            ImageIO.setCacheDirectory(cacheDirectory);
            ImageIO.write(image, fileType, outputStream);
            return outputStream.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean cacheImage(byte[] data, String path) {
        String fileType = path.substring(path.lastIndexOf('.') + 1);
        try {
            ByteArrayInputStream inputStream = new ByteArrayInputStream(data);
            BufferedImage image = ImageIO.read(inputStream);
            File file = new File(path);// 可以是jpg,png,gif格式
            ImageIO.write(image, fileType, file);// 不管输出什么格式图片，此处不需改动
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }
}
