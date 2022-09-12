package kr.spring.faq.service;

import java.util.List;
import java.util.Map;

import kr.spring.faq.vo.QnAVO;

public interface QnAService {
	//부모글
	public List<QnAVO> selectQnAList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertQnA(QnAVO qna);
	public QnAVO selectQnA(Integer q_num);
	public void updateQnA(QnAVO qna);
	public void deleteQnA(Integer q_num);
	
	//댓글
//	public List<BoardReplyVO> selectListReply(
//			                 Map<String,Object> map);
//	public int selectRowCountReply(
//			                 Map<String,Object> map);
//	public BoardReplyVO selectReply(Integer re_num);
//	public void insertReply(BoardReplyVO boardReply);
//	public void updateReply(BoardReplyVO boardReply);
//	public void deleteReply(Integer re_num);
}
