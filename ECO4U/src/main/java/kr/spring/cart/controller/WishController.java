package kr.spring.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.cart.service.WishService;
import kr.spring.cart.vo.WishVO;
import kr.spring.util.PagingUtil;

@Controller
public class WishController {

	private static final Logger logger = 
			LoggerFactory.getLogger(WishController.class);
	
	private int rowCount = 20;
	private int pageCount = 10;
	
	@Autowired
	private WishService wishService;
	
	//자바빈(VO)초기화
	@ModelAttribute
	public WishVO initCommand() {
		return new WishVO();
	}
	
	
	
	//=======찜 목록=======//
	@RequestMapping(value="/cart/wishList.do",method=RequestMethod.GET)
	public ModelAndView list(
					@RequestParam(value="pageNum",defaultValue="1") 
					int currentPage,
					@RequestParam(value="keyfield",defaultValue="")
					String keyfield,
					@RequestParam(value="category",defaultValue="")
					String category) {
		
		Map<String,Object> map = 
				new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("category", category);
		
		//찜 목록의 총 개수(검색된 목록 개수)
		int count = wishService.selectRowCount(map);
		
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = 
				new PagingUtil(keyfield,category,currentPage,
						count,rowCount,pageCount,"wishList.do");
		List<WishVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = wishService.selectList(map);
		}
		
		
		ModelAndView mav = new ModelAndView();
		//뷰이름.jsp
		mav.setViewName("wishList");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("page",page.getPage());
		
		return mav;
	}
	
	
}
