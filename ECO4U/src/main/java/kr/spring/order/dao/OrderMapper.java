package kr.spring.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.order.vo.OrderVO;
import kr.spring.zipcode.vo.ZipcodeVO;

@Mapper
public interface OrderMapper {
	//대표 배송지 주소 검색
	@Select("SELECT * FROM zipcode WHERE mem_num=#{mem_num} AND zip_auth=0")
	public ZipcodeVO selectZipcode(Integer mem_num);
	@Insert("INSERT INTO Orders (notice) VALUES (#{notice}) WHERE o_num=#{o_num} AND mem_num=#{mem_num}")
	public OrderVO insertNotice(OrderVO order);
	@Select("SELECT COUNT(*) FROM zipcode WHERE mem_num=#{mem_num}")
	public int selectZipRowCount(Map<String,Object> map, Integer mem_num);
	@Select("SELECT * FROM (SELECT a.*, rownum rnum FROM (SELECT * FROM zipcode WHERE mem_num = #{mem_num} ORDER BY zip_auth DESC)a) WHERE rnum >= #{start} AND rnum <= #{end}")
	public List<ZipcodeVO> selectZipList(Map<String,Object> map);
	public OrderVO selectOrder(Integer order_num);
	public void updateZipcode(OrderVO order);
	

}





