package kr.spring.store.controller;

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

import kr.spring.store.service.StoreService;
import kr.spring.store.vo.StoreVO;
import kr.spring.util.FileUtil;
import kr.spring.util.PagingUtil;


@Controller
public class StoreController {
	private static final Logger logger = 
			LoggerFactory.getLogger(StoreController.class);
	private int rowCount = 9;
	private int pageCount = 10;
	
	@Autowired
	private StoreService storeService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public StoreVO initCommand() {
		return new StoreVO();
	}
	
	//============ 게시판 글 등록 =============//
	//등록 폼
	@GetMapping("/intro/eco4u.do")
	public String eco4uForm() {
		return "eco4u";
	}

	@GetMapping("/intro/storeRegister.do")
	public String storeRegisterForm() {
		return "storeRegister";
	}
	
	//회원가입 데이터 전송
	@PostMapping("/intro/register.do")
	public String submit(@Valid StoreVO storeVO,BindingResult result, 
							HttpServletRequest request,Model model) {
		logger.debug("<<가게 등록>> : " + storeVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return storeRegisterForm();
		}
		
		//회원가입
		storeService.insertStore(storeVO);
		
		//View에 표시할 메시지
		model.addAttribute("accessMsg", "가게 등록이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/intro/storeRegister.do");
				
		return "common/notice";
	}
	
	//============ 게시판 글 목록 =============//
	@RequestMapping("/intro/store.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		
		//글의 총개수(검색된 글의 개수
		int count = storeService.selectRowCount(map);
		
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = 
				new PagingUtil(currentPage,count,
								rowCount,pageCount,"store.do");
		
		List<StoreVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = storeService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("store");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//============ 이미지 출력 =============//
	@RequestMapping("/intro/imageView.do")
	public ModelAndView viewImage(@RequestParam int s_num) {
		System.out.println("s-num : " + s_num);
		StoreVO store = storeService.selectStore(s_num);
		
		ModelAndView mav = new ModelAndView();
		//뷰 이름
		mav.setViewName("imageView");
	
		mav.addObject("imageFile", store.getPhoto());
		mav.addObject("filename", store.getPhoto_name());
	
		return mav;
	}

	
}
