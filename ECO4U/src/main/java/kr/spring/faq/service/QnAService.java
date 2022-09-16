package kr.spring.faq.service;

import java.util.List;
import java.util.Map;

import kr.spring.faq.vo.QnAVO;
import kr.spring.faq.vo.QnAcommentVO;

public interface QnAService {
	//부모글
	public List<QnAVO> selectQnAList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertQnA(QnAVO qna);
	public QnAVO selectQnA(Integer q_num);
	public void updateQnA(QnAVO qna);
	public void deleteQnA(Integer q_num);
	public void deleteQnAChecked(String del_qna);
	
	//댓글
	public List<QnAcommentVO> selectListComment(Map<String,Object> map);
	public int selectRowCountComment(Map<String,Object> map);
	public QnAcommentVO selectComment(Integer qc_num);
	public void insertComment(QnAcommentVO qnacomment);
	public void updateComment(QnAcommentVO qnacomment);
	public void deleteComment(Integer qc_num);
	/* public void deleteCommentChecked(String del_qnacomment); */
	
	//대댓글
//	public int maxNum();
//	public int maxStep(Integer ref);
//	public void updateStep(QnAcommentVO qnacommentVO);
}
