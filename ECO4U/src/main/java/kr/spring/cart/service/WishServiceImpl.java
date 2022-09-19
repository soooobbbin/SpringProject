package kr.spring.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.cart.dao.WishMapper;
import kr.spring.cart.vo.WishVO;

@Service
@Transactional
public class WishServiceImpl implements WishService{

	@Autowired
	private WishMapper wishMapper;
	
	@Override
	public List<WishVO> selectList(Map<String, Object> map) {
		return wishMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return wishMapper.selectRowCount(map);
	}
	
	
	@Override
	public void updateWish(Integer w_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteWish(Integer w_num) {
		wishMapper.deleteWish(w_num);
	}

	@Override
	public WishVO selectWish(WishVO wish) {
		return wishMapper.selectWish(wish);
	}

	@Override
	public void insertWish(WishVO wishVO) {
		wishMapper.insertWish(wishVO);
	}

	@Override
	public void deleteWishByProductNum(Integer p_num) {
		wishMapper.deleteWishByProductNum(p_num);
	}

	@Override
	public void deleteWishChecked(String del_product) {
		String[] ajaxMsg = del_product.split(",");
		for(int i=0; i<ajaxMsg.length; i++) {
			wishMapper.deleteWish(Integer.parseInt(ajaxMsg[i]));
			wishMapper.deleteWishByProductNum(Integer.parseInt(ajaxMsg[i]));
		}
	}

	

}
