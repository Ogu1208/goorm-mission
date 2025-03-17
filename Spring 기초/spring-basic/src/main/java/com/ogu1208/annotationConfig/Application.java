package com.ogu1208.annotationConfig;

import com.ogu1208.common.Grade;
import com.ogu1208.common.Member;
import com.ogu1208.common.MemberRepository;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Application {

    public static void main(String[] args) {
        ApplicationContext ac = new AnnotationConfigApplicationContext(AppConfig.class);

        String[] beanNames = ac.getBeanDefinitionNames();
        for (String beanName : beanNames) {
            System.out.println("beanName = " + beanName);
        }

        MemberRepository memberRepository = ac.getBean("memberRepository", MemberRepository.class);

        memberRepository.save(new Member(1L, "오구", Grade.FAMILY));
        System.out.println(memberRepository.getMember(1L));
    }
}