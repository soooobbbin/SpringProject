package kr.spring.product.service;

import java.util.List;
import java.util.Map;

import kr.spring.product.vo.P_reviewVO;
import kr.spring.product.vo.ProductVO;
import kr.spring.product.vo.R_favVO;

public interface ProductService {
	
	//부모글
	public List<ProductVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertProduct(ProductVO product);
	public ProductVO selectProduct(Integer p_num);
	public void changeStock(ProductVO product);
	public void updateProduct(ProductVO product);
	public void deleteProduct(Integer p_num);
	public void deletePhoto(Integer p_num); 
	public void updateReviewCount(Integer p_num);

	//리뷰
	public List<P_reviewVO> selectListReview(Map<String,Object> map);
	public int selectRowCountReview(Map<String,Object> map);
	public P_reviewVO selectReview(Integer r_num);
	public void insertReview(P_reviewVO review);
	public void updateReview(P_reviewVO review);
	public void deleteReview(Integer r_num);
	public void deleteR_photo(Integer r_num);
	
	//리뷰 좋아요
	public R_favVO selectFav(R_favVO fav);
	public int selectFavCount(Integer r_num);
	public void insertFav(R_favVO fav);
	public void deleteFav(Integer r_fav_num);
}
