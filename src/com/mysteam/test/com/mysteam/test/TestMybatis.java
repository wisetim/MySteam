package com.mysteam.test;

import com.mysteam.constant.GameState;
import com.mysteam.dao.ApplicationContextSingleton;
import com.mysteam.dao.GameDao;
import com.mysteam.entity.Game;
import com.mysteam.entity.GameOrder;
import com.mysteam.entity.Review;
import com.mysteam.entity.User;
import com.mysteam.mapper.GameMapper;
import com.mysteam.mapper.GameOrderMapper;
import com.mysteam.mapper.ReviewMapper;
import com.mysteam.mapper.UserMapper;
import org.springframework.context.ApplicationContext;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Date;
import java.util.List;

/**
 * Created by Tim on 2017/12/25
 */
public class TestMybatis {

    static BASE64Encoder encoder = new sun.misc.BASE64Encoder();
    static BASE64Decoder decoder = new sun.misc.BASE64Decoder();
    public static void main(String[] args) {
        ApplicationContext context = ApplicationContextSingleton.getContext();
        UserMapper mapper = (UserMapper) context.getBean("userMapper");
//        User user = new User();
//        user.setAccount("lalala");
//        user.setPassword("lalala");
//        user.setAuthority(1);
//        user.setBalance(0.0);
//        user.setCompany("zjut");
//        user.setGender(true);
//
//        mapper.insert(user);

        User user1 = mapper.selectByAccountAndPassword("lalala","lalala");
        System.out.println(user1.getUserId());

        GameMapper mapper1 = (GameMapper) context.getBean("gameMapper");
//        Game game = new Game();
//        game.setGameName("扫雷");
//        game.setDeveloper(user1);
//        game.setState(0);
//        game.setOnSaleDate(new Date());
//        game.setPrice(10.0);
//        game.setVersion("v1.0");
//
//        mapper1.insert(game);

//        Game game = new Game();
//        game.setGameName("我自己");
//        game.setDeveloper(user1);
//        game.setState(GameState.APPLYING_NEW);
//        game.setOnSaleDate(new Date());
//        game.setPrice(20.0);
//        game.setVersion("v1.0");
//        game.setCover(getImageBinary());
//        game.setType("益智");
//        mapper1.insert(game);


//        getImageBinary();
//        Game game1 = mapper1.selectByPrimaryKey(2);
//        User developer = game1.getDeveloper();
//        System.out.println(developer.getAccount());
//        System.out.println(game1.getGameName());
//        base64StringToImage(game1.getCover());

        GameDao dao = new GameDao();
        List<Game> games =  dao.selectGamesByDeveloper(1);
        for (Game game : games) System.out.println(game.getGameName());

        GameOrderMapper mapper2 = (GameOrderMapper) context.getBean("gameOrderMapper");

//        GameOrder order = new GameOrder();
//        order.setOwner(user1);
//        order.setGame(game1);
//        order.setBuyer(user1);
//        order.setBuyDate(new Date());
//        order.setCost(0.0);
//        order.setCurVersion("v1.0");
//        order.setState(3);
//
//        mapper2.insert(order);

        GameOrder order2 = mapper2.selectByPrimaryKey(2,1);
        System.out.println(order2.getBuyer().getAccount());

        ReviewMapper mapper3 = (ReviewMapper) context.getBean("reviewMapper");

//        Review review = new Review();
//        review.setReviewer(user1);
//        review.setGame(game1);
//        review.setContent("我觉得很棒！");
//        review.setRevDate(new Date());
//        review.setScore((short)5);
//        review.setVersion("v1.0");
//
//        mapper3.insert(review);
        Review review1 = mapper3.selectByPrimaryKey(1);
        System.out.println(review1.getReviewer().getAccount());


    }

    private static byte[] getImageBinary() {
        File f = new File("D:\\image_temp\\icon.png");
        System.out.println(f.getName());
        BufferedImage bi;
        try {
            bi = ImageIO.read(f);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(bi, "png", baos);  //经测试转换的图片是格式这里就什么格式，否则会失真
            return baos.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static void base64StringToImage(byte[] data) {
        try {

            ByteArrayInputStream bais = new ByteArrayInputStream(data);
            BufferedImage bi1 = ImageIO.read(bais);
            File w2 = new File("d://test.png");// 可以是jpg,png,gif格式
            ImageIO.write(bi1, "png", w2);// 不管输出什么格式图片，此处不需改动
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
