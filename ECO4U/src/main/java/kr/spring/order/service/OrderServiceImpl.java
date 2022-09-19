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
	public ZipcodeVO selectZip(Integer zip_num) {
		// TODO Auto-generated method stub
		return orderMapper.selectZip(zip_num);
	}
	
	@Override
	public List<ZipcodeVO> selectZipList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.selectZipList(map);
	}

	@Override
	public int selectZipRowCount(Map<String, Object> map , Integer mem_num) {
		// TODO Auto-generated method stub
		return orderMapper.selectZipRowCount(map, mem_num);
	}
	
	@Override
	public void insertNotice(OrderVO order) {
		// TODO Auto-generated method stub
		orderMapper.insertNotice(order);
	}
	
	@Override
	public void insertZipcode(ZipcodeVO zipcode) {
		// TODO Auto-generated method stub
		orderMapper.insertZipcode(zipcode);
	}
	
	@Override
	public void updateAuth(Integer mem_num,Integer zip_num) {
		// TODO Auto-generated method stub
		orderMapper.updateallAuth(mem_num);
		orderMapper.updateAuth(zip_num);
	}
	
	@Override
	public void updateZipcode(ZipcodeVO zipcode) {
		// TODO Auto-generated method stub
		orderMapper.updateZipcode(zipcode);
	}

	@Override
	public OrderVO selectOrder(Integer mem_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertOrder(Integer cart_num) {
		orderMapper.insertOrder(order);
	}
	@Override
	public void insertOrderChecked(String del_product) {
		String[] ajaxMsg = del_product.split(",");
		for(int i=0; i<ajaxMsg.length; i++) {
			orderMapper.insertOrder(Integer.parseInt(ajaxMsg[i]));
		}
	}

}
