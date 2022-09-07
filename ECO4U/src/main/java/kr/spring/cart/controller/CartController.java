package kr.spring.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;
import kr.spring.util.PagingUtil;

@Controller
public class CartController {

	private static final Logger logger = 
			LoggerFactory.getLogger(CartController.class);
	
	private int rowCount = 20;
	private int pageCount = 10;
	
	@Autowired
	private CartService cartService;
	
	//자바빈(VO)초기화
	@ModelAttribute
	public CartVO initCommand() {
		return new CartVO();
	}
	
	
	
	//=======찜 목록=======//
		@RequestMapping(value="/cart/cart.do",method=RequestMethod.GET)
		public ModelAndView list(
						@RequestParam(value="pageNum",defaultValue="1") 
						int currentPage,
						@RequestParam(value="keyfield",defaultValue="")
						String keyfield,
						@RequestParam(value="keyword",defaultValue="")
						String keyword) {
			
			Map<String,Object> map = 
					new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			
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
	
	
}
