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
	public ModelAndView process(HttpSession session, Model model,
								@RequestParam(value="pageNum",defaultValue="1") int currentPage,
								@RequestParam(value="keyfield",defaultValue="") String keyfield,
								@RequestParam(value="keyword",defaultValue="") String keyword,
								@RequestParam (value="q_category",defaultValue="") String q_category) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO member = memberService.selectMember(user.getMem_num());
		model.addAttribute("admin", member);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("q_category", q_category);
		map.put("mem_num",user.getMem_num());
		
		//글의 총개수(검색된 글의 개수)
		int count = qnaService.selectmnRowCount(map);
		
		logger.debug("<<count>> : " + count);
		logger.debug("<<map>> : " + map);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"qnamanagementlist.do","&q_category="+q_category);
		
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
	
	//============ 게시판 글수정 =============//
	//수정 폼
	@GetMapping("/faq/qnamnupdate.do")
	public String formUpdate(@RequestParam int q_num, Model model) {
		QnAVO qnaVO = qnaService.selectQnA(q_num);
		
		model.addAttribute("qnaVO", qnaVO);
		
		return "qnaManagementModify";
	}
	//수정 폼에서 전송된 데이터 처리
	@PostMapping("/faq/qnamnupdate.do")
	public String submitUpdate(@Valid QnAVO qnaVO,BindingResult result,
								HttpServletRequest request,Model model) {
		logger.debug("<<글수정>> : " + qnaVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			/* title 또는 content가 입력되지 않아 유효성 체크에 걸리면
			 * 파일 정보를 읽어버리기 때문에 폼을 호출할 때 다시 세팅해줘야함
			 */
			QnAVO vo = qnaService.selectQnA(qnaVO.getQ_num());
			qnaVO.setQ_photo_name(vo.getQ_photo_name());
			return "qnaManagementModify";
		}
		//글 수정
		qnaService.updatemnQnA(qnaVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글 수정 완료!!");
		model.addAttribute("url", request.getContextPath()+"/faq/admindetail.do?q_num="+qnaVO.getQ_num());
		
		return "common/resultView";
	}
	
	//=========== 게시판 글 삭제 =============//
	@RequestMapping("/faq/qnamndelete.do")
	public String submitDelete(@RequestParam int q_num,
							HttpServletRequest request,Model model) {
		logger.debug("<<글삭제>> : " + q_num);
		
		//글 삭제
		qnaService.deleteQnA(q_num);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글 삭제 완료!!");
		model.addAttribute("url", request.getContextPath()+"/faq/qnamanagementlist.do");
		
		return "common/resultView";
	}
}




