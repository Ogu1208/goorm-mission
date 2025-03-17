package com.ogu1208.common;

import org.springframework.stereotype.Component;

@Component("kakaoPaymentService")
public class KakaoPaymentService implements PaymentService{

    @Override
    public void pay(int amount) {
        System.out.println("💳KakaoPay로 " + amount + "원 결제가 완료되었습니다.");
    }
}
