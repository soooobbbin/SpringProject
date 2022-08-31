package kr.spring.store.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.store.vo.StoreVO;

@Service
@Transactional
public class StoreServiceImpl implements StoreService{

	@Override
	public int selectS_num() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertStore(StoreVO store) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public StoreVO selectStore(Integer s_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateStore(StoreVO store) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStore(Integer s_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<StoreVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
