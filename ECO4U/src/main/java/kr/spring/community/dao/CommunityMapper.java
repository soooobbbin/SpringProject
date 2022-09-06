package kr.spring.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.community.vo.CommunityLikeVO;
import kr.spring.community.vo.CommunityCommentVO;
import kr.spring.community.vo.CommunityVO;

@Mapper
public interface CommunityMapper{
	//부모글
		public List<CommunityVO> selectList(Map<String,Object> map);
		public int selectRowCount(Map<String,Object> map);
		@Insert("INSERT INTO community (c_num,c_title,c_category,"
				+ "c_content,c_uploadfile,c_filename,mem_num) "
				+ "VALUES (community_seq.nextval,#{c_title},#{c_category},"
				+ "#{c_content},#{c_uploadfile},#{c_filename},"
				+ "#{mem_num})")
		public void insertCommunity(CommunityVO community);
		@Select("SELECT * FROM community b JOIN member m "
				+ "USING(c_num) JOIN member_detail d "
				+ "USING(c_num) WHERE b.c_num=#{c_num}")
		public CommunityVO selectCommunity(Integer c_num);
		@Update("UPDATE community SET c_hit=c_hit+1 WHERE c_num=#{c_num}")
		public void updateC_hit(Integer c_num);
		public void updateCommunity(CommunityVO community);
		@Delete("DELETE FROM community WHERE c_num=#{c_num}")
		public void deleteCommunity(Integer c_num);
		@Update("UPDATE community SET uploadc_file='',"
				+ "c_filename='' WHERE c_num=#{c_num}")
		public void deleteFile(Integer c_num);
		
	
		//부모글 좋아요
		@Select("SELECT * FROM c_like "
				+ "WHERE c_num=#{c_num} AND mem_num=#{mem_num}")
		public CommunityLikeVO selectLike(CommunityLikeVO like);
		@Select("SELECT COUNT(*) FROM c_like "
				+ "WHERE c_num=#{c_num}")
		public int selectLikeCount(Integer c_num);
		@Insert("INSERT INTO c_like (c_like_num,c_num,mem_num) "
				+ "VALUES (c_like_seq.nextval,#{c_num},#{mem_num})")
		public void insertLike(CommunityLikeVO communityLike);
		@Delete("DELETE FROM c_like WHERE c_like_num=#{c_like_num}")
		public void deleteLike(Integer c_like_num);
		@Delete("DELETE FROM c_like WHERE c_num=#{c_num}")
		public void deleteLikeByCommunityNum(Integer c_num);
		
		//댓글
		
		public List<CommunityCommentVO> selectListComment(
                Map<String,Object> map);
			@Select("SELECT COUNT(*) FROM c_comment b "
						+ "JOIN member m ON b.mem_num=m.mem_num "
						+ "WHERE c_num=#{c_num}")
			public int selectRowCountComment(Map<String,Object> map);
			@Select("SELECT * FROM c_comment WHERE com_num=#{com_num}")
			public CommunityCommentVO selectComment(Integer com_num);
			@Insert("INSERT INTO c_comment (com_num,"
					+ "com_content,c_num,mem_num) "
					+ "VALUES (comment_seq.nextval,#{com_content},"
					+ "#{c_num},#{mem_num})")
			public void insertComment(CommunityCommentVO communityComment);
			@Update("UPDATE c_comment SET "
					+ "com_content=#{com_content}, "
					+ "regdate=SYSDATE WHERE com_num=#{com_num}")
			public void updateComment(CommunityCommentVO communityComment);
			@Delete("DELETE FROM c_comment WHERE com_num=#{com_num}")
			public void deleteComment(Integer com_num);
			//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
			@Delete("DELETE FROM c_comment "
					+ "WHERE c_num=#{c_num}")
			public void deleteCommentByCommunityNum(Integer c_num);
			
			
			
}
		

