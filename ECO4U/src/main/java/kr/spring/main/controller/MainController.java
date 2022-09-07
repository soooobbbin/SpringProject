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
	private int rowCount = 9;
	private int pageCount = 10;
	
	@Autowired
	private ProductService productService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public ProductVO initCommand() {
		return new ProductVO();
	}
	
	//===========상품 목록============//
		@RequestMapping("/main/main.do")
		public ModelAndView process(
				@RequestParam(value="pageNum",defaultValue="1")
				int currentPage,
				@RequestParam(value="keyfield",defaultValue="")
				String keyfield,
				@RequestParam(value="category",defaultValue="")
				String category) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("keyfield", keyfield);
			map.put("category", category);

			//상품의 총개수(검색된 상품의 개수)
			int count = productService.selectRowCount(map);

			logger.debug("<<count>> : " + count);
			
			// 페이지 처리
			PagingUtil page = new PagingUtil(keyfield, category, 
							currentPage, count, rowCount, pageCount, "list.do");

			List<ProductVO> list = null;
			if (count > 0) {

				map.put("start", page.getStartRow());
				map.put("end", page.getEndRow());

				list = productService.selectList(map);
			
			}

			ModelAndView mav = new ModelAndView();
			mav.setViewName("main");
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("page", page.getPage());
			
			return mav;
		}
	
}




