package kr.spring.product.controller;

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

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.product.service.ProductService;
import kr.spring.product.vo.P_reviewVO;
import kr.spring.product.vo.ProductVO;
import kr.spring.util.PagingUtil;

@Controller
public class ProductController {
	private static final Logger logger 
		= LoggerFactory.getLogger(ProductController.class);
	private int rowCount = 9;
	private int pageCount = 10;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService memberService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public ProductVO initCommand() {
		return new ProductVO();
	}
	
	//===========상품 등록============//
	//등록 폼
	@GetMapping("/product/write.do")
	public String form() {
		return "productWrite";
	}
	
	//등록 폼에서 전송된 데이터 처리
	@PostMapping("/product/write.do")
	public String submit(@Valid ProductVO productVO,
							BindingResult result,
							HttpServletRequest request,
							HttpSession session,
							Model model) {
		
		logger.debug("<<상품 등록>> : " + productVO);
		
		//유효성 검사 결과 오류가 있으면 폼 호출
		if (result.hasErrors()) {
			return form();
		}
		
		//상품 등록하기
		productService.insertProduct(productVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "상품 등록이 완료되었습니다.");
		model.addAttribute("url",request.getContextPath()+"/product/list.do");
		
		return "common/resultView";
	}

	
	private String category1;
	//===========상품 목록============//
	@RequestMapping("/product/list.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="category",defaultValue="100") //category코드가 비어 있을시 기존의 category1을 대신 사용(코드100)
			String category,
			@RequestParam(value="order",defaultValue="new") // order 코드 받음
			String order) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("category", category);
		map.put("order", order);
		//파라미터 category을 바로 if 절에 쓰면 에러 발생 원인 불명
		int category2 = Integer.parseInt(category);
		//category의 값 조건 체크
		if(category2 == 0 || category2 == 1 || category2 == 2 || category2 == 3) {
			//category의 값을 정상적으로 받으면 category1에 값 저장
			category1 = category;
		} else if(category2 == 100) {
			//category의 값이 없을 경우 기존에 있던 category1의 값을 사용
			category = category1;
			map.put("category", category);
		}
		
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
		mav.setViewName("list");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//========상품 상세===========//
	@RequestMapping("/product/detail.do")
	public ModelAndView detail(@RequestParam int p_num) {
		
		logger.debug("<<p_num>> : " + p_num);
		
		ProductVO product = productService.selectProduct(p_num);
		
		/*
		//제목에 태그를 허용하지 않음
		board.setTitle(
			 StringUtil.useNoHtml(board.getTitle()));
		//내용에 줄바꿈 처리하면서 태그를 허용하지 않음
		//ckeditor 사용시 아래 코드 주석 처리
		/*
		board.setContent(
		 StringUtil.useBrNoHtml(board.getContent()));
		*/
		
		                          //뷰 이름      속성명    속성값
		return new ModelAndView("productView","product",product);
	}
	
	// =========이미지 출력=========//
	@RequestMapping("/product/imageView.do")
	public ModelAndView viewImage(@RequestParam int p_num) {
		ProductVO product = productService.selectProduct(p_num);
		logger.debug("<<이미지 파라미터 확인>>: "+p_num);
		logger.debug("<<이미지 VO확인>>: "+product);
		ModelAndView mav = new ModelAndView();
		
		// 뷰 이름
		mav.setViewName("imageView");
		mav.addObject("imageFile", product.getP_photo());
		mav.addObject("filename", product.getP_photoname());
		
		logger.debug("<<ImageView 확인>>: "+mav);
		return mav;
	}
	
	// ===========상품 수정===========//
	// 수정 폼
	@GetMapping("/product/update.do")
	public String formUpdate(@RequestParam int p_num, Model model) {
		ProductVO productVO = productService.selectProduct(p_num);

		model.addAttribute("productVO", productVO);

		return "productModify";
	}

	// 수정 폼에서 전송된 데이터 처리
	@PostMapping("/product/update.do")
	public String submitUpdate(@Valid ProductVO productVO, BindingResult result, HttpServletRequest request, Model model) {
		logger.debug("<<상품 수정>> : " + productVO);

		// 유효성 체크 결과 오류가 있으면 폼 호출
		if (result.hasErrors()) {
			// title 또는 content가 입력되지 않아 유효성 체크에 걸리면
			// 파일 정보를 잃어버리기 때문에 폼을 호출할 때 다시 셋팅해 주어야 함.
			ProductVO vo = productService.selectProduct(productVO.getP_num());
			productVO.setP_photoname(vo.getP_photoname());
			
			return "productModify";
		}

		// 상품수정
		productService.updateProduct(productVO);

		// View에 표시할 메시지
		model.addAttribute("message", "상품 수정 완료");
		model.addAttribute("url", request.getContextPath() + "/product/detail.do?p_num=" + productVO.getP_num());

		return "common/resultView";
	}

	// ==========상품 삭제==========//
	@RequestMapping("/product/delete.do")
	public String submitDelete(@RequestParam int p_num, Model model, HttpServletRequest request) {

		logger.debug("<<상품 삭제>> : " + p_num);

		// 글삭제
		productService.deleteProduct(p_num);

		// View에 표시할 메시지
		model.addAttribute("message", "상품 삭제 완료");
		model.addAttribute("url", request.getContextPath() + "/product/list.do");

		return "common/resultView";
	}
	
	// ===========마이페이지 상품평 목록============//
	@RequestMapping("/product/mypageReview.do")
	public ModelAndView process(HttpSession session,
			@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyfield", defaultValue = "") String keyfield,
			@RequestParam(value = "category", defaultValue = "") String category) {

		MemberVO user = (MemberVO) session.getAttribute("user");
		MemberVO member = memberService.selectMember(user.getMem_num());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("category", category);
		map.put("mem_num", user.getMem_num());

		// 글의 총개수(검색된 글의 개수)
		int count = productService.selectMypageReviewRowCount(map);
		logger.debug("<<count>> : " + count);

		// 페이지 처리
		PagingUtil page = new PagingUtil(keyfield, category, currentPage, count, rowCount, pageCount,
				"mypageReview.do");

		List<P_reviewVO> list = null;
		if (count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());

			list = productService.selectMypageReviewList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypageReview");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		mav.addObject("member", member);

		return mav;
	}
}





