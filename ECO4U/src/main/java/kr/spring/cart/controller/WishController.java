package kr.spring.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.cart.service.WishService;
import kr.spring.cart.vo.CartVO;
import kr.spring.cart.vo.WishVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;

@Controller
public class WishController {

	private static final Logger logger = 
			LoggerFactory.getLogger(WishController.class);
	
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Autowired
	private WishService wishService;
	
	//자바빈(VO)초기화
	@ModelAttribute
	public WishVO initCommand() {
		return new WishVO();
	}
	
	//찜 등록
//	@RequestMapping("/cart/registerWish.do")
//	@ResponseBody
//	public Map<String,String> submit(WishVO wishVO, HttpSession session){
//		logger.debug("<<WishVO>> : " + wishVO);
//		
//		Map<String,String> mapAjax = new HashMap<String,String>();
//		MemberVO user = (MemberVO)session.getAttribute("user");
//		if(user==null) {//로그인이 되지 않은 경우
//			mapAjax.put("result", "logout");
//		}else {
//			wishVO.setMem_num(user.getMem_num());
//			
//			//기존에 등록된 동일 상품이 있는지 체크
//			WishVO db_cart = wishService.selectWish(wishVO);
//			if(db_cart==null) {//등록된 동일 상픔 없음
//				wishService.insertWish(wishVO);
//				mapAjax.put("result", "success");
//				mapAjax.put("status", "yesWish");
//			}
//		}
//		return mapAjax;
//	}
	//찜 등록
	@RequestMapping("/cart/writeWish.do")
	@ResponseBody
	public Map<String,Object> writeFav(WishVO wish, 
			HttpSession session){
		logger.debug("<<부모글 좋아요 등록>> : " + wish);

		Map<String,Object> mapJson = new HashMap<String,Object>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			mapJson.put("result", "logout");
		}else {
			//로그인된 회원번호 세팅
			wish.setMem_num(user.getMem_num());

			//기존에 등록된 좋아요 확인
			WishVO productWish = wishService.selectWish(wish);

			if(productWish!=null) { //등록된 좋아요 정보가 있는 경우
				wishService.deleteWish(productWish.getW_num());

				mapJson.put("result", "success");
				mapJson.put("status", "noWish");
		
			}else { 
				wishService.insertWish(wish);

				mapJson.put("result", "success");
				mapJson.put("status", "yesWish");
			}
		}
		return mapJson;
	}
	//부모글 좋아요 읽기
	@RequestMapping("/cart/getWish.do")
	@ResponseBody
	public Map<String,Object> getFav(WishVO wish, 
									HttpSession session){
		logger.debug("<<게시판 좋아요 등록>> : " + wish);

		Map<String,Object> mapJson = new HashMap<String,Object>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			mapJson.put("status", "noWish");
		}else { //로그인 된 경우
			wish.setMem_num(user.getMem_num());
			
			//등록된 좋아요 정보 읽기
			WishVO productWish = wishService.selectWish(wish);
			if(productWish!=null) {//좋아요 등록
				mapJson.put("status", "yesWish");
			}else {//좋아요 미등록
				mapJson.put("status", "noWish");
			}
		}
		return mapJson;
	}

	
	
	//=======찜 목록=======//
	@RequestMapping(value="/cart/wishList.do",method=RequestMethod.GET)
	public ModelAndView list(
					HttpSession session,
					@RequestParam(value="pageNum",defaultValue="1") 
					int currentPage,
					@RequestParam(value="keyfield",defaultValue="")
					String keyfield,
					@RequestParam(value="category",defaultValue="")
					String category) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		Map<String,Object> map = 
				new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("category", category);
		map.put("mem_num",user.getMem_num());
		
		//찜 목록의 총 개수(검색된 목록 개수)
		int count = wishService.selectRowCount(map);
		
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = 
				new PagingUtil(keyfield,category,currentPage,
						count,rowCount,pageCount,"wishList.do");
		List<WishVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = wishService.selectList(map);
		}
		
		
		ModelAndView mav = new ModelAndView();
		//뷰이름.jsp
		mav.setViewName("wishList");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("page",page.getPage());
		
		return mav;
	}
	
	
}
