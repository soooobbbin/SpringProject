package kr.spring.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.cart.vo.WishVO;

@Mapper
public interface WishMapper {

	//찜목록
	public List<WishVO> selectList(Map<String,Object>map);
	public int selectRowCount(Map<String,Object> map);
	@Select("SELECT * FROM wish w JOIN product p "
		  + "USING(p_num) "
		  + "WHERE w_num=#{w_num}")
	public WishVO selectWish(Integer w_num);
	public void updateWish(Integer w_num);
	public void deleteWish(Integer w_num);
}
