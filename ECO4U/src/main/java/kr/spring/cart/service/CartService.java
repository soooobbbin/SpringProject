package kr.spring.cart.service;

import java.util.List;
import java.util.Map;


import kr.spring.cart.vo.CartVO;

public interface CartService {

	public List<CartVO> selectList(Map<String,Object>map);
	public int selectRowCount(Map<String,Object> map);
	public CartVO selectCart(Integer cart_num);
	public void updateCart(Integer cart_num);
	public void deleteCart(Integer cart_num);
}
