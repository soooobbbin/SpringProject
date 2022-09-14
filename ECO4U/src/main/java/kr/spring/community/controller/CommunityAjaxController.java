package kr.spring.community.controller;


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


import kr.spring.community.service.CommunityService;
import kr.spring.community.vo.CommunityCommentVO;
import kr.spring.community.vo.CommunityLikeVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;

@Controller
public class CommunityAjaxController {
	private static final Logger logger =
			LoggerFactory.getLogger(CommunityAjaxController.class);
	
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Autowired
	private CommunityService communityService;
	
	//===========부모글 업로드 파일 삭제===========//
	@RequestMapping("/community/deleteFile.do")
	@ResponseBody
	public Map<String,String> processFile(
			         @RequestParam int c_num,
			                HttpSession session){
		Map<String,String> mapJson = 
				new HashMap<String,String>();
		
		MemberVO user = 
			   (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			communityService.deleteFile(c_num);
			mapJson.put("result", "success");
		}
		
		return mapJson;
	}
	
	
	
	//==========부모글 좋아요============//
	//부모글 좋아요 등록
	@RequestMapping("/community/writeLike.do")
	@ResponseBody
	public Map<String,Object> writeLike(
			             CommunityLikeVO like,
			             HttpSession session){
		logger.debug("<<부모글 좋아요 등록>> : " + like);
		
		Map<String,Object> mapJson= 
				new HashMap<String,Object>();
		
		MemberVO user = 
				(MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			//로그인된 회원번호 셋팅
			like.setMem_num(user.getMem_num());
			
			//기존에 등록된 좋아요 확인
			CommunityLikeVO communityLike = 
					communityService.selectLike(like);
			
			if(communityLike!=null) {//등록된 좋아요 정보가 있는 경우
				communityService.deleteLike(communityLike.getC_like_num());
				
				mapJson.put("result", "success");
				mapJson.put("status", "noLike");
				mapJson.put("count", communityService.selectLikeCount(
						                      like.getC_num()));
				
			}else {//등록된 좋아요 정보가 없는 경우
				communityService.insertLike(like);
				
				mapJson.put("result", "success");
				mapJson.put("status", "yesLike");
				mapJson.put("count", communityService.selectLikeCount(
						                    like.getC_num()));
			}
		}
		return mapJson;
	}
	//부모글 좋아요 읽기
	@RequestMapping("/community/getLike.do")
	@ResponseBody
	public Map<String,Object> getLike(
			         CommunityLikeVO like,
			         HttpSession session){
		
		logger.debug("<<게시판 좋아요 읽기>> : " + like);
		
		Map<String,Object> mapJson = 
				new HashMap<String,Object>();
		
		MemberVO user = 
			  (MemberVO)session.getAttribute("user");
		if(user==null) {//로그인이 되지 않은 경우
			mapJson.put("status", "noLike");
			mapJson.put("count", communityService.selectLikeCount(
					                     like.getC_num()));
		}else {//로그인 된 경우
			like.setC_num(user.getMem_num());
			
			//등록된 좋아요 정보 읽기
			CommunityLikeVO communityLike = communityService.selectLike(like);
			
			if(communityLike!=null) {//좋아요 등록
				mapJson.put("status", "yesLike");
				mapJson.put("count", communityService.selectLikeCount(
						                     like.getC_num()));
			}else {//좋아요 미등록
				mapJson.put("status", "noLike");
				mapJson.put("count", communityService.selectLikeCount(
						                     like.getC_num()));
			}
		}
		return mapJson;		
	}
	
	//========댓글 등록=========//
	@RequestMapping("/community/writeComment.do")
	@ResponseBody
	public Map<String,String> writeComment(
			  CommunityCommentVO communityCommentVO,
			  HttpSession session,
			  HttpServletRequest request){
		
		logger.debug("<<댓글 등록>> : " + communityCommentVO);
		
		Map<String,String> mapAjax = 
				new HashMap<String,String>();
		
		MemberVO user = 
			(MemberVO)session.getAttribute("user");
		if(user==null) {//로그인 안 됨
			mapAjax.put("result", "logout");
		}else {//로그인 됨
			//회원번호 등록
			communityCommentVO.setMem_num(
					             user.getMem_num());
			//댓글 등록
			communityService.insertComment(communityCommentVO);
			mapAjax.put("result","success");
		}
		return mapAjax;
	}
	
