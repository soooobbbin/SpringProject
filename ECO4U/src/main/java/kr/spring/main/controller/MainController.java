package kr.spring.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.community.service.CommunityService;
import kr.spring.community.vo.CommunityVO;
import kr.spring.product.controller.ProductController;
import kr.spring.product.service.ProductService;
import kr.spring.product.vo.ProductVO;
import kr.spring.util.PagingUtil;

@Controller
public class MainController {
	private static final Logger logger 
	= LoggerFactory.getLogger(MainController.class);

	@RequestMapping("/")
	public String page() {
		return "redirect:/main/main.do";
	}

	//	@RequestMapping("/main/main.do")
	//	public String main() {
	//		       //타일스 설정 식별자
	//		return "main";
	//	}
	private int rowCount = 8;
	private int pageCount = 10;

	@Autowired
	private ProductService productService;
	@Autowired
	private CommunityService communityService;

	//자바빈(VO) 초기화
	@ModelAttribute
	public ProductVO initCommand() {
		return new ProductVO();
	}

	//===========상품 목록============//
	@RequestMapping("/main/main.do")
	public ModelAndView process() {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", 1);
		map.put("end", 8);
		map.put("order", "new");

		List<ProductVO> list = productService.selectList(map);
		
		map.put("c_category", 3);
		List<CommunityVO> list2 = communityService.selectList(map);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("list", list);
		mav.addObject("list2", list2);

		return mav;
	}

}




