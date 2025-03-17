package com.ogu1208.xmlConfig;

import com.ogu1208.common.Member;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Application {

    public static void main(String[] args) {
        ApplicationContext ac = new GenericXmlApplicationContext("appConfig.xml");

        // 1. bean name으로 가져오기
        Member member = (Member) ac.getBean("member");
        System.out.println(member);
        System.out.println(member.hashCode());

        // 2. bean의 클래스 메타 정보로 가져오기
        Member member1 = ac.getBean(Member.class);
        System.out.println(member);
        System.out.println(member.hashCode());

        // 3. bean의 id와 클래스 메타 정보를 전달해 가져오기
        Member member3 = ac.getBean("member", Member.class);
        System.out.println(member);
        System.out.println(member.hashCode());
    }
}
