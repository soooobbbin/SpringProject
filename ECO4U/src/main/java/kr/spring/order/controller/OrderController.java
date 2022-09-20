package kr.spring.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.order.service.OrderService;
import kr.spring.order.vo.OrderDetailVO;
import kr.spring.order.vo.OrderVO;
import kr.spring.product.service.ProductService;
import kr.spring.product.vo.ProductVO;
import kr.spring.util.PagingUtil;
import kr.spring.zipcode.vo.ZipcodeVO;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	private int rowCount = 5;
	private int pageCount = 10;
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;
	
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
	//장바구니에서 주문메인 폼 호출
	@RequestMapping("/cart/orders.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1") 
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword,
			HttpSession session,OrderVO orderVO,
			HttpServletRequest request,Model model,
			HttpServletResponse response) {
		
		//session에 저장된 정보 읽기
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//찜 목록의 총 개수(검색된 목록 개수)
		//배송지 1건 레코드 읽기
		ZipcodeVO zipcode = orderService.selectZipcode(user.getMem_num());
		logger.debug("<<회원 주소지>> : " + zipcode);

		
		Map<String,Object> zip_map = new HashMap<String,Object>();
		zip_map.put("keyfield", keyfield);
		zip_map.put("keyword", keyword);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mem_num",user.getMem_num());
		int pcount = cartService.selectRowCount(map);
		
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
		
		int all_total = cartService.selectTotalByMem_num(user.getMem_num());
		ModelAndView mav = new ModelAndView();
		
		if(all_total<=0) {
			model.addAttribute("message", "정상적인 주문이 아니거나 상품의 수량이 부족합니다.");
			model.addAttribute("url", request.getContextPath()+"/product/list.do");
			mav.setViewName("common/resultView");
			return mav;
		}
		List<CartVO> cartList = cartService.selectList(user.getMem_num());
		logger.debug("<<cart>> : " + cartList);
		//주문상품의 대표 상품명 생성
		String item_name = "";
		if(cartList.size()==1) {//주문 상품 1건
			item_name = cartList.get(0).getProductVO().getP_name();
		}else {//주문 상품 2건 이상
			item_name = cartList.get(0).getProductVO().getP_name() + " 외 "+
						(cartList.size()-1)+ "건";
		}
		
		//개별 상품 정보 저장
		List<OrderDetailVO> orderDetailList = new ArrayList<OrderDetailVO>();
		for(CartVO cart : cartList) {
			//상품 재고 수량 부족
			ProductVO product = productService.selectProduct(cart.getP_num());
			
			if(product.getP_status() == 2) {
				//상품 미표시
				model.addAttribute("message","["+product.getP_name()+"]상품판매 중지");
				model.addAttribute("url",request.getContextPath()+"/cart/cart.do");
				mav.setViewName("common/resultView");
				return mav;
			}
			
			if(product.getP_quantity() < cart.getOrder_quantity()) {
				//상품 재고 수량 부족
				model.addAttribute("message","["+product.getP_name()+"]재고 수량 부족으로 주문 불가");
				model.addAttribute("url",request.getContextPath()+"/cart/cart.do");
				mav.setViewName("common/resultView");
				return mav;
			}
			
			OrderDetailVO orderDetail = new OrderDetailVO();
			orderDetail.setItem_num(cart.getP_num());
			orderDetail.setItem_name(cart.getProductVO().getP_name());
			orderDetail.setItem_price(cart.getProductVO().getP_price());
			orderDetail.setOd_quantity(cart.getOrder_quantity());
			orderDetail.setItem_total(cart.getCart_total());
			
			orderDetailList.add(orderDetail);
		}//end of for문
		
		orderVO.setO_name(item_name);
		orderVO.setO_total(all_total);
		orderVO.setMem_num(user.getMem_num());
		
		//orderService.insertOrder(orderVO, orderDetailList);
		
		
		mav.setViewName("orders");
        
		//대표 배송지 정보 가져오기
		mav.addObject("zipcode", zipcode);
		
		logger.debug("<<list>> : " + zip_list);
		
		mav.addObject("all_total", all_total);
		mav.addObject("pcount", pcount);
		mav.addObject("count", zip_count);
		mav.addObject("zip_list", zip_list);
		mav.addObject("cartList", cartList);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	//상품에서 주문메인 폼 호출
	@RequestMapping("/product/orders.do")
	public ModelAndView process2(
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
