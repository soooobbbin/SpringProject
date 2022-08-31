package kr.spring.store.controller;

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

import kr.spring.store.service.StoreService;
import kr.spring.store.vo.StoreVO;


@Controller
public class StoreController {
	private static final Logger logger = 
			LoggerFactory.getLogger(StoreController.class);
	
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
	@GetMapping("/intro/store.do")
	public String storeForm() {
		return "store";
	}

	@GetMapping("/intro/storeRegister.do")
	public String storeRegisterForm() {
		return "storeRegister";
	}
	
	
	
	
}
