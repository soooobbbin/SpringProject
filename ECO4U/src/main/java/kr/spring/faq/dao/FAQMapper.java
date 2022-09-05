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
			+ "VALUES (faq_seq.nextval,#{f_title},"
			+ "#{f_content},#{f_category},#{mem_num})")
	public void insertBoard(FAQVO faq);
		@Select("SELECT * FROM faq f JOIN member m "
			+ "USING(mem_num) JOIN member_detail d "
			+ "USING(mem_num) WHERE f.f_num=#{f_num}")
	public FAQVO selectBoard(Integer f_num);
	public void updateBoard(FAQVO faq);
	@Delete("DELETE FROM faq WHERE f_num=#{f_num}")
	public void deleteBoard(Integer f_num);
}





