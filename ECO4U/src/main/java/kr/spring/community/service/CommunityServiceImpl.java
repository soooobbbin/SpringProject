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
		//부모글 좋아요 삭제
		communityMapper.deleteLikeByCNum(c_num);
		//댓글이 존재하면 댓글을 우선 삭제하고 부모글을 삭제
		communityMapper.deleteCommentByCNum(c_num);
		//부모글 삭제
		communityMapper.deleteCommunity(c_num);
	}

	@Override
	public void deleteFile(Integer c_num) {
		communityMapper.deleteFile(c_num);
	}

	@Override
	public CommunityLikeVO selectLike(CommunityLikeVO like) {
		return communityMapper.selectLike(like); //데이터가 등록 돼 있는지 확인해주는 부분
	}
	
	
	@Override
	public int selectLikeCount(Integer c_num) {
		return communityMapper.selectLikeCount(c_num); 
	}

	@Override
	public void insertLike(CommunityLikeVO communityLike) {
		communityMapper.insertLike(communityLike);
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
		return communityMapper.selectComment(com_num);
	}

	@Override
	public void insertComment(CommunityCommentVO communityComment) {
		communityMapper.insertComment(communityComment);
		
	}

	@Override
	public void updateComment(CommunityCommentVO communityComment) {
		communityMapper.updateComment(communityComment);
		
	}

	@Override
	public void deleteComment(Integer com_num) {
		communityMapper.deleteComment(com_num);
		
	}

	@Override
	public void updateComCnt(Integer c_num) {
		communityMapper.updateComCnt(c_num);
	}

	@Override
	public void updateLikeCnt(Integer c_num) {
		communityMapper.updateLikeCnt(c_num);
		
	}

	@Override
	public void updateNotice(Integer c_num) {
		communityMapper.updateNotice(c_num);
	}
	@Override
	public void updateNotice2(Integer c_num) {
		communityMapper.updateNotice2(c_num);
	}
	
	

}