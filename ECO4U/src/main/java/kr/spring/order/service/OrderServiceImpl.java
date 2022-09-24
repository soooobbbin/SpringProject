package kr.spring.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.order.dao.OrderMapper;
import kr.spring.order.vo.OrderDetailVO;
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
	public void insertOrder(Map<String,Object> order,List<OrderDetailVO> list) {
		//주문번호 생성
		order.put("o_num",orderMapper.selectOrderNum());
		//주문등록
		orderMapper.insertOrder(order);
	
		//개별상품 주문등록
		for(OrderDetailVO vo : list) {
			//(주의)orderMapper.selectOrderNum()를 명시하면 
			//시퀀스가 증가하기 때문에 사용불가
			vo.setO_num((int) order.get("o_num"));
			orderMapper.insertOrderDetail(vo);
			//재고수 업데이트
			orderMapper.updateQuantity(vo);
		}
		//주문 상품 장바구니에서 제거
		orderMapper.deleteCartItem(order);
	}

	@Override
	public void insertOrder2(Map<String, Object> order) {
		// TODO Auto-generated method stub
		//주문번호 생성
		order.put("o_num",orderMapper.selectOrderNum());
		//주문등록
		orderMapper.insertOrder(order);
	
		//개별상품 주문등록
		//(주의)orderMapper.selectOrderNum()를 명시하면 
		//시퀀스가 증가하기 때문에 사용불가
		orderMapper.insertOrderDetai2(order);
		//재고수 업데이트
		orderMapper.updateQuantity2(order);
			
	}

	@Override
	public int selectOrderCountByMem_num(Map<String, Object> map) {
		return orderMapper.selectOrderCountByMem_num(map);
	}

	@Override
	public List<OrderVO> selectListOrderByMem_num(Map<String, Object> map) {
		return orderMapper.selectListOrderByMem_num(map);
	}

	@Override
	public int selectOrderCount(Map<String, Object> map) {
		return orderMapper.selectOrderCount(map);
	}

	@Override
	public List<OrderVO> selectListOrder(Map<String, Object> map) {
		return orderMapper.selectListOrder(map);
	}

	@Override
	public void updateOrder(OrderVO order) {
		orderMapper.updateOrder(order);
		//관리자에서 주문취소할 때 상품 개수 조정
		if(order.getStatus() == 5) {
			List<OrderDetailVO> detailList = orderMapper.selectListOrderDetail(
															order.getO_num());
			for(OrderDetailVO vo : detailList) {
				orderMapper.updateProductQuantity(vo);
			}
		}
		
	}

	@Override
	public OrderVO selectOrders(Integer o_num) {
		return orderMapper.selectOrders(o_num);
	}

	@Override
	public List<OrderDetailVO> selectListOrderDetail(Integer o_num) {
		return orderMapper.selectListOrderDetail(o_num);
	}
	
}
