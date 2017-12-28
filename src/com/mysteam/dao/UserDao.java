package com.mysteam.dao;

import com.mysteam.entity.User;
import com.mysteam.mapper.UserMapper;
import org.springframework.context.ApplicationContext;

/**
 * Created by Tim on 2017/12/28
 */
public class UserDao {
    private UserMapper getUserMapper() {
        ApplicationContext context = ApplicationContextSingleton.getContext();
        return (UserMapper) context.getBean("userMapper");
    }

    public void insert(User user) {
        UserMapper mapper = getUserMapper();
        mapper.insert(user);
    }

    public User findByAccountAndPassword(String account, String password) {
        UserMapper mapper = getUserMapper();
        return mapper.selectByAccountAndPassword(account,password);
    }

    public User findByUserId(Integer userId) {
        UserMapper mapper = getUserMapper();
        return mapper.selectByPrimaryKey(userId);
    }
}
