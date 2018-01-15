package com.mysteam.util;

import com.mysteam.constant.StorageConstants;

/**
 * Created by Tim on 2018/1/11
 */
public class GameStoragePath {
    private final String path;

    public static class Builder {
        private final String basePath;
        private final int gameId;

        private String type;
        private Integer developerId;

        public Builder(String basePath, int gameId) {
            this.basePath = basePath;
            this.gameId = gameId;
        }

        public Builder type(String val) {
            type = val;
            return this;
        }

        public Builder developerId(int val) {
            developerId = val;
            return this;
        }

        public GameStoragePath build() {
            return new GameStoragePath(this);
        }
    }

    public String getPath() {
        return path;
    }

    private GameStoragePath(Builder builder) {
        StringBuilder path = new StringBuilder();
        path.append(builder.basePath);
        if (builder.type != null)
            path.append("\\").append(builder.type);
        if (builder.developerId != null)
            path.append("\\dvlperId_").append(builder.developerId);
        path.append("\\id_").append(builder.gameId);
        this.path = path.toString();
    }
}
