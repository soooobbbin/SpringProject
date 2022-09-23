package kr.spring.cart.service;

import java.util.List;
import java.util.Map;


import kr.spring.cart.vo.CartVO;

public interface CartService {
	
	//장바구니에 상품담기
	public void insertCart(CartVO cart);
	//회원번호별(mem_num)총 구매액
	public int selectTotalByMem_num(int mem_num);
	public int selectTotalByMem_numCart_num(Map<String,Object> total);
	public int selectTotalByMem_numP_num(Map<String,Object> total);
	public int selectRowCount(Map<String,Object> map);
	public List<CartVO> selectList(int mem_num);
	public List<CartVO> selectOrderList(Map<String,Object> total);
	public List<CartVO> selectOrderList2(Map<String,Object> total);
	public CartVO selectCart(CartVO cart);
	public void updateCart(CartVO cart);
	public void updateCartByItem_num(CartVO cart);
	public void deleteCart(Integer cart_num);
	public void deleteCartChecked(String del_product);
	public void addCart(CartVO cart);
}
