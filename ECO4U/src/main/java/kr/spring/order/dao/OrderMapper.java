package kr.spring.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.order.vo.OrderVO;
import kr.spring.zipcode.vo.ZipcodeVO;

@Mapper
public interface OrderMapper {
	//대표 배송지 주소 검색
	@Select("SELECT * FROM zipcode WHERE mem_num=#{mem_num} AND zip_auth=0")
	public ZipcodeVO selectZipcode(Integer mem_num);
	@Select("SELECT * FROM zipcode WHERE zip_num=#{zip_num}")
	public ZipcodeVO selectZip(Integer zip_num);
	@Insert("INSERT INTO orders (notice) VALUES (#{notice}) WHERE o_num=#{o_num} AND mem_num=#{mem_num}")
	public void insertNotice(OrderVO order);
	@Select("SELECT COUNT(*) FROM zipcode WHERE mem_num=#{mem_num}")
	public int selectZipRowCount(Map<String,Object> map, Integer mem_num);
	@Select("SELECT * FROM (SELECT a.*, rownum rnum FROM (SELECT * FROM zipcode WHERE mem_num = #{mem_num} ORDER BY zip_auth DESC)a) WHERE rnum >= #{start} AND rnum <= #{end}")
	public List<ZipcodeVO> selectZipList(Map<String,Object> map);
	@Insert("INSERT INTO zipcode (zip_num,zip_name,zip_cell,zip_rec,zip_auth,zipcode,address1,address2,mem_num) VALUES (zipcode_seq.nextval,#{zip_name},#{zip_cell},#{zip_rec},1,#{zipcode},#{address1},#{address2},#{mem_num})")
	public void insertZipcode(ZipcodeVO zipcode);
	@Update("UPDATE zipcode SET zip_auth=1 WHERE mem_num=#{mem_num}")
	public void updateallAuth(Integer mem_num);
	@Update("UPDATE zipcode SET zip_auth=0 WHERE zip_num=#{zip_num}")
	public void updateAuth(Integer zip_num);
	@Update("UPDATE zipcode SET zip_name=#{zip_name},zip_rec=#{zip_rec},zipcode=#{zipcode},address1=#{address1},address2=#{address2} WHERE zip_num=#{zip_num}")
	public void updateZipcode(ZipcodeVO zipcode);
	public OrderVO selectOrder(Integer mem_num);
	@Insert ("INSERT INTO orders (o_num,o_name,o_total,p_num,mem_num) "
			+ "VALUES(order_seq.nextval,#{o_name},#{o_total},#{p_num},#{mem_num})")
	public void insertOrder(Integer p_num);
	

}





