package com.example.springweb.config;

import com.example.springweb.pojo.Login;
import com.example.springweb.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 自定义拦截器实现类，用于处理请求前的登录验证。
 */
public class MyInterceptor implements HandlerInterceptor {

    /**
     * 在请求处理之前进行调用（Controller方法调用之前）
     *
     * @param request  HTTP请求
     * @param response HTTP响应
     * @param handler  处理器对象
     * @return true表示继续流程（如调用下一个拦截器或处理器方法）；false表示中断后续操作，不再调用其他拦截器或处理器方法
     * @throws Exception 可能抛出的异常
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 获取Session对象
        HttpSession session = request.getSession();
        // 从Session中获取登录信息
        Login login = (Login) session.getAttribute("USER");
        // 判断用户是否已登录
        if (login != null) {
            // 用户已登录，放行
            return true;
        } else {
            // 用户未登录，设置提示信息
            request.setAttribute("str", "请先登录");
            // 转发到登录页面
            request.getRequestDispatcher("/login").forward(request, response);
            // 拦截请求，不再向后执行
            return false;
        }
    }

    /**
     * 请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）
     *
     * @param request      HTTP请求
     * @param response     HTTP响应
     * @param handler      处理器对象
     * @param modelAndView 模型和视图对象，可以修改
     * @throws Exception 可能抛出的异常
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // 在这里可以修改ModelAndView
    }

    /**
     * 在整个请求处理完毕后进行调用，即在DispatcherServlet渲染了对应的视图之后执行（主要用于资源清理工作）
     *
     * @param request  HTTP请求
     * @param response HTTP响应
     * @param handler  处理器对象
     * @param ex       可能抛出的异常
     * @throws Exception 可能抛出的异常
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 在这里进行资源清理工作
    }
}
