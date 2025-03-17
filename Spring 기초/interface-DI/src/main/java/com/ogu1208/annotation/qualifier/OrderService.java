package com.ogu1208.annotation.qualifier;

import com.ogu1208.common.PaymentService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("orderServiceQualifier")
public class OrderService {

    private final PaymentService paymentService;

    public OrderService(@Qualifier("kakaoPaymentService") PaymentService paymentService) {
        this.paymentService = paymentService;
    }

    public void order(int amount) {
        System.out.println("🛒주문이 접수되었습니다. 총 결제 금액: " + amount + "원");
        paymentService.pay(amount);
        System.out.println("주문이 완료되었습니다! 내일 아침에 만나요👋🏻");
    }
}
