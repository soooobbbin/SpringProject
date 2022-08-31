package kr.spring.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.community.dao.CommunityMapper;
import kr.spring.community.vo.CommunityLikeVO;
import kr.spring.community.vo.CommunityCommentVO;
import kr.spring.community.vo.CommunityVO;

@Service
@Transactional
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityMapper communityMapper;
	
	@Override
	public List<CommunityVO> selectList(Map<String, Object> map) {
		return communityMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return communityMapper.selectRowCount(map);
	}

	@Override
	public void insertCommunity(CommunityVO community) {
		communityMapper.insertCommunity(community);
	}

	@Override
	public CommunityVO selectCommunity(Integer c_num) {
		return communityMapper.selectCommunity(c_num);
	}


	@Override
	public void updateC_hit(Integer c_num) {
		communityMapper.updateC_hit(c_num);
	}

	@Override
	public void updateCommunity(CommunityVO community) {
		communityMapper.updateCommunity(community);
	}

	@Override
	public void deleteCommunity(Integer c_num) {
		/*//부모글 좋아요 삭제
		communityMapper.deleteLikeByCommunityNum(c_num);*/
		//부모글 삭제
		communityMapper.deleteCommunity(c_num);
	}

	@Override
	public void deleteFile(Integer c_num) {
		// TODO Auto-generated method stub
		
	}

	
	/*
	@Override
	public void deleteFile(Integer c_num) {
		communityMapper.deleteFile(c_num);
	}

	@Override
	public CommunityLikeVO selectLike(CommunityLikeVO like) {
		return communityMapper.selectLike(like);
	}
	*/
	
	/*

	@Override
	public int selectLikeCount(Integer c_num) {
		return communityMapper.selectLikeCount(c_num);
	}

	@Override
	public void insertLike(CommunityLikeVO CommunityLike) {
		CommunityMapper.insertLike(CommunityLike);
	}

	@Override
	public void deleteLike(Integer c_like_num) {
		communityMapper.deleteLike(c_like_num);
	}

	@Override
	public List<CommunityCommentVO> selectListComment(Map<String, Object> map) {
		
		return communityMapper.selectListComment(map);
	}

	@Override
	public int selectRowCountComment(Map<String, Object> map) {
		return communityMapper.selectRowCountComment(map);
	}

	@Override
	public CommunityCommentVO selectComment(Integer com_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertComment(CommunityCommentVO communityComment) {
		communityMapper.insertComment(communityComment);
		
	}

	@Override
	public void updateComment(CommunityCommentVO communityComment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComment(Integer com_num) {
		// TODO Auto-generated method stub
		
	}
*/
}