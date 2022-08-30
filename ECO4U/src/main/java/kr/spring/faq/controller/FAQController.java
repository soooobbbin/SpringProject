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

import kr.spring.faq.service.FAQService;
import kr.spring.faq.vo.FAQVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class FAQController {
	private static final Logger logger =
			         LoggerFactory.getLogger(
					          FAQController.class);
	private int rowCount = 20;
	private int pageCount = 10;
	
	@Autowired
	private FAQService boardService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public FAQVO initCommand() {
		return new FAQVO();
	}
	
	@GetMapping("/faq/faqlist.do")
	public String formFaq() {
		return "faqList";
	}
	
}




