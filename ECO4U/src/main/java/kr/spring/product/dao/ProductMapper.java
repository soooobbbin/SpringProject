package kr.spring.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.faq.vo.QnAVO;
import kr.spring.product.vo.P_reviewVO;
import kr.spring.product.vo.ProductVO;
import kr.spring.product.vo.R_favVO;

@Mapper
public interface ProductMapper {

	//부모글(상품페이지)
	public List<ProductVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	@Insert("INSERT INTO product (p_num,p_name,p_price,p_dprice,p_quantity,p_brand,p_photo,p_photoname,p_cont1,p_cont2,p_category) "
			+ "VALUES (product_seq.nextval,#{p_name},#{p_price},#{p_dprice},#{p_quantity},#{p_brand},#{p_photo},#{p_photoname},"
			+ "#{p_cont1},#{p_cont2},#{p_category})")
	public void insertProduct(ProductVO product);
	@Select("SELECT * FROM product WHERE p_num=#{p_num}")
	public ProductVO selectProduct(Integer p_num);
	public void changeStock(ProductVO product); //재고 수정
	public void updateProduct(ProductVO product);
	@Delete("DELETE FROM product WHERE p_num=#{p_num}")
	public void deleteProduct(Integer p_num);
	@Update("UPDATE product SET p_photo='',p_photoname='' WHERE p_num=#{p_num}")
	public void deletePhoto(Integer p_num);
	@Update("UPDATE product p SET p.review_count = "
			+ "(select count(r_num) from p_review where p_num = #{p_num}) "
			+ "where p.p_num = #{p_num}")
	public void updateReviewCount(Integer p_num);
	
	//상품관리(관리자)
	public int selectProductCount(Map<String,Object>map);
	public List<ProductVO> selectProductList(Map<String,Object> map);
	
	//리뷰
	public List<P_reviewVO> selectListReview(Map<String, Object> map);
	@Select("SELECT COUNT(*) FROM p_review r "
			+ "JOIN member m ON r.mem_num=m.mem_num "
			+ "WHERE p_num=#{p_num}")
	public int selectRowCountReview(Map<String,Object> map);
	@Select("SELECT * FROM p_review WHERE r_num=#{r_num}")
	public P_reviewVO selectReview(Integer r_num);
	@Insert("INSERT INTO p_review (r_num,r_content,"
			+ "p_num,mem_num) "
			+ "VALUES (p_review_seq.nextval,#{r_content},"
			+ "#{p_num},#{mem_num})")
	public void insertReview(P_reviewVO review);
	@Update("UPDATE p_review SET "
			+ "r_content=#{r_content}, "
			+ "modify_date=SYSDATE WHERE r_num=#{r_num}")
	public void updateReview(P_reviewVO review);
	@Delete("DELETE FROM p_review WHERE r_num=#{r_num}")
	public void deleteReview(Integer r_num);
	//상품 삭제 시 리뷰가 존재하면 상품 삭제 전 리뷰 삭제
	@Delete("DELETE FROM p_review WHERE p_num=#{p_num}") 
	public void deleteReviewByP_Num(Integer p_num);
	@Update("UPDATE p_review SET r_photo='',r_photoname='' WHERE r_num=#{r_num}")
	public void deleteR_photo(Integer r_num);
	@Update("UPDATE p_review r SET r.like_cnt = "
			+ "(select count(r_fav_num) from r_fav where r_num = #{r_num}) "
			+ "where r.r_num = #{r_num}")
	public void updateFavCount(Integer r_num);
	//마이페이지 상품평 목록
	public List<P_reviewVO> selectMypageReviewList(Map<String,Object> map);
	public int selectMypageReviewRowCount(Map<String,Object> map);
	
	//리뷰 좋아요
	@Select("SELECT * FROM r_fav WHERE r_num=#{r_num} AND mem_num=#{mem_num}")
	public R_favVO selectFav(R_favVO fav); //좋아요 눌렀는지 안 눌렀는지
	@Select("SELECT COUNT(*) FROM r_fav "
			+ "WHERE r_num=#{r_num}")
	public int selectFavCount(Integer r_num);
	@Insert("INSERT INTO r_fav (r_fav_num,r_num,mem_num) "
			+ "VALUES (r_fav_seq.nextval,#{r_num},#{mem_num})")
	public void insertFav(R_favVO fav);
	@Delete("DELETE FROM r_fav WHERE r_fav_num=#{r_fav_num}")
	public void deleteFav(Integer r_fav_num);
	@Delete("DELETE FROM r_fav WHERE r_num=#{r_num}")
	public void deleteFavByR_Num(Integer r_num);
	
}
