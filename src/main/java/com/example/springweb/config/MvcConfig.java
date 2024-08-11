package com.example.springweb.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
/**
 * MVC配置类，实现WebMvcConfigurer接口，用于配置Spring MVC的一些功能。
 */
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    /**
     * 添加自定义的日期转换器
     *
     * @param registry 格式化器注册表
     */
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new DateConvert());
    }

    /**
     * 配置静态资源的访问路径和位置
     *
     * @param registry 资源处理器注册表
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/uploads/images/**").addResourceLocations("file:f:/uploads/images/");
    }

    /**
     * 添加自定义的拦截器
     *
     * @param registry 拦截器注册表
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new MyInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/login/**", "/register/**", "/css/**", "/images/**", "/fonts/**", "/js/**",
                        "/validMail/**", "/error/**");
    }
}
