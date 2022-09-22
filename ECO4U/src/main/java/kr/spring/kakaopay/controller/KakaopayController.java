package kr.spring.kakaopay.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class KakaopayController {
	@RequestMapping("/cart/kakaopay.do")
	@ResponseBody
	public String kakaopay() {
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection serve = (HttpURLConnection) url.openConnection();
			serve.setRequestMethod("POST");
			serve.setRequestProperty("Authorization", "KakaoAK 1168b0ed2ea3aeb2276c989b3d6ae453");
			serve.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			serve.setDoOutput(true);
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=http://localhost:8080&fail_url=http://localhost:8080&cancel_url=http://localhost:8080";
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
