package com.example.springweb.config;

import com.alibaba.druid.util.StringUtils;
import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 自定义日期转换器，实现Spring的Converter接口，用于将String类型的日期转换为Date类型。
 */
public class DateConvert implements Converter<String, Date> {

    /**
     * 将String类型的日期转换为Date类型
     *
     * @param source String类型的日期
     * @return 转换后的Date对象，如果source为null或空字符串，则返回null
     * @throws RuntimeException 如果转换失败（如格式不符合要求），抛出RuntimeException异常
     */
    @Override
    public Date convert(String source) {
        Date target = null;
        if (!StringUtils.isEmpty(source)) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            try {
                target = format.parse(source);
            } catch (ParseException e) {
                // 如果转换失败，抛出运行时异常，包含失败的源字符串
                throw new RuntimeException(String.format("parser %s to Date fail", source));
            }
        }
        return target;
    }
}
