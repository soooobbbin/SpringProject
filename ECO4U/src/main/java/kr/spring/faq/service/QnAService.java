package kr.spring.faq.service;

import java.util.List;
import java.util.Map;

import kr.spring.faq.vo.QnAVO;

public interface QnAService {
	//부모글
//	public List<FAQVO> selectList(Map<String,Object> map);
//	public int selectRowCount(Map<String,Object> map);
	public void insertQnA(QnAVO qna);
//	public FAQVO selectBoard(Integer f_num);
//	public void updateBoard(FAQVO faq);
//	public void deleteBoard(Integer f_num);
}
