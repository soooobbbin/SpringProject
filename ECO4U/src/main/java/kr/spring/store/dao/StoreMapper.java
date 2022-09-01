package kr.spring.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.store.vo.StoreVO;

@Mapper
public interface StoreMapper {
	@Select("INSERT INTO store (s_num,s_name,s_content,s_tel,"
			+ "s_zipcode,s_addr1,s_addr2,photo,photo_name) "
			+ "VALUES (store_seq.nextval,#{s_name},#{s_content},#{s_tel},"
			+ "#{zipcode},#{address1},#{address2},#{photo},#{photo_name})")
	public void insertStore(StoreVO store);
	@Select("SELECT * FROM store WHERE s_num=#{s_num}")
	public StoreVO selectStore(Integer s_num);
	@Update("UPDATE store SET s_name=#{name},s_content=#{s_content},"
			+ "s_tel=#{s_tel},s_zipcode=#{zipcode},s_addr1=#{address1},"
		+ "s_addr2=#{address2},photo=#{photo},photo_name=#{photo_name},"
		+ "modify_date=SYSDATE WHERE s_num=#{s_num}")
	public void updateStore(StoreVO store);
	

	public void deleteStore(Integer s_num);
	
	//가게관리 - 관리자
	public int selectRowCount(Map<String,Object> map);
	public List<StoreVO> selectList(Map<String,Object> map);
	
}
