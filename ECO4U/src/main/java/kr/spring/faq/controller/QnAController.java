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
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	private int rowCount = 5;
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
		model.addAttribute("url", request.getContextPath()+"/faq/qnalist.do");

		return "common/resultView";
	}
	
	//===========게시판 글 목록============//
	@RequestMapping(value="/faq/qnalist.do",method=RequestMethod.GET)
	public ModelAndView process(
			HttpSession session,
			@RequestParam(value="pageNum",defaultValue="1") int currentPage,
			@RequestParam(value="keyfield",defaultValue="") String keyfield,
			@RequestParam(value="category",defaultValue="") String category) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("category", category);
		map.put("mem_num",user.getMem_num());
		
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
	
	//========게시판 글상세===========//
	@RequestMapping("/faq/detail.do")
	public ModelAndView detail(@RequestParam int q_num) {
		
		logger.debug("<<q_num>> : " + q_num);
		QnAVO qna = qnaService.selectQnA(q_num);
		
		//내용에 줄바꿈 처리하면서 태그를 허용하지 않음
		qna.setQ_content(StringUtil.useBrNoHtml(qna.getQ_content()));
		
		return new ModelAndView("qnaView","qna",qna);
	}
	
	//=========이미지 출력=========//
	@RequestMapping("/faq/imageView.do")
	public ModelAndView viewImage(@RequestParam int q_num) {
		
		QnAVO qna = qnaService.selectQnA(q_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		
		mav.addObject("imageFile", qna.getQ_photo());
		mav.addObject("filename", qna.getQ_photo_name());
		
		return mav;
	}
	
	//============ 게시판 글수정 =============//
	//수정 폼
	@GetMapping("/faq/qnaupdate.do")
	public String formUpdate(@RequestParam int q_num, Model model) {
		QnAVO qnaVO = qnaService.selectQnA(q_num);
		
		model.addAttribute("qnaVO", qnaVO);
		
		return "qnaModify";
	}
	//수정 폼에서 전송된 데이터 처리
	@PostMapping("/faq/qnaupdate.do")
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
			return "qnaModify";
		}
		//글 수정
		qnaService.updateQnA(qnaVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글 수정 완료!!");
		model.addAttribute("url", request.getContextPath()+"/faq/detail.do?q_num="+qnaVO.getQ_num());
		
		return "common/resultView";
	}
	//=========== 게시판 글 삭제 =============//
	@RequestMapping("/faq/qnadelete.do")
	public String submitDelete(@RequestParam int q_num,
							HttpServletRequest request,Model model) {
		logger.debug("<<글삭제>> : " + q_num);
		
		//글 삭제
		qnaService.deleteQnA(q_num);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글 삭제 완료!!");
		model.addAttribute("url", request.getContextPath()+"/faq/qnalist.do");
		
		return "common/resultView";
	}
}




