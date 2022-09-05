package kr.spring.cart.service;

import java.util.List;
import java.util.Map;


import kr.spring.cart.vo.WishVO;


public interface WishService {
	public List<WishVO> selectList(Map<String,Object>map);
	public int selectRowCount(Map<String,Object> map);
	public WishVO selectWish(Integer w_num);
	public void updateWish(Integer w_num);
	public void deleteWish(Integer w_num);

}
