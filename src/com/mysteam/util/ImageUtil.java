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
        String fileType = filename.substring(filename.lastIndexOf('.') + 1);
        BufferedImage image;
        File cacheDirectory = new File(StorageConstants.IMAGE_TEMP_PATH);
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
}
