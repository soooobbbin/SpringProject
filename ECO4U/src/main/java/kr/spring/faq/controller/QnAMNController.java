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
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class QnAMNController {
	private static final Logger logger = LoggerFactory.getLogger(QnAMNController.class);
	
	private int rowCount = 5;
	private int pageCount = 20;
	
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private MemberService memberService;
	
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public QnAVO initCommand() {
		return new QnAVO();
	}
	
	//===========문의 글 목록============//
	@RequestMapping("/faq/qnamanagementlist.do")
	public ModelAndView process(
			HttpSession session,
			@RequestParam(value="pageNum",defaultValue="1") int currentPage,
			@RequestParam(value="keyfield",defaultValue="") String keyfield,
			@RequestParam(value="category",defaultValue="") String category) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO member = memberService.selectMember(user.getMem_num());
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("category", category);
		map.put("mem_num",user.getMem_num());
		
		//글의 총개수(검색된 글의 개수)
		int count = qnaService.selectmnRowCount(map);
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,category,currentPage,count,rowCount,pageCount,"qnamanagementlist.do");
		
		List<QnAVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = qnaService.selectmnQnAList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qnaManagementList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		mav.addObject("member", member);
		
		return mav;
	}
	
	//========게시판 글상세===========//
	@RequestMapping("/faq/admindetail.do")
	public ModelAndView detail(@RequestParam int q_num) {
		
		logger.debug("<<q_num>> : " + q_num);
		QnAVO qna = qnaService.selectQnA(q_num);
		
		//내용에 줄바꿈 처리하면서 태그를 허용하지 않음
		qna.setQ_content(StringUtil.useBrNoHtml(qna.getQ_content()));
		
		return new ModelAndView("qnaManagementView","qna",qna);
	}
	
	//=========== 게시판 글 삭제 =============//
//	@RequestMapping("/faq/qnadelete.do")
//	public String submitDelete(@RequestParam int q_num,
//							HttpServletRequest request,Model model) {
//		logger.debug("<<글삭제>> : " + q_num);
//		
//		//글 삭제
//		qnaService.deleteQnA(q_num);
//		
//		//View에 표시할 메시지
//		model.addAttribute("message", "글 삭제 완료!!");
//		model.addAttribute("url", request.getContextPath()+"/faq/qnalist.do");
//		
//		return "common/resultView";
//	}
}




