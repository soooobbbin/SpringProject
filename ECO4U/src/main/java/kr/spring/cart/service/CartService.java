package kr.spring.cart.service;

import java.util.List;
import java.util.Map;


import kr.spring.cart.vo.CartVO;

public interface CartService {
	
	//장바구니에 상품담기
	public void insertCart(CartVO cart);
	public List<CartVO> selectList(Map<String,Object>map);
	public int selectRowCount(Map<String,Object> map);
	public CartVO selectCart(Integer cart_num);
	public void updateCart(CartVO cart);
	public void deleteCart(Integer cart_num);
}
