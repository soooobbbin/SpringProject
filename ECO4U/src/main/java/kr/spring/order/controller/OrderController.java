package kr.spring.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	private int rowCount = 5;
	private int pageCount = 10;
	
	@Autowired
	private OrderService orderService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public OrderVO initCommand() {
		return new OrderVO();
	}
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public ZipcodeVO initCommand2() {
		return new ZipcodeVO();
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

		
		Map<String,Object> zip_map = new HashMap<String,Object>();
		zip_map.put("keyfield", keyfield);
		zip_map.put("keyword", keyword);
		
		
		//주문의 총개수(검색된 글의 개수)
		int zip_count = orderService.selectZipRowCount(zip_map,user.getMem_num());
		
		logger.debug("<<count>> : " + zip_count);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,zip_count,rowCount,pageCount,"orders.do");
		
		List<ZipcodeVO> zip_list = null;
		if(zip_count > 0) {
			
			zip_map.put("mem_num",user.getMem_num());
			zip_map.put("start", page.getStartRow());
			zip_map.put("end", page.getEndRow());
			
			zip_list = orderService.selectZipList(zip_map);
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("orders");
        
		//대표 배송지 정보 가져오기
		mav.addObject("zipcode", zipcode);
		
		logger.debug("<<list>> : " + zip_list);
		
		mav.addObject("count", zip_count);
		mav.addObject("zip_list", zip_list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//============주문결제 배송시 요청사항 입력=====================//
	@PostMapping("/cart/notice.do")
	public String submit(@Valid OrderVO OrderVO,BindingResult result,HttpServletRequest request,HttpSession session,Model model) {

		logger.debug("<<배송시 요청사항 글 저장>> : " + OrderVO);

		//유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "/cart/orders.do";
		}

		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//회원번호 셋팅
		OrderVO.setMem_num(user.getMem_num());

		//글쓰기
		orderService.insertNotice(OrderVO);

		//View에 표시할 메시지
		model.addAttribute("message", "배송시 요청사항 등록이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/cart/orders.do");

		return "common/resultView";
	} 
	
	//=============주문결제 배송시 요청사항 변경====================//
	
	
	
	//=============배송지 추가 폼 이동=============================//
	@GetMapping("/cart/zipcodeInsert.do")
	public String form() {
		       //타일스 설정의 식별자
		return "zipcodeInsert";
	}
	
	//배송지 추가 데이터 전송
	@PostMapping("/cart/zipcodeInsert.do")
	public String submit(@Valid ZipcodeVO zipcode,BindingResult result, Model model, HttpServletRequest request, HttpSession session) {
		
		logger.debug("<<배송지 추가>> : " + zipcode);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//회원번호 셋팅
		zipcode.setMem_num(user.getMem_num());
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		//zipcode테이블에 추가
		orderService.insertZipcode(zipcode);
		
		model.addAttribute("message", "배송지 추가 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/cart/orders.do");
		
		return "common/resultView";
	}
	
	//================대표 배송지 변경====================//
	@GetMapping("/cart/updateauth.do")
	public String zipAuth(HttpSession session,@RequestParam(value="zip_num",defaultValue="")int zip_num,Model model,HttpServletRequest request) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		logger.debug("<<대표 배송지 변경>> : " + user.getMem_num() + " , " + zip_num);
		
		//====zipcode테이블에 auth 변경====//
		//해당 고객의 모든 배송지 auth값을 1로 변경하고 선택한 배송지 코드만 auth값을 1로 변경
		orderService.updateAuth(user.getMem_num(), zip_num);
	
		model.addAttribute("message", "대표 배송지가 변경되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/cart/orders.do");
		
		return "common/resultView";
	}
	
	//================배송지 데이터 수정==================//
	@GetMapping("/cart/zipcodeUpdate.do")
	public String updateForm(Model model,@RequestParam(value="zip_num",defaultValue="")int zip_num,HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//1건의 레코드를 구함
		ZipcodeVO zipcodeVO = orderService.selectZip(zip_num);
		
		//전송되지 않은 회원번호를 세션에서 추출
		zipcodeVO.setZip_num(zip_num);
		zipcodeVO.setMem_num(user.getMem_num());
				
		model.addAttribute("zipcodeVO", zipcodeVO);
		
		//타일스 설정의 식별자
		return "zipcodeUpdate";
	}	
	//수정폼에서 전송된 데이터 처리
	@PostMapping("/cart/zipcodeUpdate.do")
	public String submitUpdate(@Valid ZipcodeVO zipcodeVO,BindingResult result,Model model,HttpServletRequest request) {
		
		logger.debug("<<회원정보수정 처리>> : " + zipcodeVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "zipcodeUpdate";
		}
				
		//회원정보수정
		orderService.updateZipcode(zipcodeVO);
		
		model.addAttribute("message", "배송지 내용 수정되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/cart/orders.do");
		
		return "common/resultView";
	}
	
}	
