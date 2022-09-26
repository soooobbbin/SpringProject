package kr.spring.cart.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.product.service.ProductService;
import kr.spring.product.vo.ProductVO;

@Controller
public class CartController {

	private static final Logger logger = 
			LoggerFactory.getLogger(CartController.class);

	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	//자바빈(VO)초기화
	@ModelAttribute
	public CartVO initCommand() {
		return new CartVO();
	}
	
	//=======장바구니 등록 =======//
   @RequestMapping("/cart/write.do")
   @ResponseBody
   public Map<String,String> submit(CartVO cartVO, HttpSession session){
      logger.debug("<<CartVO>> : " + cartVO);
      
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
   
	//=======장바구니 목록=======//
	@RequestMapping("/cart/cart.do")
	public String list(HttpSession session, Model model,CartVO cartVO) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mem_num",user.getMem_num());
		
		
		//회원번호별 총 구매액
		int all_total = cartService.selectTotalByMem_num(user.getMem_num());
		//int cart_total = cartService.selectTotalByMem_numCart_num(map);
		
		List<CartVO> list = null;
		
		if(all_total > 0) {
			list = cartService.selectList(user.getMem_num());
		}
		
		//int order_quantity = cartService.selectOrder_quantity(map);
		//map.put("order_quantity", order_quantity);
		
		//찜 목록의 총 개수(검색된 목록 개수)
		//int count = cartService.selectRowCount(map);
		int count = cartService.selectOrder_quantity(user.getMem_num());
		
		//logger.debug("<<order_quantity>> : " + order_quantity);
		logger.debug("<<count>> : " + count);
		logger.debug("<<cartVO>> : " + cartVO);
		
		
		model.addAttribute("cartVO", cartVO);
		model.addAttribute("count", count);
		model.addAttribute("all_total", all_total);
		model.addAttribute("list", list);
		return "cart";
	}
	
   
   /*
	
   //=======장바구니 목록=======//
   @RequestMapping("/cart/cart.do")
   public ModelAndView cartList(HttpSession session,
		   						CartVO cartvo,HttpServletRequest request,
		   						Model model, HttpServletResponse response,
		   						@RequestParam(value = "cart_num", defaultValue = "") String[] cart_numArray) {
	// session에 저장된 정보 읽기
	MemberVO user = (MemberVO) session.getAttribute("user");
	   
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("mem_num", user.getMem_num());
	// int pcount = cartService.selectRowCount(map);
	// 넘어온 파라미터값의 갯수를 이용
	int pcount = cart_numArray.length;
	
	// map total에 cart_num을 넣어서 mapper에서 구하기 위해
	Map<String, Object> total = new HashMap<String, Object>();
	total.put("cart_numArray", cart_numArray);
	total.put("mem_num", user.getMem_num());
	logger.debug("<<total>> : " + total);

	int all_total = cartService.selectTotalByMem_numCart_num(total);
	logger.debug("<<all_total>> : " + all_total);
	// int all_total = cartService.selectTotalByMem_num(user.getMem_num());
	
	ModelAndView mav = new ModelAndView();

	if (all_total <= 0) {
		model.addAttribute("message", "정상적인 주문이 아니거나 상품의 수량이 부족합니다.");
		model.addAttribute("url", request.getContextPath() + "/product/list.do");
		mav.setViewName("common/resultView");
		return mav;
	}
	
	// List<CartVO> cartList = cartService.selectList(user.getMem_num());
	List<CartVO> cartList = cartService.selectOrderList(total);
	logger.debug("<<cart>> : " + cartList);

	   
	   
	   
	return mav;
}
*/
   
	
	//==========장바구니 개별 상품 삭제==========//
	@RequestMapping("/cart/delete.do")
	public String submitDelete(
			       @RequestParam int cart_num,
			       Model model,
			       HttpServletRequest request) {
		
		logger.debug("<<장바구니 개별삭제>> : " + cart_num);
		
		//장바구니삭제
		cartService.deleteCart(cart_num);
		
		//View에 표시할 메시지
		model.addAttribute("message", "상품이 삭제되었습니다.");
		model.addAttribute("url", 
				request.getContextPath()+"/cart/cart.do");
		
		return "common/resultView";
	}

	
}
