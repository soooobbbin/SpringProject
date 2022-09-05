package kr.spring.faq.service;

import java.util.List;
import java.util.Map;

import kr.spring.faq.vo.FAQVO;

public interface FAQService {
	//부모글
	public List<FAQVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertBoard(FAQVO faq);
	public FAQVO selectBoard(Integer f_num);
	public void updateBoard(FAQVO faq);
	public void deleteBoard(Integer f_num);
}
