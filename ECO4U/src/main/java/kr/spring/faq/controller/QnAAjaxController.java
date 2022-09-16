package kr.spring.faq.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.faq.service.QnAService;
import kr.spring.faq.vo.QnAcommentVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;

@Controller
public class QnAAjaxController {
	private static final Logger logger =
			LoggerFactory.getLogger(QnAAjaxController.class);
	
	private int rowCount = 5;
	private int pageCount = 10;
	
	@Autowired
	private QnAService qnaService;
	
	//==========장바구니 선택 삭제=============//
	@RequestMapping("/faq/deleteQnA.do")
	@ResponseBody
	public Map<String,String> processFile(
			         @RequestParam String del_qna,
			         HttpSession session,
			         HttpServletRequest request){
		Map<String,String> mapJson = new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			qnaService.deleteQnAChecked(del_qna);
			mapJson.put("result", "success");
		}
		return mapJson;
	}
	
	//========댓글 등록=========//
	@RequestMapping("/faq/writeComment.do")
	@ResponseBody
	public Map<String,String> writeComment(
			  QnAcommentVO qnacommentVO,
			  HttpSession session,
			  HttpServletRequest request){
		
		logger.debug("<<댓글 등록>> : " + qnacommentVO);
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user==null) {//로그인 안 됨
			mapAjax.put("result", "logout");
		}else {//로그인 됨
			//회원번호 등록
			qnacommentVO.setMem_num(user.getMem_num());
			//댓글 등록
			qnaService.insertComment(qnacommentVO);
			mapAjax.put("result","success");
		}
		
		return mapAjax;
	}
	
	//==========대댓글==========//
	/*
	@RequestMapping("faq/rInsert")
	public String rInsert(
			QnAcommentVO qnacommentVO, 
			HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		int number = qnaService.maxNum(); // 새 댓글 번호 생성, ref는 nor_num이랑 똑같음
		
		// ref 답변글끼리 뭉칠때, re_step 답변글 순서, re_level 들여쓰기
		int re_step = 0, re_level = 0; // 첫번째 댓글은 0,0 기본 세팅
		int q_num = qnacommentVO.getQ_num(); // 어떤 글에 댓글 썼는지 번호 가져오기(jsp에서 보냈음)
		int qc_num = qnacommentVO.getQc_num(); // 어떤 댓글에 댓글 남긴건지(jsp에서 보냈음)
		String qc_content = qnacommentVO.getQc_content(); // 댓글내용(jsp에서 보냈음)
		
		if(qc_num != 0) { // 댓글에 댓글을 달 때
			
			QnAcommentVO rqnacommentVO = qnaService.selectComment(qc_num); // 읽어온 댓글의 re_step과 re_level을 알기 위해서
			
			if(rqnacommentVO.getRe_step() == 0 && rqnacommentVO.getRe_level() == 0) {
				
				qnacommentVO.setRef(qc_num); // 대댓글끼리 뭉치기위해, 부모댓글의 댓글번호로 ref 세팅
				
				int maxStep = qnaService.maxStep(rqnacommentVO.getRef()); // 댓글중에서 새로운 댓글 달때 맨 밑으로 가기 위해서
				qnacommentVO.setRe_step(maxStep);
				qnacommentVO.setRe_level(rqnacommentVO.getRe_level() + 1);
			}else { // 댓글의 대댓글을 달 때
				qnacommentVO.setRef(rqnacommentVO.getRef()); // 대댓글끼리 뭉치기위해, 부모댓글의 댓글번호로 ref 세팅
				qnacommentVO.setRe_step(rqnacommentVO.getRe_step());
				
				// 새로운 댓글은 사이에 껴야되기 때문에
				qnaService.updateStep(qnacommentVO); // 글을 읽고 ref가 같고 re_step이 읽은 글의 re_step보다 크면 그글의 re_step + 1
				
				qnacommentVO.setRef(rqnacommentVO.getRef());
				qnacommentVO.setRe_step(rqnacommentVO.getRe_step() + 1);   // 댓글(읽은값)단 re_step보다 1 증가
				qnacommentVO.setRe_level(rqnacommentVO.getRe_level() + 1); // 댓글(읽은값)단 re_level보다 1 증가
			}
		}else {
			qnacommentVO.setRef(number);
			qnacommentVO.setRe_step(re_step); // 기본 댓글에는 0세팅
			qnacommentVO.setRe_level(re_level); //     "
		}
	
		qnacommentVO.setQc_content(qc_content);
		qnacommentVO.setQc_num(number);
		qnacommentVO.setQ_num(q_num);
		qnacommentVO.setMem_num(user.getMem_num());
	
		qnaService.insertComment(qnacommentVO);
		
	//  결과를 jsp로 보내지 않고 controller내에서 찾을 때 : redirect 또는 forward
		return "redirect:/faq/noticeReplyList.do?q_num="+qnacommentVO.getQ_num();
	}
	*/
	
	//==========댓글 목록==========//
	@RequestMapping("/faq/listComment.do")
	@ResponseBody
	public Map<String,Object> getList(
			 @RequestParam(value="pageNum",defaultValue="1") 
			  int currentPage,
			  @RequestParam int q_num,
			  HttpSession session){
		
		logger.debug("<<currentPage>> : " + currentPage);
		logger.debug("<<q_num>> : " + q_num);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("q_num", q_num);
		
		//총 글의 개수
		int count = qnaService.selectRowCountComment(map);
		
		PagingUtil page = new PagingUtil(currentPage,count,rowCount,pageCount,null);
		
		map.put("start", page.getStartRow());
		map.put("end", page.getEndRow());
		
		List<QnAcommentVO> list = null;
		if(count > 0) {
			list = qnaService.selectListComment(map);
		}else {
			list = Collections.emptyList();
		}
		
		Map<String,Object> mapAjax = new HashMap<String,Object>();
		mapAjax.put("count", count);
		mapAjax.put("rowCount", rowCount);
		mapAjax.put("list", list);
		
		//로그인 한 회원정보 셋팅
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user!=null) {
			mapAjax.put("user_num", user.getMem_num());
		}
		
		return mapAjax;
	}
	
	//==========댓글 수정==========//
	@RequestMapping("/faq/updateComment.do")
	@ResponseBody
	public Map<String,String> modifyComment(
				  QnAcommentVO qnacommentVO,
			      HttpSession session,
			      HttpServletRequest request){
		
		logger.debug("<<댓글 수정>> : " + qnacommentVO);
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		QnAcommentVO db_comment = qnaService.selectComment(qnacommentVO.getQc_num());
		
		if(user==null) {//로그인이 되지 않는 경우
			mapAjax.put("result", "logout");
		}else if(user!=null && user.getMem_num()==db_comment.getMem_num()) {
			//로그인 회원번호와 작성자 회원번호 일치
			
			//댓글 수정
			qnaService.updateComment(qnacommentVO);
			mapAjax.put("result", "success");
		}else {
			//로그인 회원번호와 작성자 회원번호 불일치
			mapAjax.put("result", "wrongAccess");
		}
		return mapAjax;
	}
	//==========댓글 삭제==========//
	@RequestMapping("/faq/deleteComment.do")
	@ResponseBody
	public Map<String,String> deleteComment(
			            @RequestParam int qc_num,
			            HttpSession session){
		
		logger.debug("<<qc_num>> : " + qc_num);
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		QnAcommentVO db_comment = qnaService.selectComment(qc_num);
		if(user==null) {
			//로그인이 되지 않은 경우
			mapAjax.put("result", "logout");
		}else if(user!=null && 
		  user.getMem_num()==db_comment.getMem_num()) {
			//로그인이 되어 있고 
			//로그인한 회원번호와 작성자 회원번호 일치
			
			//댓글 삭제
			qnaService.deleteComment(qc_num);
			
			mapAjax.put("result", "success");
		}else {
			//로그인한 회원번호와 작성자 회원번호 불일치
			mapAjax.put("result", "wrongAccess");
		}
		return mapAjax;
	}
}





