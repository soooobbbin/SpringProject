package kr.spring.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {

	@RequestMapping("/cart/cart.do")
	public String main() {
				//타일스 설정 식별자
		return "cart";
	}
}
