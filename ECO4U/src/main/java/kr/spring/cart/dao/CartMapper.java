package kr.spring.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.cart.vo.CartVO;


@Mapper
public interface CartMapper {

	//장바구니
	//장바구니에 상품담기
	@Insert("INSERT INTO cart (cart_num,order_quantity,mem_num,p_num) "
		  + "VALUES(cart_seq.nextval,#{order_quantity},#{mem_num},#{p_num})")
	public void insertCart(CartVO cart);
	//회원번호별(mem_num)총 구매액
	@Select("SELECT NVL(SUM(cart_total),0) FROM (SELECT c.mem_num,"
			+ "c.order_quantity*p.p_price+p.p_dprice cart_total FROM cart c "
			+ "JOIN product p ON c.p_num=p.p_num WHERE mem_num=#{mem_num})")
	public int selectTotalByMem_num(int mem_num);
	public List<CartVO> selectList(int mem_num);
	@Select("SELECT * FROM cart WHERE cart_num=#{cart_num} AND mem_num=#{mem_num}")
	public CartVO selectCart(CartVO cart);
	
	public void updateCart(CartVO cart);
	//장바구니 수정(회원번호별 상품 수량 수정)
	@Update("UPDATE cart SET order_quantity=#{order_quantity} "
			+ "WHERE p_num=#{p_num} AND mem_num=#{mem_num}")
	public void updateCartByItem_num(CartVO cart);
	
	@Delete("DELETE FROM cart WHERE cart_num=#{cart_num}")
	public void deleteCart(Integer cart_num);
}
