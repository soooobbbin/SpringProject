package kr.spring.order.service;

import java.util.List;
import java.util.Map;

import kr.spring.order.vo.OrderDetailVO;
import kr.spring.order.vo.OrderVO;
import kr.spring.zipcode.vo.ZipcodeVO;

public interface OrderService {
	//대표 배송지 조회 출력
	public ZipcodeVO selectZipcode(Integer mem_num);
	//배송지 조회 출력
	public ZipcodeVO selectZip(Integer zip_num);
	//배송시 요청사항 저장
	public void insertNotice(OrderVO order);
	//배송지 리스트
	public List<ZipcodeVO> selectZipList(Map<String,Object> map);
	//배송지 카운트
	public int selectZipRowCount(Map<String,Object> map, Integer mem_num);
	//배송지 추가
	public void insertZipcode(ZipcodeVO zipcode);
	//대표 배송지 변경
	public void updateAuth(Integer mem_num,Integer zip_num);
	//배송지 내용 수정
	public void updateZipcode(ZipcodeVO zipcode);

	public OrderVO selectOrder(Integer mem_num);
	
	//주문등록
	public void insertOrder(Map<String,Object> order,List<OrderDetailVO> list);
	public void insertOrder2(Map<String,Object> order);

	//사용자 - 전체글 개수/검색글 개수
	public int selectOrderCountByMem_num(Map<String,Object> map);
	//사용자 - 목록/검색글 목록
	public List<OrderVO> selectListOrderByMem_num(Map<String,Object> map);

}

