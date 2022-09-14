package kr.spring.community.controller;



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

import kr.spring.community.service.CommunityService;
import kr.spring.community.vo.CommunityVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class CommunityController {
	private static final Logger logger =
			         LoggerFactory.getLogger(
			        		 CommunityController.class);
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Autowired
	private CommunityService communityService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public CommunityVO initCommand() {
		return new CommunityVO();
	}
	
	//===========게시판 글 등록============//
	//등록 폼

	
	@GetMapping("/community/write.do")
	public String communitywriteform() {
		return "communityWrite";
	}
	//등록 폼에서 전송된 데이터 처리
	@PostMapping("/community/write.do")
	public String submit(@Valid CommunityVO communityVO,
			      BindingResult result,
			      HttpServletRequest request,
			      HttpSession session,
			      Model model) {
		
		logger.debug("<<게시판 글 저장>> : " + communityVO);
		
		//유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return communitywriteform();
		}
		
		MemberVO user = 
				(MemberVO)session.getAttribute("user");
		//회원번호 셋팅
		communityVO.setMem_num(user.getMem_num());
		
		//글쓰기
		communityService.insertCommunity(communityVO);
		
		//View에 표시할 메시지
		model.addAttribute(
				"message", "글 등록이 완료되었습니다.");
		model.addAttribute(
		 "url", request.getContextPath()+"/community/list.do?c_category="+communityVO.getC_category());
		
		return "common/resultView";
	}
	
	
	//===========게시판 글 목록============//
	@RequestMapping("/community/list.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1") 
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword,
			@RequestParam int c_category){
		
		Map<String,Object> map = 
				    new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("c_category",  c_category);
		
		//글의 총개수(검색된 글의 개수)
		int count = communityService.selectRowCount(map);
		
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = 
				new PagingUtil(keyfield,keyword,
						currentPage,count,
						rowCount,pageCount,"list.do?","&c_category="+c_category);
		
		List<CommunityVO> list = null;
		if(count > 0) {
			
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = communityService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("communityList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//========게시판 글상세===========//
	@RequestMapping("/community/detail.do")
	public ModelAndView detail(
			          @RequestParam int c_num) {
		
		logger.debug("<<c_num>> : " + c_num);
		
		//해당 글의 조회수 증가
		communityService.updateC_hit(c_num);
		
		CommunityVO community = 
				communityService.selectCommunity(c_num);
		
		//제목에 태그를 허용하지 않음
		community.setC_title(
			 StringUtil.useNoHtml(community.getC_title()));
		//내용에 줄바꿈 처리하면서 태그를 허용하지 않음
		//ckeditor 사용시 아래 코드 주석 처리
		/*
		community.setC_content(
		 StringUtil.useBrNoHtml(community.getC_content()));*/
		
		                          //뷰 이름    속성명   속성값
		return new ModelAndView("communityView","community",community);
	}
	

	
	//============ 이미지 출력 =============//
	@RequestMapping("/community/imageView.do")
	public ModelAndView viewImage(@RequestParam int c_num) {
		System.out.println("c-num : " + c_num);
		CommunityVO community = communityService.selectCommunity(c_num);
		
		ModelAndView mav = new ModelAndView();
		//뷰 이름
		mav.setViewName("imageView");
	
		mav.addObject("imageFile", community.getUploadfile());
		mav.addObject("filename", community.getFilename());
		
		return mav;
	}
	
	
	//===========게시판 글수정===========//
	//수정 폼
	@GetMapping("/community/update.do")
	public String formUpdate(
			@RequestParam int c_num,
			                         Model model) {
		CommunityVO communityVO = 
				communityService.selectCommunity(c_num);
		
		model.addAttribute("communityVO", communityVO);
		
		return "communityModify";
	}
	//수정 폼에서 전송된 데이터 처리
	@PostMapping("/community/update.do")
	public String submitUpdate(@Valid CommunityVO communityVO,
			            BindingResult result,
			            HttpServletRequest request,
			            Model model) {
		logger.debug("<<글수정>> : " + communityVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			//title 또는 content가 입력되지 않아 유효성 체크에
			//걸리면 파일 정보를 잃어버리기 때문에 품을
			//호출할 때 다시 셋팅해주어야 함.
			CommunityVO vo = communityService.selectCommunity(
					communityVO.getC_num());
			communityVO.setFilename(vo.getFilename());
			return "communityModify";
		}
		
		
		//글수정
		communityService.updateCommunity(communityVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글수정 완료!!");
		model.addAttribute("url", 
				request.getContextPath()+"/community/detail.do?c_num="+communityVO.getC_num());	

		return "common/resultView";
	}
	
	//==========게시판 글삭제==========//
	@RequestMapping("/community/delete.do")
	public String submitDelete(
			       @RequestParam int c_num,
			       Model model,
			       HttpServletRequest request) {
		
		logger.debug("<<글삭제>> : " + c_num);
		
		//글삭제
		communityService.deleteCommunity(c_num);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글삭제 완료!!");
		model.addAttribute("url", 
				request.getContextPath()+"/community/list.do?c_category="+1);
		
		return "common/resultView";
	}

}

