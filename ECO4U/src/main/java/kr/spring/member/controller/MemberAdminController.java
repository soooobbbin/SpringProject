package kr.spring.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.spring.member.service.MemberService;

@Controller
public class MemberAdminController {
	private static final Logger logger = LoggerFactory.getLogger(MemberAdminController.class);
	
	private int rowCount=10;
	private int pageCount=10;
	
	@Autowired
	private MemberService memberService;
	
	
}
