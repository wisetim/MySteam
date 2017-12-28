package com.mysteam.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by a on 2017/10/4.
 */
public class ApplicationContextSingleton {
    private static ApplicationContext context
            = new ClassPathXmlApplicationContext("applicationContext.xml");

    private ApplicationContextSingleton() {
    }

    public static ApplicationContext getContext() {
        return context;
    }
}