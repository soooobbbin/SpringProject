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
	public int selectTotalByMem_numCart_num(Map<String, Object> total) {
		// TODO Auto-generated method stub
		return cartMapper.selectTotalByMem_numCart_num(total);
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
	public List<CartVO> selectOrderList(Map<String, Object> total) {
		// TODO Auto-generated method stub
		return cartMapper.selectOrderList(total);
	}
	
	@Override
	public void updateCartByItem_num(CartVO cart) {
		cartMapper.updateCartByItem_num(cart);
	}
	
	@Override
	public void updateCart(CartVO cart) {
		cartMapper.updateCart(cart);
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
	
	@Override
	public int selectRowCount(Map<String, Object> map) {
		return cartMapper.selectRowCount(map);
	}

	@Override
	public int selectTotalByMem_numP_num(Map<String, Object> total) {
		return cartMapper.selectTotalByMem_numP_num(total);
	}

	@Override
	public List<CartVO> selectOrderList2(Map<String, Object> total) {
		return cartMapper.selectOrderList2(total);
	}

	@Override
	public void addCart(CartVO cart) {
		cartMapper.addCart(cart);
		
	}

}
