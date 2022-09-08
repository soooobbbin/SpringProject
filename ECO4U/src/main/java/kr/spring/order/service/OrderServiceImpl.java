package kr.spring.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.order.dao.OrderMapper;
import kr.spring.order.vo.OrderVO;
import kr.spring.zipcode.vo.ZipcodeVO;

@Service
@Transactional
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public ZipcodeVO selectZipcode(Integer mem_num) {
		// TODO Auto-generated method stub
		return orderMapper.selectZipcode(mem_num);
	}
	
	@Override
	public void updateZipcode(ZipcodeVO zipcode) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertOrder(OrderVO order) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public OrderVO selectOrder(Integer mem_num) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<OrderVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
