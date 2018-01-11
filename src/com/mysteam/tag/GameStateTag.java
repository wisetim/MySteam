package com.mysteam.tag;

import com.mysteam.constant.GameState;
import com.mysteam.entity.Game;
import org.jetbrains.annotations.Contract;

/**
 * Created by Tim on 2018/1/9
 */
public class GameStateTag {
    @Contract(pure = true)
    public static boolean isOnSale(Game game) {
        return (game.getState() & GameState.ON_SALE) != (short) 0;
    }

    @Contract(pure = true)
    public static boolean isOnApplyingAdd(Game game) {
        return (game.getState() & GameState.ON_APPLYING_ADD) != (short) 0;
    }

    @Contract(pure = true)
    public static boolean isOnApplyingUpdate(Game game) {
        return (game.getState() & GameState.ON_APPLYING_UPDATE) != (short) 0;
    }

    @Contract(pure = true)
    public static boolean isOnApplyingRemove(Game game) {
        return (game.getState() & GameState.ON_APPLYING_REMOVE) != (short) 0;
    }

    @Contract(pure = true)
    public static boolean isApplyingAddFailed(Game game) {
        return (game.getState() & GameState.APPLYING_ADD_FAILED) != (short) 0;
    }

    @Contract(pure = true)
    public static boolean isApplyingUpdateFailed(Game game) {
        return (game.getState() & GameState.APPLYING_UPDATE_FAILED) != (short) 0;
    }

    @Contract(pure = true)
    public static boolean isApplyingRemoveFailed(Game game) {
        return (game.getState() & GameState.APPLYING_REMOVE_FAILED) != (short) 0;
    }

    public static boolean isApplyingFailed(Game game) {
        return isApplyingAddFailed(game)
                || isApplyingUpdateFailed(game)
                || isApplyingRemoveFailed(game);
    }
}
