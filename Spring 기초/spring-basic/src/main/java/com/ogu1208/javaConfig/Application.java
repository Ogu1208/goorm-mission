package com.ogu1208.javaConfig;

import com.ogu1208.common.Member;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Application {

    public static void main(String[] args) {

        ApplicationContext ac = new AnnotationConfigApplicationContext(AppConfig.class);

        Member member = (Member) ac.getBean("member", Member.class);

        System.out.println(member);
    }
}
