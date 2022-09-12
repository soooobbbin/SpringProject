package kr.spring.faq.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.faq.vo.QnAVO;

@Mapper
public interface QnAMapper {
	//부모글
	public List<QnAVO> selectQnAList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	@Insert("INSERT INTO qna (q_num,q_title,"
			+ "q_content,q_category,mem_num,q_photo,q_photo_name) "
			+ "VALUES (qna_seq.nextval,#{q_title},"
			+ "#{q_content},#{q_category},#{mem_num},#{q_photo},#{q_photo_name})")
	public void insertQnA(QnAVO qna);
	@Select("SELECT * FROM qna q JOIN member m "
		+ "USING(mem_num) JOIN member_detail d "
		+ "USING(mem_num) WHERE q.q_num=#{q_num}")
	public QnAVO selectQnA(Integer q_num);
	public void updateQnA(QnAVO qna);
	@Delete("DELETE FROM qna WHERE q_num=#{q_num}")
	public void deleteQnA(Integer q_num);
}





