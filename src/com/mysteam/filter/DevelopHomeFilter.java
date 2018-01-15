package com.mysteam.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Tim on 2018/1/8
 */
public class DevelopHomeFilter implements Filter {
    //TODO 拦截条件变化
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        if (req.getAttribute("gameProducts") == null
                || req.getAttribute("applyingProds") == null) {
            HttpServletResponse response = (HttpServletResponse) resp;
            response.sendRedirect("getGameProducts");
        } else chain.doFilter(req, resp);
    }
}
