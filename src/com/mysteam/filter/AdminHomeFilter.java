package com.mysteam.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Tim on 2018/1/9
 */
public class AdminHomeFilter implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        if (req.getAttribute("applyList") == null) {
            HttpServletResponse response = (HttpServletResponse) resp;
            response.sendRedirect("getApplyingGames");
        } else chain.doFilter(req, resp);
    }
}
