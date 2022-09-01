package kr.spring.store.controller;

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
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.vo.MemberVO;
import kr.spring.store.service.StoreService;
import kr.spring.store.vo.StoreVO;
import kr.spring.util.FileUtil;


@Controller
public class StoreController {
	private static final Logger logger = 
			LoggerFactory.getLogger(StoreController.class);
	
	@Autowired
	private StoreService storeService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public StoreVO initCommand() {
		return new StoreVO();
	}
	
	//============ 게시판 글 등록 =============//
	//등록 폼
	@GetMapping("/intro/eco4u.do")
	public String eco4uForm() {
		return "eco4u";
	}
	@GetMapping("/intro/store.do")
	public String storeForm() {
		return "store";
	}

	@GetMapping("/intro/storeRegister.do")
	public String storeRegisterForm() {
		return "storeRegister";
	}
	
	//회원가입 데이터 전송
	@PostMapping("/intro/storeRegister.do")
	public String submit(@Valid StoreVO storeVO, 
					BindingResult result, Model model) {
		logger.debug("<<가게 등록>> : " + storeVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return storeRegisterForm();
		}
		
		ModelAndView mav = new ModelAndView();
		
		if(storeVO.getPhoto_name()==null) {
			byte[] readbyte = FileUtil.getBytes(
				request.getServletContext().getRealPath("/image_bundle/no_image.png"));
			mav.addObject("imageFile", readbyte);
			mav.addObject("filename", "no_image.png");
			mav.setViewName("imageView");
		}else {
			memberVO = memberService.selectMember(user.getMem_num());
			viewProfile(memberVO, request, mav);
		}
		//회원가입
		storeService.insertStore(storeVO);
		model.addAttribute("accessMsg", "가게 등록이 완료되었습니다.");
		
		return "common/notice";
	}
	
	
	
}
