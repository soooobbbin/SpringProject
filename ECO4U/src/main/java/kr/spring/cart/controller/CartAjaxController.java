package kr.spring.cart.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.product.service.ProductService;
import kr.spring.product.vo.ProductVO;

@Controller
public class CartAjaxController {
	private static final Logger logger =
			LoggerFactory.getLogger(CartAjaxController.class);
	
	
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;

	
	//==========장바구니 선택 삭제=============//
	@RequestMapping("/cart/deleteCart.do")
	@ResponseBody
	public Map<String,String> processFile(
			         @RequestParam String del_product,
			                HttpSession session,
			                HttpServletRequest request){
		Map<String,String> mapJson = 
				new HashMap<String,String>();
		
		MemberVO user = 
			   (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {

			cartService.deleteCartChecked(del_product);
			
			mapJson.put("result", "success");
		}
		
		return mapJson;
	}
	//=====장바구니 결제정보창 수량 변경=====//
	
	
	
	
}

















