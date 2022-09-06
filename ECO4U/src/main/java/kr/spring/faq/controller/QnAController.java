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

import kr.spring.faq.service.QnAService;
import kr.spring.faq.vo.QnAVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class QnAController {
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	private int rowCount = 30;
	private int pageCount = 30;
	
	@Autowired
	private QnAService QnAService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public QnAVO initCommand() {
		return new QnAVO();
	}
	
	//===========게시판 글 등록============//
	//등록 폼
	@GetMapping("/faq/qnawrite.do")
	public String form() {
		return "qnaWrite";
	}
	//등록 폼에서 전송된 데이터 처리
	@PostMapping("/faq/qnawrite.do")
	public String submit(@Valid QnAVO QnAVO,
			BindingResult result,
			HttpServletRequest request,
			HttpSession session,
			Model model) {

		logger.debug("<<게시판 글 저장>> : " + QnAVO);

		//유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}

		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//회원번호 셋팅
		QnAVO.setMem_num(user.getMem_num());

		//글쓰기
		QnAService.insertQnA(QnAVO);

		//View에 표시할 메시지
		model.addAttribute(
				"message", "글 등록이 완료되었습니다.");
		model.addAttribute(
				"url", request.getContextPath()+"/faq/faqlist.do");

		return "common/resultView";
	}
	
}




