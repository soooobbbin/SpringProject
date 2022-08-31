package kr.spring.faq.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.faq.vo.FAQVO;

@Mapper
public interface FAQMapper {
	//부모글
	public List<FAQVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	@Insert("INSERT INTO faq (f_num,f_title,"
			+ "f_content,f_category,mem_num) "
			+ "VALUES (spboard_seq.nextval,#{f_title},"
			+ "#{f_content},#{f_category},#{filename},"
			+ "#{ip},#{mem_num})")
	public void insertBoard(FAQVO board);
//	@Select("SELECT * FROM faq f JOIN member m "
//			+ "USING(mem_num) JOIN member_detail d "
//			+ "USING(mem_num) WHERE f.f_num=#{f_num}")
//	public FAQVO selectBoard(Integer f_num);
//	@Update("UPDATE spboard SET hit=hit+1 WHERE board_num=#{board_num}")
//	public void updateHit(Integer board_num);
//	public void updateBoard(BoardVO board);
//	@Delete("DELETE FROM spboard WHERE board_num=#{board_num}")
//	public void deleteBoard(Integer board_num);
//	@Update("UPDATE spboard SET uploadfile='',"
//			+ "filename='' WHERE board_num=#{board_num}")
//	public void deleteFile(Integer board_num);
//	
//	//부모글 좋아요
//	@Select("SELECT * FROM spboard_fav "
//			+ "WHERE board_num=#{board_num} AND mem_num=#{mem_num}")
//	public BoardFavVO selectFav(BoardFavVO fav);
//	@Select("SELECT COUNT(*) FROM spboard_fav "
//			+ "WHERE board_num=#{board_num}")
//	public int selectFavCount(Integer board_num);
//	@Insert("INSERT INTO spboard_fav (fav_num,board_num,mem_num) "
//			+ "VALUES (fav_seq.nextval,#{board_num},#{mem_num})")
//	public void insertFav(BoardFavVO boardFav);
//	@Delete("DELETE FROM spboard_fav WHERE fav_num=#{fav_num}")
//	public void deleteFav(Integer fav_num);
//	@Delete("DELETE FROM spboard_fav WHERE board_num=#{board_num}")
//	public void deleteFavByBoardNum(Integer board_num);
	
}





