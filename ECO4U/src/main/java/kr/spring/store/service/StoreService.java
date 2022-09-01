package kr.spring.store.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.store.vo.StoreVO;

public interface StoreService {
	//가게관리 - 관리자
	public void insertStore(StoreVO store);
	public StoreVO selectStore(Integer s_num);
	public void updateStore(StoreVO store);
	public void deleteStore(Integer s_num);
	
	public int selectRowCount(Map<String,Object> map);
	public List<StoreVO> selectList(Map<String,Object> map);

}
