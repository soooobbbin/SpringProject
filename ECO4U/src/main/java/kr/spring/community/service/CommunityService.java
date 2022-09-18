package kr.spring.community.service;

import java.util.List;
import java.util.Map;

import kr.spring.community.vo.CommunityLikeVO;

import kr.spring.community.vo.CommunityCommentVO;
import kr.spring.community.vo.CommunityVO;

public interface CommunityService {
	//부모글
	public List<CommunityVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertCommunity(CommunityVO community);
	public CommunityVO selectCommunity(Integer c_num);
	public void updateC_hit(Integer c_num);
	public void updateCommunity(CommunityVO community);
	public void deleteCommunity(Integer c_num);
	public void deleteFile(Integer c_num);	
	public void updateComCnt(Integer c_num);
	public void updateLikeCnt(Integer c_num);
	
	//부모글 좋아요
	public CommunityLikeVO selectLike(CommunityLikeVO like);
	public int selectLikeCount(Integer c_num);
	public void insertLike(CommunityLikeVO communityLike);
	public void deleteLike(Integer c_like_num);

	//댓글
	public List<CommunityCommentVO> selectListComment(Map<String,Object> map);
	public int selectRowCountComment(Map<String,Object> map);
	public CommunityCommentVO selectComment(Integer com_num);
	public void insertComment(CommunityCommentVO communityComment);
	public void updateComment(CommunityCommentVO communityComment);
	public void deleteComment(Integer com_num);
	


}

