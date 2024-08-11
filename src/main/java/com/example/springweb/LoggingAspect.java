package com.example.springweb;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Value;

@Aspect
@Component
public class LoggingAspect {

    private static final Logger logger = LoggerFactory.getLogger(LoggingAspect.class);

    @Value("${logging.level.root}")
    private String logLevel;

    @Value("${logging.file.path}")
    private String logFilePath;

    // 前置通知
    @Before("execution(* com.example.springweb.service.*.*(..))")
    public void beforeMethod(JoinPoint joinPoint) {
        if ("debug".equalsIgnoreCase(logLevel)) {
            logger.debug("Entering method: " + joinPoint.getSignature().getName());
        } else {
            logger.info("Entering method: " + joinPoint.getSignature().getName());
        }
    }

    // 异常通知
    @AfterThrowing(pointcut = "execution(* com.example.springweb.service.*.*(..))", throwing = "exception")
    public void afterThrowingMethod(JoinPoint joinPoint, Throwable exception) {
        logger.error("Exception in method: " + joinPoint.getSignature().getName(), exception);
    }
}




