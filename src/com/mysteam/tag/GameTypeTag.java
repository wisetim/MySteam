package com.mysteam.tag;

import com.mysteam.entity.Game;

/**
 * Created by Tim on 2018/1/11
 */
public class GameTypeTag {
    public static boolean isActionGame(Game game) {
        return game.getType().equals("动作");
    }

    public static boolean isPuzzleGame(Game game) {
        return game.getType().equals("动作");
    }

    public static boolean isAdventureGame(Game game) {
        return game.getType().equals("冒险");
    }
}