	//==========댓글 목록==========//
	@RequestMapping("/community/listComment.do")
	@ResponseBody
	public Map<String,Object> getList(
			 @RequestParam(value="pageNum",defaultValue="1") 
			  int currentPage,
			  @RequestParam int c_num,
			  HttpSession session){
		
		logger.debug("<<currentPage>> : " + currentPage);
		logger.debug("<<c_num>> : " + c_num);
		
		Map<String,Object> map = 
				new HashMap<String,Object>();
		map.put("c_num", c_num);
		
		//총 글의 개수
		int count = 
			communityService.selectRowCountComment(map);
		
		PagingUtil page = 
				new PagingUtil(currentPage,count,
						rowCount,pageCount,null);
		
		map.put("start", page.getStartRow());
		map.put("end", page.getEndRow());
		
		List<CommunityCommentVO> list = null;
		if(count > 0) {
			list = communityService.selectListComment(map);
		}else {
			list = Collections.emptyList();
		}
		
		Map<String,Object> mapAjax = 
				new HashMap<String,Object>();
		mapAjax.put("count", count);
		mapAjax.put("rowCount", rowCount);
		mapAjax.put("list", list);
		
		//로그인 한 회원정보 셋팅
		MemberVO user = 
			 (MemberVO)session.getAttribute("user");
		if(user!=null) {
			mapAjax.put(
					"user_num", user.getMem_num());
		}
		
		return mapAjax;
	}
	
	//==========댓글 수정==========//
	@RequestMapping("/community/updateComment.do")
	@ResponseBody
	public Map<String,String> modifyComment(
			      CommunityCommentVO communityCommentVO,
			      HttpSession session,
			      HttpServletRequest request){
		
		logger.debug("<<댓글 수정>> : " + communityCommentVO);
		
		Map<String,String> mapAjax = 
				new HashMap<String,String>();
		
		MemberVO user = 
				(MemberVO)session.getAttribute("user");
		CommunityCommentVO db_comment = 
				communityService.selectComment(
						     communityCommentVO.getCom_num());
		if(user==null) {//로그인이 되지 않는 경우
			mapAjax.put("result", "logout");
		}else if(user!=null && 
			  user.getMem_num()==db_comment.getMem_num()) {
			//로그인 회원번호와 작성자 회원번호 일치
			
			//댓글 수정
			communityService.updateComment(communityCommentVO);
			mapAjax.put("result", "success");
		}else {
			//로그인 회원번호와 작성자 회원번호 불일치
			mapAjax.put("result", "wrongAccess");
		}
		return mapAjax;
	}
	//==========댓글 삭제==========//
	@RequestMapping("/community/deleteComment.do")
	@ResponseBody
	public Map<String,String> deleteComment(
			            @RequestParam int com_num,
			            HttpSession session){
		
		logger.debug("<<com_num>> : " + com_num);
		
		Map<String,String> mapAjax =
				new HashMap<String,String>();
		
		MemberVO user = 
			(MemberVO)session.getAttribute("user");
		CommunityCommentVO db_comment = 
				communityService.selectComment(com_num);
		if(user==null) {
			//로그인이 되지 않은 경우
			mapAjax.put("result", "logout");
		}else if(user!=null && 
		  user.getMem_num()==db_comment.getMem_num()) {
			//로그인이 되어 있고 
			//로그인한 회원번호와 작성자 회원번호 일치
			
			//댓글 삭제
			communityService.deleteComment(com_num);
			
			mapAjax.put("result", "success");
		}else {
			//로그인한 회원번호와 작성자 회원번호 불일치
			mapAjax.put("result", "wrongAccess");
		}
		return mapAjax;
	}


	
}
