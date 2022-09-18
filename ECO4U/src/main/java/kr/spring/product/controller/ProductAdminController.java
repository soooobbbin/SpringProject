package kr.spring.product.controller;

import java.util.HashMap;
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

import kr.spring.product.service.ProductService;
import kr.spring.product.vo.ProductVO;


@Controller
public class ProductAdminController {
	private static final Logger logger = LoggerFactory.getLogger(ProductAdminController.class);
	
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Autowired
	private ProductService productService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public ProductVO initCommand() {
		return new ProductVO();
	}
	
	//==========상품 목록(관리자용)==========//
	@GetMapping("/product/admin_plist.do")
	public String adminList() {
		return "productAdminList";
	}
	
	//상품 등록 폼 호출
	@GetMapping("/product/admin_write.do")
	public String form() {
		return "productAdminWrite";
	}
	
	//폼에서 전송된 데이터 처리
	@PostMapping("/product/admin_write.do")
	public String submit(@Valid ProductVO vo, BindingResult result, HttpServletRequest request, HttpSession session, Model model) {
		logger.debug("<<상품등록>>: "+vo);
		
		//상품 대표사진 유효성 체크
		if(vo.getUpload()==null || vo.getUpload().isEmpty()) {
			result.rejectValue("upload", "required");
		}
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors())
			return form();
		
		//상품 등록 처리
		productService.insertProduct(vo);
		
		//View에 표시할 메시지 지정
		model.addAttribute("message","상품등록이 완료되었습니다.");
		model.addAttribute("url",request.getContextPath()+"/product/admin_plist.do");
		
		return "common/resultView";
	}
}
