package kr.spring.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.cart.dao.CartMapper;
import kr.spring.cart.vo.CartVO;

@Service
@Transactional
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper cartMapper;

	@Override
	public void insertCart(CartVO cart) {
		cartMapper.insertCart(cart);
	}
	@Override
	public int selectTotalByMem_num(int mem_num) {
		return cartMapper.selectTotalByMem_num(mem_num);
	}
	@Override
	public List<CartVO> selectList(int mem_num) {
		return cartMapper.selectList(mem_num);
	}

	@Override
	public CartVO selectCart(CartVO cart) {
		return cartMapper.selectCart(cart);
	}
	
	@Override
	public void updateCartByItem_num(CartVO cart) {
		cartMapper.updateCartByItem_num(cart);
	}
	
	@Override
	public void updateCart(CartVO cart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCart(Integer cart_num) {
		cartMapper.deleteCart(cart_num);
	}


	@Override
	public void deleteCartChecked(String del_product) {
		String[] ajaxMsg = del_product.split(",");
		for(int i=0; i<ajaxMsg.length; i++) {
			cartMapper.deleteCart(Integer.parseInt(ajaxMsg[i]));
		}
	}

	



}
