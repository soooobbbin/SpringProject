package kr.spring.kakaopay.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.spring.member.vo.MemberVO;
import kr.spring.order.controller.OrderController;

@Controller
public class KakaopayController {
	
	private static final Logger logger = LoggerFactory.getLogger(KakaopayController.class);
	
	//카카오 구매 취소
	@RequestMapping("/common/notice_cancel.do")
	public String process1() {
		return "common/notice_cancel"; 
	}
	
	//카카오 구매 실패
	@RequestMapping("common/notice_fail.do")
	public String process2() {
		return "common/notice_fail"; 
	}
	
	//카카오 구매 성공
	@RequestMapping("common/notice_success.do")
	public String process3() {
		return "common/notice_success"; 
	}
	
	@RequestMapping("/cart/kakaopay.do")
	@ResponseBody
	public String kakaopay1(@RequestParam(value="pcount",defaultValue="") int pcount,
						   @RequestParam(value="p_name",defaultValue="") String p_name,
						   @RequestParam(value="all_total",defaultValue="") int all_total) {
		
		logger.debug("<<pcount>> : " + pcount + " <<p_name>> : " + p_name + " <<all_total>> : " + all_total);
		
		//상품명 외 건 찍어주기
		String item_name="";
		if(pcount == 1) {
			item_name = p_name;
		}else {
			pcount -= 1;
			item_name = p_name + " 외 " + pcount+"건";
		}
		
		try {
			item_name = URLEncoder.encode(item_name,"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection serve = (HttpURLConnection) url.openConnection();
			serve.setRequestMethod("POST");
			serve.setRequestProperty("Authorization", "KakaoAK 1168b0ed2ea3aeb2276c989b3d6ae453");
			serve.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			serve.setDoOutput(true);
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name="+item_name+"&quantity="+pcount+"&total_amount="+all_total+"&vat_amount=0&tax_free_amount=0&approval_url=http://localhost:8080/common/notice_success.do&fail_url=http://localhost:8080/common/notice_fail.do&cancel_url=http://localhost:8080/common/notice_cancel.do";
			OutputStream output = serve.getOutputStream();
			DataOutputStream dataoutput = new DataOutputStream(output);
			dataoutput.writeBytes(param);
			dataoutput.close();
			
			int result = serve.getResponseCode();
			
			InputStream input;
			if(result == 200) {
				input = serve.getInputStream();
			} else {
				input = serve.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(input);
			BufferedReader buffer = new BufferedReader(reader);
			return buffer.readLine();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "{\"result\":\"NO\"}";
	}
	
	//단건 결제
	@RequestMapping("/product/kakaopay.do")
	@ResponseBody
	public String kakaopay2(@RequestParam(value="pcount",defaultValue="") int pcount,
						   @RequestParam(value="p_name",defaultValue="") String p_name,
						   @RequestParam(value="all_total",defaultValue="") int all_total) {
		
		logger.debug("<<pcount>> : " + pcount + " <<p_name>> : " + p_name + " <<all_total>> : " + all_total);
		
		//상품명 외 건 찍어주기
		String item_name="";
		if(pcount == 1) {
			item_name = p_name;
		}else {
			pcount -= 1;
			item_name = p_name + " 외 " + pcount+"건";
		}
		
		try {
			item_name = URLEncoder.encode(item_name,"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection serve = (HttpURLConnection) url.openConnection();
			serve.setRequestMethod("POST");
			serve.setRequestProperty("Authorization", "KakaoAK 1168b0ed2ea3aeb2276c989b3d6ae453");
			serve.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			serve.setDoOutput(true);
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name="+item_name+"&quantity="+pcount+"&total_amount="+all_total+"&vat_amount=0&tax_free_amount=0&approval_url=http://localhost:8080/common/notice_success.do&fail_url=http://localhost:8080/common/notice_fail.do&cancel_url=http://localhost:8080/common/notice_cancel.do";
			OutputStream output = serve.getOutputStream();
			DataOutputStream dataoutput = new DataOutputStream(output);
			dataoutput.writeBytes(param);
			dataoutput.close();
			
			int result = serve.getResponseCode();
			
			InputStream input;
			if(result == 200) {
				input = serve.getInputStream();
			} else {
				input = serve.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(input);
			BufferedReader buffer = new BufferedReader(reader);
			return buffer.readLine();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "{\"result\":\"NO\"}";
	}
}
