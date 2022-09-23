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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.order.controller.OrderController;
import kr.spring.order.service.OrderService;
import kr.spring.order.vo.OrderDetailVO;
import kr.spring.product.service.ProductService;
import kr.spring.product.vo.ProductVO;

@Controller
public class KakaopayController {
	
	private static final Logger logger = LoggerFactory.getLogger(KakaopayController.class);
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;
	
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
	public String process3(HttpSession session, HttpServletRequest request) {
		
		return "common/notice_success"; 
	}
	
	@RequestMapping("/cart/kakaopay.do")
	@ResponseBody
	public String kakaopay1(HttpSession session, HttpServletRequest request) {
		
		int pcount1 = Integer.parseInt(request.getParameter("pcount"));
		String p_name1 = request.getParameter("p_name");
		int all_total1 = Integer.parseInt(request.getParameter("all_total"));
		
		logger.debug("<<pcount>> : " + pcount1 + " <<p_name>> : " + p_name1 + " <<all_total>> : " + all_total1);
		
		//상품명 외 건 찍어주기
		String item_name="";
		if(pcount1 == 1) {
			item_name = p_name1;
		}else {
			pcount1 -= 1;
			item_name = p_name1 + " 외 " + pcount1+"건";
			pcount1 += 1;
		}
		
		//테이블에 데이터 Insert
		//파라미터값 확인
		Set<String> keySet = request.getParameterMap().keySet();
		for(String key: keySet) {
			logger.debug(key + ": " + request.getParameter(key));
		}
		//주문 총 개수
		int pcount = Integer.parseInt(request.getParameter("pcount"));
		//상품이름 - 외 건
		String p_name = "";
		if(pcount>1) {
			pcount -= 1;
			p_name = request.getParameter("p_name") + "외 " + pcount + "건";
			pcount += 1;
		}else {
			p_name = request.getParameter("p_name");	
		}
		//주문 총 금액 + 배송비 계산
		int all_total = Integer.parseInt(request.getParameter("all_total"));
		if(all_total < 30000) {
			all_total += 2500;
		}
		//결제 수단
		int payment = Integer.parseInt(request.getParameter("payment"));
		//특이사항
		String notice = request.getParameter("notice");
		//session에 저장된 정보 읽기
		MemberVO user = (MemberVO)session.getAttribute("user");
		//order테이블에 넣을 map 생성
		Map<String, Object> order = new HashMap<String, Object>();
		order.put("o_name", p_name);
		order.put("o_total", all_total);
		order.put("payment", payment);
		order.put("notice", notice);
		order.put("mem_num", user.getMem_num());
		
		//cart_num 배열생성 후 값 넣기
		Map<String, Object> total = new HashMap<String, Object>();
		int[] cart_numArray = new int[pcount];
		for(int i=0; i<=pcount-1; i++) {
			cart_numArray[i]=(Integer.parseInt(request.getParameter("cart_num"+i)));
		}
		order.put("cart_numArray",cart_numArray);

		total.put("cart_numArray",cart_numArray);
		total.put("mem_num",user.getMem_num());
		logger.debug("total : " + total);
		
		List<CartVO> cartList = cartService.selectOrderList(total);
		logger.debug("<<cartList>> : " + cartList);
		//개별 상품 정보 저장
		List<OrderDetailVO> orderDetailList = new ArrayList<OrderDetailVO>();
		for(CartVO cart : cartList) {
			//상품 재고 수량 부족
			ProductVO product = productService.selectProduct(cart.getP_num());
						
			OrderDetailVO orderDetail = new OrderDetailVO();
			orderDetail.setItem_num(cart.getP_num());
			orderDetail.setItem_name(cart.getProductVO().getP_name());
			orderDetail.setItem_price(cart.getProductVO().getP_price());
			orderDetail.setOd_quantity(cart.getOrder_quantity());
			orderDetail.setItem_total(cart.getCart_total());
			
			orderDetailList.add(orderDetail);
		}//end of for문
		
		//order테이블에 INSERT
		orderService.insertOrder(order,orderDetailList);
		
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
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name="+item_name+"&quantity="+pcount1+"&total_amount="+all_total1+"&vat_amount=0&tax_free_amount=0&approval_url=http://localhost:8080/common/notice_success.do&fail_url=http://localhost:8080/common/notice_fail.do&cancel_url=http://localhost:8080/common/notice_cancel.do";
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
	public String kakaopay2(HttpSession session, HttpServletRequest request) {
		
		int pcount1 = Integer.parseInt(request.getParameter("pcount"));
		String p_name1 = request.getParameter("p_name");
		int all_total1 = Integer.parseInt(request.getParameter("all_total"));
		
		logger.debug("<<pcount>> : " + pcount1 + " <<p_name>> : " + p_name1 + " <<all_total>> : " + all_total1);
		
		//상품명 외 건 찍어주기
		String item_name="";
		if(pcount1 == 1) {
			item_name = p_name1;
		}else {
			pcount1 -= 1;
			item_name = p_name1 + " 외 " + pcount1+"건";
		}
		
		//파라미터값 확인
		Set<String> keySet = request.getParameterMap().keySet();
		for(String key: keySet) {
			logger.debug(key + ": " + request.getParameter(key));
		}
		//주문 총 개수
		int pcount = Integer.parseInt(request.getParameter("pcount"));
		//상품이름 - 외 건
		String p_name = "";
		if(pcount>1) {
			pcount -= 1;
			p_name = request.getParameter("p_name") + "외 " + pcount + "건";
			pcount += 1;
		}else {
			p_name = request.getParameter("p_name");	
		}
		//주문 총 금액 + 배송비 계산
		int o_price = Integer.parseInt(request.getParameter("all_total"));
		int all_total = Integer.parseInt(request.getParameter("all_total"));
		if(all_total < 30000) {
			all_total += 2500;
		}
		//결제 수단
		int payment = Integer.parseInt(request.getParameter("payment"));
		//특이사항
		String notice = request.getParameter("notice");
		//상품번호
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		//상품개수
		int order_quantity = Integer.parseInt(request.getParameter("order_quantity"));
		//session에 저장된 정보 읽기
		MemberVO user = (MemberVO)session.getAttribute("user");
		//order테이블에 넣을 map 생성
		Map<String, Object> order = new HashMap<String, Object>();
		order.put("p_num", p_num);
		order.put("od_quantity", order_quantity);
		order.put("o_name", p_name);
		order.put("o_price", o_price);
		order.put("o_total", all_total);
		order.put("payment", payment);
		order.put("notice", notice);
		order.put("mem_num", user.getMem_num());
				
		//order테이블에 INSERT
		orderService.insertOrder2(order);
		
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
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name="+item_name+"&quantity="+pcount1+"&total_amount="+all_total1+"&vat_amount=0&tax_free_amount=0&approval_url=http://localhost:8080/common/notice_success.do&fail_url=http://localhost:8080/common/notice_fail.do&cancel_url=http://localhost:8080/common/notice_cancel.do";
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
