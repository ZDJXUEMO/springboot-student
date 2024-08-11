package com.example.springweb.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
/**
 * Druid配置类，用于配置Druid数据源和监控功能。
 */
@Configuration
public class DruidConfig {

    /**
     * 配置Druid数据源
     *
     * @return Druid数据源对象
     */
    @ConfigurationProperties(prefix = "spring.datasource")
    @Bean
    public DataSource druid() {
        return new DruidDataSource();
    }

    /**
     * 配置Druid的监控后台Servlet
     *
     * @return ServletRegistrationBean对象，用于注册Servlet
     */
    @Bean
    public ServletRegistrationBean<StatViewServlet> druidStatViewServlet() {
        ServletRegistrationBean<StatViewServlet> bean =
                new ServletRegistrationBean<>(new StatViewServlet(), "/druid/*");
        Map<String, String> initParams = new HashMap<>();
        initParams.put("loginUsername", "admin");  // 后台登录用户名
        initParams.put("loginPassword", "123456");  // 后台登录密码
        initParams.put("allow", "");  // 允许所有访问
//        initParams.put("deny", "192.168.0.101"); // 拒绝访问的IP

        bean.setInitParameters(initParams);
        return bean;
    }

    /**
     * 配置Druid的WebStatFilter，用于监控过滤器
     *
     * @return FilterRegistrationBean对象，用于注册过滤器
     */
    @Bean
    public FilterRegistrationBean<WebStatFilter> webStatFilter() {
        FilterRegistrationBean<WebStatFilter> bean = new FilterRegistrationBean<>();
        bean.setFilter(new WebStatFilter());

        Map<String, String> initParams = new HashMap<>();
        initParams.put("exclusions", "*.js,*.css,/druid/*");  // 设置过滤器排除的请求路径

        bean.setInitParameters(initParams);
        bean.setUrlPatterns(Arrays.asList("/*"));  // 拦截所有请求

        return bean;
    }
}