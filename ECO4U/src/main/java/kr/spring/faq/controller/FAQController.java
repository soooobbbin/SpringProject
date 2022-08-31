package kr.spring.faq.controller;

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

import kr.spring.faq.service.FAQService;
import kr.spring.faq.vo.FAQVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class FAQController {
	private static final Logger logger =
			         LoggerFactory.getLogger(
					          FAQController.class);
	
	@Autowired
	private FAQService FAQService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public FAQVO initCommand() {
		return new FAQVO();
	}
	
	//===========게시판 글 등록============//
	//등록 폼
	@GetMapping("/faq/faqwrite.do")
	public String form() {
		return "faqWrite";
	}
	//등록 폼에서 전송된 데이터 처리
	@PostMapping("/faq/faqwrite.do")
	public String submit(@Valid FAQVO FAQVO,
			BindingResult result,
			HttpServletRequest request,
			HttpSession session,
			Model model) {

		logger.debug("<<게시판 글 저장>> : " + FAQVO);

		//유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}

		MemberVO user = 
				(MemberVO)session.getAttribute("user");
		//회원번호 셋팅
		FAQVO.setMem_num(user.getMem_num());

		//글쓰기
		FAQService.insertBoard(FAQVO);

		//View에 표시할 메시지
		model.addAttribute(
				"message", "글 등록이 완료되었습니다.");
		model.addAttribute(
				"url", request.getContextPath()+"/faq/faqlist.do");

		return "common/resultView";
	}


	//===========게시판 글 목록============//
	@GetMapping("/faq/faqlist.do")
	public String formFaq() {
		return "faqList";
	}
	@RequestMapping("/faq/faqlist.do")
	public ModelAndView process() {

		Map<String,Object> map = new HashMap<String,Object>();

		//글의 총개수(검색된 글의 개수)
		int count = FAQService.selectRowCount(map);

		logger.debug("<<count>> : " + count);

		List<FAQVO> list = null;

		ModelAndView mav = new ModelAndView();
		mav.setViewName("FAQList");
		mav.addObject("count", count);
		mav.addObject("list", list);

		return mav;
	}
	
}




