package kr.spring.faq.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.faq.service.FAQService;

@Controller
public class FAQAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(FAQAjaxController.class);
	
	@Autowired
	private FAQService FAQService;
	
	
}





