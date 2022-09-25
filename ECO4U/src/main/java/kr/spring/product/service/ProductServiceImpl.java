package kr.spring.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.product.dao.ProductMapper;
import kr.spring.product.vo.P_reviewVO;
import kr.spring.product.vo.ProductVO;
import kr.spring.product.vo.R_favVO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<ProductVO> selectList(Map<String, Object> map) {
		return productMapper.selectList(map);
	}
	
	@Override
	public int selectRowCount(Map<String, Object> map) {
		return productMapper.selectRowCount(map);
	}

	@Override
	public void insertProduct(ProductVO product) {
		productMapper.insertProduct(product);
		
	}

	@Override
	public ProductVO selectProduct(Integer p_num) {
		return productMapper.selectProduct(p_num);
	}
	
	@Override
	public void changeStock(ProductVO product) {
		productMapper.changeStock(product);
	}

	@Override
	public void updateProduct(ProductVO product) {
		productMapper.updateProduct(product);
	}

	@Override
	public void deleteProduct(Integer p_num) {
		productMapper.deleteProduct(p_num);
	}

	@Override
	public void deletePhoto(Integer p_num) {
		productMapper.deletePhoto(p_num);
	}
	
	@Override
	public void updateReviewCount(Integer p_num) {
		productMapper.updateReviewCount(p_num);
	}

	@Override
	public List<P_reviewVO> selectListReview(Map<String,Object>map) {
		return productMapper.selectListReview(map);
	}
	
	@Override
	public List<P_reviewVO> selectMypageReviewList(Map<String,Object>map) {
		return productMapper.selectMypageReviewList(map);
	}

	@Override
	public int selectRowCountReview(Map<String, Object> map) {
		return productMapper.selectRowCountReview(map);
	}
	
	@Override
	public int selectMypageReviewRowCount(Map<String, Object> map) {
		return productMapper.selectMypageReviewRowCount(map);
	}
	
	@Override
	public P_reviewVO selectReview(Integer r_num) {
		return productMapper.selectReview(r_num);
	}

	@Override
	public void insertReview(P_reviewVO review) {
		productMapper.insertReview(review);
	}

	@Override
	public void updateReview(P_reviewVO review) {
		productMapper.updateReview(review);
	}

	@Override
	public void deleteReview(Integer r_num) {
		//리뷰 좋아요 삭제
		productMapper.deleteFavByR_Num(r_num);
		//리뷰 삭제
		productMapper.deleteReview(r_num);
	}
	
	@Override
	public void deleteR_photo(Integer r_num) {
		productMapper.deleteR_photo(r_num);
	}
	
	@Override
	public void updateFavCount(Integer r_num) {
		productMapper.updateFavCount(r_num);
	}

	@Override
	public R_favVO selectFav(R_favVO fav) {
		return productMapper.selectFav(fav);
	}

	@Override
	public int selectFavCount(Integer r_num) {
		return productMapper.selectFavCount(r_num);
	}

	@Override
	public void insertFav(R_favVO fav) {
		productMapper.insertFav(fav);
	}

	@Override
	public void deleteFav(Integer r_fav_num) {
		productMapper.deleteFav(r_fav_num);
	}

	//상품 관리(관리자)
	@Override
	public int selectProductCount(Map<String, Object> map) {
		return productMapper.selectProductCount(map);
	}

	@Override
	public List<ProductVO> selectProductList(Map<String, Object> map) {
		return productMapper.selectProductList(map);
	}
}
