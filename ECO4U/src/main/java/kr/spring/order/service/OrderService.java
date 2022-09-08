package kr.spring.order.service;

import java.util.List;
import java.util.Map;

import kr.spring.order.vo.OrderVO;
import kr.spring.zipcode.vo.ZipcodeVO;

public interface OrderService {
	
	public ZipcodeVO selectZipcode(Integer mem_num);
	
	public void updateZipcode(ZipcodeVO zipcode);

	public void insertOrder(OrderVO order);

	public OrderVO selectOrder(Integer mem_num);
	
	public List<OrderVO> selectList(Map<String,Object> map);
	
	public int selectRowCount(Map<String,Object> map);


}

