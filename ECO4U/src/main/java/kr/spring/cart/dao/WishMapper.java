package kr.spring.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.cart.vo.CartVO;
import kr.spring.cart.vo.WishVO;

@Mapper
public interface WishMapper {

	//장바구니에 상품담기
	@Insert("INSERT INTO wish (w_num,mem_num,p_num) "
		  + "VALUES(wish_seq.nextval,#{mem_num},#{p_num})")
	public void insertWish(WishVO wishVO);
	//찜목록
	public List<WishVO> selectList(Map<String,Object>map);
	public int selectRowCount(Map<String,Object> map);
	@Select("SELECT * FROM wish WHERE p_num=#{p_num} AND mem_num=#{mem_num}")
	public WishVO selectWish(WishVO wish);
	public void updateWish(Integer w_num);
	@Delete("DELETE FROM wish WHERE w_num=#{w_num}")
	public void deleteWish(Integer w_num);
	@Delete("DELETE FROM wish WHERE p_num=#{p_num}")
	public void deleteWishByProductNum(Integer p_num);
}
