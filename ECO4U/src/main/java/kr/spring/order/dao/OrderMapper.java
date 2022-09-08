package kr.spring.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.order.vo.OrderVO;
import kr.spring.zipcode.vo.ZipcodeVO;

@Mapper
public interface OrderMapper {
	//대표 배송지 주소 검색
	@Select("SELECT * FROM zipcode WHERE mem_num=#{mem_num} AND zip_auth=0")
	public ZipcodeVO selectZipcode(Integer mem_num);
	public void updateZipcode(OrderVO board);
	public List<OrderVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public OrderVO selectOrder(Integer board_num);
}





