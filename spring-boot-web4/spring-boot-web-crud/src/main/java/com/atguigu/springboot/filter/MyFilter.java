package com.atguigu.springboot.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * @author ChenWei
 * @create 2020-04-06-11:52
 */
public class MyFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("MyFilter process...");
        chain.doFilter(request,response);

    }

    @Override
    public void destroy() {

    }
}
