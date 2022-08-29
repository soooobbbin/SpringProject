package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.kakao.login.KakaoAPI;
import kr.spring.mail.service.MailService;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.AuthCheckException;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MailService mailService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	
	//=============회원가입===============//
	//회원등록 폼 호출
	@GetMapping("/member/registerUser.do")
	public String form() {
		       //타일스 설정의 식별자
		return "memberRegister";
	}
	
	//회원가입 데이터 전송
	@PostMapping("/member/registerUser.do")
	public String submit(@Valid MemberVO memberVO,BindingResult result, Model model) {
		
		logger.debug("<<회원가입>> : " + memberVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		//회원가입
		memberService.insertMember(memberVO);
		
		model.addAttribute("accessMsg", "회원가입이 완료되었습니다.");
		
		return "common/notice";
	}
	
	//============회원로그인============//
	//로그인 폼
	@GetMapping("/member/login.do")
	public String formLogin() {
		return "memberLogin";
	}
	//로그인 폼에서 전송된 데이터 처리
	@PostMapping("/member/login.do")
	public String submitLogin(@Valid MemberVO memberVO, BindingResult result,HttpSession session) {
		
		logger.debug("<<회원 로그인>> : " + memberVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		//id와 passwd 필드만 체크
		if(result.hasFieldErrors("id") || result.hasFieldErrors("passwd")) {
			return formLogin();
		}
		
		//로그인 체크
		MemberVO member = null;
		try {
			member = memberService.selectCheckMember(memberVO.getId());
			boolean check = false;
			
			if(member!=null) {
				//비밀번호 일치 여부 체크
				check = member.isCheckedPasswd(memberVO.getMem_pw());
			}
			if(check) {
				//인증 성공, 로그인 처리
				session.setAttribute("user", member);
				
				logger.debug("<<인증 성공>>");
				logger.debug("<<id>> : " + member.getId());
				
				return "redirect:/main/main.do";
			}
			
			//인증실패
			throw new AuthCheckException();
			
		}catch(AuthCheckException e) {
			//인증 실패로 로그인 폼 호출
			if(member!=null && member.getAuth()==1) {
				//정지회원 메시지 표시
				result.reject("noAuthority");
			}else {
				result.reject("invalidIdOrPassword");
			}
			
			logger.debug("<<인증 실패>>");
			
			return formLogin();
		}
	}
	
	//=========카카오로그인============//
	@Autowired
	KakaoAPI kakaoApi = new KakaoAPI();
	
	@RequestMapping(value="/member/kakaologin.do")
	public ModelAndView login(@RequestParam("code") String code, HttpSession session,MemberVO memberVO,BindingResult result) {
		ModelAndView mav = new ModelAndView();
		//1번 인증코드 요청 전달
		String access_token = kakaoApi.getAccessToken(code);
		//2번 인증코드로 토큰 전달 
		HashMap<String,Object> userInfo = kakaoApi.getUserInfo(access_token);
		
		System.out.println("login ingo : " + userInfo.toString());
		
		if(userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_token", access_token);
		}
		String id = (String) userInfo.get("email");	
		//로그인 체크
		MemberVO member = null;
		try {
			member = memberService.selectCheckkakaoMember(id);
			boolean check = true;
			
			//가입된 정보가 없을 경우
			if(member == null) {		
				//회원가입
				memberService.insertkakaoMember(memberVO,id);		
				logger.debug("<<카카오회원 로그인 성공>>");
			} else {
				//회원 상태 확인
				if(member.getAuth() != 2) {
					check = false;
				}
			}
			
			System.out.println("check : " + check);
			
			if(check) {
				//로그인 성공시 정보 가져오기
				member = memberService.selectCheckkakaoMember(id);
				//인증 성공, 로그인 처리
				session.setAttribute("user", member);
				
				logger.debug("<<인증 성공>>");
				//logger.debug("<<id>> : " + member.getId());
				
				mav.addObject("userId", userInfo.get("email"));
				mav.setViewName("main");
			}
			
			//인증실패
			throw new AuthCheckException();
			
		}catch(AuthCheckException e) {
			//인증 실패로 로그인 폼 호출
			if(member!=null && member.getAuth()==1) {
				//정지회원 메시지 표시
				result.reject("noAuthority");
			}
		}
		return mav;
	}
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		kakaoApi.kakaoLogout((String)session.getAttribute("access_token"));
		session.removeAttribute("accessToken");
		session.removeAttribute("userId");
		mav.setViewName("main");
		return mav;
	}
	
	//=========비밀번호찾기============//
	@GetMapping("/member/findpasswd.do")
	public String findpasswd() {
		return "findPasswd";
	}
	@RequestMapping("/member/doSend.do")
	public String doSend(@Valid MemberVO memberVO, BindingResult result, Model model) {
		
		logger.debug("<<이메일 발송 매칭>> : " + memberVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		//id와 phone 필드만 체크
		if(result.hasFieldErrors("id") || 
				result.hasFieldErrors("phone")) {
			return findpasswd();
		}
		
		//로그인 체크
		MemberVO member = null;
		try {
			member = memberService.selectCheckMember(memberVO.getId());
			boolean check = false;
					
			if(member!=null) {
				//전화번호 일치 여부 체크
				check = member.isCheckedPasswd(memberVO.getMem_cell());
			}
			if(check) {
				//인증 성공, 메일발송 처리		
				logger.debug("<<인증 성공>>");
				logger.debug("<<id>> : " + member.getId());
				
				String email = member.getMem_email();
				String title = "신규 이메일 보내드립니다.";
				
				String body = String.valueOf((int)(Math.random() * 10000));
				
				Map<String, Object> sendRs = mailService.send(email, title, body);
				
				model.addAttribute("accessMsg", "메일발송이 완료되었습니다.");
			
				return "common/notice";
				//return (String) sendRs.get("msg");
			}
					
			//인증실패
			throw new AuthCheckException();
					
		}catch(AuthCheckException e) {
			//인증 실패로 로그인 폼 호출
			if(member!=null && member.getAuth()==1) {
				//정지회원 메시지 표시
				result.reject("noAuthority");
			}else {
				result.reject("invalidIdOrPhone");
			}
					
			logger.debug("<<인증 실패>>");
					
			return findpasswd();
		}
		
	}

	//===========회원로그아웃============//
	@RequestMapping("/member/logout.do")
	public String processLogout(HttpSession session) {
		//로그아웃
		session.invalidate();
		
		return "redirect:/main/main.do";
	}
	
	//==========MY페이지===========//
	@RequestMapping("/member/myPage.do")
	public String myPage(HttpSession session,Model model) {
		//session에 저장된 정보 읽기
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//1건의 레코드 읽기
		MemberVO member = memberService.selectMember(user.getMem_num());
		
		logger.debug("<<회원상세정보>> : " + member);
		                   //속성명     속성값 
		model.addAttribute("member", member);		
		
		return "memberView";
	}
	
}







