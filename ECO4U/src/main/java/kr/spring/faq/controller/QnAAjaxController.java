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
	
	//==========문의글 선택 삭제=============//
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
		}else if(user!=null && user.getMem_num()==db_comment.getMem_num()) {
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





