package com.ogu1208.common;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

@Component
@Primary
public class TossPaymentService implements PaymentService {

    @Override
    public void pay(int amount) {
        System.out.println("💳TossPay로 " + amount + "원 결제가 완료되었습니다.");
    }
}
