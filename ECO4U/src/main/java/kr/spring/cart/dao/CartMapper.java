package kr.spring.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.cart.vo.CartVO;


@Mapper
public interface CartMapper {

	//장바구니
	//장바구니에 상품담기
	@Insert("INSERT INTO cart (cart_num,order_quantity,"
		  + "reg_date,mem_num,p_num) "
		  + "VALUES(cart_seq.nextval,#{order_quantity},SYSDATE,#{mem_num},#{p_num})")
	public void insertCart(CartVO cart);
	public List<CartVO> selectList(Map<String,Object>map);
	public int selectRowCount(Map<String,Object> map);
	@Select("SELECT * FROM cart c JOIN product p "
		  + "USING(p_num) "
		  + "WHERE cart_num=#{cart_num} AND mem_num=#{mem_num}")
	public CartVO selectCart(Integer cart_num);
	public void updateCart(CartVO cart);
	@Delete("DELETE FROM cart WHERE cart_num=#{cart_num}")
	public void deleteCart(Integer cart_num);
}
