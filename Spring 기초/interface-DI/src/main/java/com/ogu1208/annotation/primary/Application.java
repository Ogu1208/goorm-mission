package com.ogu1208.annotation.primary;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Application {

    public static void main(String[] args) {
        ApplicationContext ac = new AnnotationConfigApplicationContext("com.ogu1208");

        String[] beanDefinitionNames = ac.getBeanDefinitionNames();
        for (String beanNanme: beanDefinitionNames) {
            System.out.println("beanNanme = " + beanNanme);
        }

        OrderService orderService = ac.getBean("orderServicePrimary", OrderService.class);
        orderService.order(10000);
    }
}
