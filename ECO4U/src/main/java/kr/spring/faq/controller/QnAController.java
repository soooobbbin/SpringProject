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
	
	private int rowCount = 20;
	private int pageCount = 10;
	
	@Autowired
	private QnAService qnaService;
	
	
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
	public String submit(@Valid QnAVO qnaVO,
			BindingResult result,
			HttpServletRequest request,
			HttpSession session,
			Model model) {

		logger.debug("<<1:1문의 글 저장>> : " + qnaVO);

		//유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}

		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//회원번호 셋팅
		qnaVO.setMem_num(user.getMem_num());

		//글쓰기
		qnaService.insertQnA(qnaVO);

		//View에 표시할 메시지
		model.addAttribute("message", "문의등록이 완료되었습니다.");
		model.addAttribute("url", "/faq/faqlist.do");

		return "common/resultView";
	}
	
	//===========게시판 글 목록============//
	@RequestMapping("/faq/qnalist.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1") int currentPage,
			@RequestParam(value="keyfield",defaultValue="") String keyfield,
			@RequestParam(value="category",defaultValue="") String category) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("category", category);
		
		//글의 총개수(검색된 글의 개수)
		int count = qnaService.selectRowCount(map);
		
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,category,currentPage,count,rowCount,pageCount,"qnalist.do");
		
		List<QnAVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = qnaService.selectQnAList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qnaList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
}




