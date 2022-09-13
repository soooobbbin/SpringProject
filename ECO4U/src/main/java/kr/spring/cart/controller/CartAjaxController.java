package kr.spring.cart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import kr.spring.cart.service.CartService;

public class CartAjaxController {
	private static final Logger logger =
			LoggerFactory.getLogger(CartAjaxController.class);
	
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Autowired
	private CartService cartService;
	
	/*
	//===========부모글 업로드 파일 삭제===========//
	@RequestMapping("/cart/deleteCart.do")
	@ResponseBody
	public Map<String,String> processFile(
			         @RequestParam int board_num,
			                HttpSession session){
		Map<String,String> mapJson = 
				new HashMap<String,String>();
		
		MemberVO user = 
			   (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			boardService.deleteFile(board_num);
			mapJson.put("result", "success");
		}
		
		return mapJson;
	}
	*/
}
