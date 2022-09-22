package kr.spring.faq.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.faq.vo.QnAVO;
import kr.spring.faq.vo.QnAcommentVO;

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
	
	//댓글
	public List<QnAcommentVO> selectListComment(Map<String,Object> map);
	@Select("SELECT COUNT(*) FROM qna_comment qc "
			+ "JOIN member m ON qc.mem_num=m.mem_num "
			+ "WHERE q_num=#{q_num}")
	public int selectRowCountComment(Map<String,Object> map);
	@Select("SELECT * FROM qna_comment WHERE qc_num=#{qc_num}")
	public QnAcommentVO selectComment(Integer qc_num);
	@Insert("INSERT INTO qna_comment (qc_num,"
			+ "qc_content,q_num,mem_num) "
			+ "VALUES (qna_comment_seq.nextval,#{qc_content},"
			+ "#{q_num},#{mem_num})")
	public void insertComment(QnAcommentVO qnacommentVO);
	@Update("UPDATE qna_comment SET "
			+ "qc_content=#{qc_content}, "
			+ "modify_date=SYSDATE WHERE qc_num=#{qc_num}")
	public void updateComment(QnAcommentVO qnacommentVO);
	@Delete("DELETE FROM qna_comment WHERE qc_num=#{qc_num}")
	public void deleteComment(Integer qc_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	@Delete("DELETE FROM qna_comment "
			+ "WHERE q_num=#{q_num}")
	public void deleteCommentByQNum(Integer q_num);
	
	//댓글수
	@Update("UPDATE qna q SET q.com_cnt = "
			+ "(SELECT COUNT(qc_num) FROM qna_comment WHERE q_num = #{q_num}) "
			+ "WHERE q.q_num = #{q_num}")
	public void updateComCnt(Integer q_num);
	
	//관리자
	public List<QnAVO> selectmnQnAList(Map<String,Object> map);
	public int selectmnRowCount(Map<String,Object> map);
	public void updatemnQnA(QnAVO qna);
}





