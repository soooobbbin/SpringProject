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
	public List<CartVO> selectList(Map<String, Object> map) {
		return cartMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return cartMapper.selectRowCount(map);
	}

	@Override
	public CartVO selectCart(Integer cart_num) {
		return cartMapper.selectCart(cart_num);
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
	public void insertCart(CartVO cart) {
		// TODO Auto-generated method stub
		
	}

}
