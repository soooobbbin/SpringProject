package kr.spring.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.vo.MemberVO;
import kr.spring.order.service.OrderService;
import kr.spring.order.vo.OrderVO;
import kr.spring.util.PagingUtil;
import kr.spring.zipcode.vo.ZipcodeVO;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	private int rowCount = 20;
	private int pageCount = 10;
	
	@Autowired
	private OrderService orderService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public OrderVO initCommand() {
		return new OrderVO();
	}
	
	//=============주문메인===============//
	//주문메인 폼 호출
	@RequestMapping("/cart/orders.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1") 
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword,
			HttpSession session) {
		
		//session에 저장된 정보 읽기
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//배송지 1건 레코드 읽기
		ZipcodeVO zipcode = orderService.selectZipcode(user.getMem_num());
			
		logger.debug("<<회원 주소지>> : " + zipcode);

		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		/*
		//주문의 총개수(검색된 글의 개수)
		int count = orderService.selectRowCount(map);
		
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"list.do");
		
		List<OrderVO> list = null;
		if(count > 0) {
			
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = orderService.selectList(map);
		}
		*/
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("orders");
       
		mav.addObject("zipcode", zipcode);
		/*
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		*/
		return mav;
	}
	
	
}	
