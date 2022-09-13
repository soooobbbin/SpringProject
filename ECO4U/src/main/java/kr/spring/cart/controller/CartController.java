package kr.spring.cart.controller;

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
import org.springframework.web.servlet.ModelAndView;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;

@Controller
public class CartController {

	private static final Logger logger = 
			LoggerFactory.getLogger(CartController.class);
	
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Autowired
	private CartService cartService;
	
	
	
	//자바빈(VO)초기화
	@ModelAttribute
	public CartVO initCommand() {
		return new CartVO();
	}
	/*
	//=======장바구니 추가=======//
	@RequestMapping()
	*/
	

	//=======장바구니 목록=======//
	@RequestMapping(value="/cart/cart.do",method=RequestMethod.GET)
	public ModelAndView list(
						HttpSession session,
						Model model,
						@RequestParam(value="pageNum",defaultValue="1") 
						int currentPage,
						@RequestParam(value="keyfield",defaultValue="")
						String keyfield,
						@RequestParam(value="keyword",defaultValue="")
						String keyword) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		Map<String,Object> map = 
				new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("mem_num",user.getMem_num());
		
		//찜 목록의 총 개수(검색된 목록 개수)
		int count = cartService.selectRowCount(map);
		
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = 
				new PagingUtil(keyfield,keyword,currentPage,
						count,rowCount,pageCount,"cart.do");
		List<CartVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = cartService.selectList(map);
		}
		
		
		ModelAndView mav = new ModelAndView();
		//뷰이름.jsp
		mav.setViewName("cart");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("page",page.getPage());
		
		return mav;
	}
	//==========장바구니 선택 삭제=============//
	@PostMapping("/cart/deleteCart.do")
	public String delete(@RequestParam("select_product") List<Integer> list) {
		
		for(Integer cart_num : list) cartService.deleteCart(cart_num);
		return "redirect:/cart/cart.do";
	}





	//==========장바구니 개별 상품 삭제==========//
	@RequestMapping("/cart/delete.do")
	public String submitDelete(
			       @RequestParam int cart_num,
			       Model model,
			       HttpServletRequest request) {
		
		logger.debug("<<글삭제>> : " + cart_num);
		
		//장바구니삭제
		cartService.deleteCart(cart_num);
		
		//View에 표시할 메시지
		model.addAttribute("message", "선택 상품 삭제");
		model.addAttribute("url", 
				request.getContextPath()+"/cart/cart.do");
		
		return "common/resultView";
	}

	
}
