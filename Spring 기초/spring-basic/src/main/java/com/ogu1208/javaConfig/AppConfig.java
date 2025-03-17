package com.ogu1208.javaConfig;

import com.ogu1208.common.Grade;
import com.ogu1208.common.Member;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

    @Bean(name = "member")
    public Member getMember() {
        return new Member(1L, "Ogu", Grade.FAMILY);
    }
}
