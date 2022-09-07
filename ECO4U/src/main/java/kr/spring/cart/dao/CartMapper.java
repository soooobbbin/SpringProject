package kr.spring.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.cart.vo.CartVO;


@Mapper
public interface CartMapper {

	//장바구니
	public List<CartVO> selectList(Map<String,Object>map);
	public int selectRowCount(Map<String,Object> map);
	@Select("SELECT * FROM cart c JOIN product p "
		  + "USING(p_num) "
		  + "WHERE cart_num=#{cart_num}")
	public CartVO selectCart(Integer cart_num);
	public void updateCart(Integer cart_num);
	public void deleteCart(Integer cart_num);
}
