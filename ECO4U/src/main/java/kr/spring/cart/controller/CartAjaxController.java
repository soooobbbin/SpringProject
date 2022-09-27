package kr.spring.cart.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Insert;
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

	
	//장바구니 리스트 뿌려주기
	@RequestMapping("/cart/modifyCartQuautityPrice.do")
	@ResponseBody
	public Map<String,Object> modifyCartQuautityPrice(@RequestParam(value = "checkArrnum", defaultValue = "100") String[] checkArrnum,
													  HttpSession session,
													  HttpServletRequest request){

		Map<String,Object> mapJson = new HashMap<String,Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		Map<String, Object> total = new HashMap<String, Object>();
		total.put("mem_num", user.getMem_num()); //고객번호
		total.put("cart_numArray", checkArrnum); //카트넘버
		//총금액
		int all_total = cartService.selectTotalByMem_numCart_num(total);
		//상품 개수
		int count = checkArrnum.length;
		
		if(all_total == 0) {
			count = 0;
		}
		
		logger.debug("<<all_total>> : " + all_total);
		logger.debug("<<count>> : " + count);
		

		
		mapJson.put("result", "success");
		mapJson.put("all_total", all_total);
		mapJson.put("count", count);
		
		
		return mapJson;
	}
	
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
	
	//=======장바구니 수량 수정========//
	@RequestMapping("/cart/modifyCart.do")
	@ResponseBody
	public Map<String,String> submitModify(CartVO cartVO,
										   HttpSession session){
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {//로그인 안된 경우
			mapAjax.put("result", "logout");
		}else {//로그인 된 경우
			//현재 구매하고자 하는 상품의 재고수를 구함
			ProductVO product = productService.selectProduct(cartVO.getP_num());
			
			logger.debug("<<cartVO.getP_num>> : "  + cartVO.getP_num());
			
			if(product.getP_status()==2) {//상품 미표시
				mapAjax.put("result", "noSale");
			}else if(product.getP_quantity() < cartVO.getOrder_quantity()) {
				//재고 부족
				mapAjax.put("result", "noQuantity");
			}else {
				//상품 수량 변경 가능
				cartService.updateCart(cartVO);
				mapAjax.put("result", "success");
			}
			
		}
		
		return mapAjax;
	}
	
	//=======장바구니 등록 =======//
   @RequestMapping("/cart/addWishToCart.do")
   @ResponseBody
   public Map<String,String> submit(CartVO cartVO, HttpSession session, HttpServletRequest request){
	   
      logger.debug("<<CartVO>> : " + cartVO);
      cartVO.setP_num(Integer.parseInt(request.getParameter("p_num")));
      cartVO.setOrder_quantity(1);
      
      Map<String,String> mapAjax = new HashMap<String,String>();
      MemberVO user = (MemberVO)session.getAttribute("user");
      if(user==null) {//로그인이 되지 않은 경우
         mapAjax.put("result", "logout");
      }else {
         cartVO.setMem_num(user.getMem_num());
         
         //기존에 등록된 동일 상품이 있는지 체크
         CartVO db_cart = cartService.selectCart(cartVO);
         if(db_cart==null) {//등록된 동일 상픔 없음
            cartService.insertCart(cartVO);
            mapAjax.put("result", "success");
         }else {
            //재고수를 구하기 위해서 Item 호출
            ProductVO product = productService.selectProduct(db_cart.getP_num());
            
            //구매수량 합산(기존 구매 수량 + 새로 입력한 구매 수량)
            int order_quantity = 
                  db_cart.getOrder_quantity()+cartVO.getOrder_quantity();
            if(product.getP_quantity()<order_quantity) {
               //상품 재고 수량보다 장바구니에 담은 구매 수량이 더 많음
               mapAjax.put("result", "overquantity");
            }else {
               cartVO.setOrder_quantity(order_quantity);
               cartService.updateCartByItem_num(cartVO);
               mapAjax.put("result", "success");
            }
         }
      }
      return mapAjax;
   }
	
	
}

















