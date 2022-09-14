package kr.spring.cart.controller;

import java.sql.Array;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.product.service.ProductService;
import kr.spring.product.vo.ProductVO;
import kr.spring.util.PagingUtil;

@Controller
public class CartController {

	private static final Logger logger = 
			LoggerFactory.getLogger(CartController.class);
	
	private int rowCount = 10;
	private int pageCount = 10;
	
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
         System.out.println("eeeeeee"+ db_cart);
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
//	@RequestMapping(value="/cart/cart.do",method=RequestMethod.GET)
//	public ModelAndView list(
//						HttpSession session,
//						Model model,
//						@RequestParam(value="pageNum",defaultValue="1") 
//						int currentPage,
//						@RequestParam(value="keyfield",defaultValue="")
//						String keyfield,
//						@RequestParam(value="keyword",defaultValue="")
//						String keyword) {
//		
//		MemberVO user = (MemberVO)session.getAttribute("user");
//		
//		Map<String,Object> map = 
//				new HashMap<String,Object>();
//		map.put("keyfield", keyfield);
//		map.put("keyword", keyword);
//		map.put("mem_num",user.getMem_num());
//		
//		//찜 목록의 총 개수(검색된 목록 개수)
//		int count = cartService.selectRowCount(map);
//		
//		logger.debug("<<count>> : " + count);
//		
//		//페이지 처리
//		PagingUtil page = 
//				new PagingUtil(keyfield,keyword,currentPage,
//						count,rowCount,pageCount,"cart.do");
//		List<CartVO> list = null;
//		if(count > 0) {
//			map.put("start", page.getStartRow());
//			map.put("end", page.getEndRow());
//			
//			list = cartService.selectList(mem_num);
//		}
//		ModelAndView mav = new ModelAndView();
//		//뷰이름.jsp
//		mav.setViewName("cart");
//		mav.addObject("count",count);
//		mav.addObject("list",list);
//		mav.addObject("page",page.getPage());
//		
//		return mav;
//	}
	@RequestMapping("/cart/cart.do")
	public String list(HttpSession session, Model model) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		//회원번호별 총 구매액
		int all_total = cartService.selectTotalByMem_num(user.getMem_num());
		
		List<CartVO> list = null;
		if(all_total > 0) {
			list = cartService.selectList(user.getMem_num());
		}
		
		model.addAttribute("all_total", all_total);
		model.addAttribute("list", list);
		return "cart";
	}
	
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
		model.addAttribute("message", "선택 상품 삭제");
		model.addAttribute("url", 
				request.getContextPath()+"/cart/cart.do");
		
		return "common/resultView";
	}

	
}
