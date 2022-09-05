package kr.spring.faq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.faq.dao.FAQMapper;
import kr.spring.faq.vo.FAQVO;



@Service
@Transactional
public class FAQServiceImpl implements FAQService{
	
	@Autowired
	private FAQMapper faqMapper;
	
	@Override
	public List<FAQVO> selectList(Map<String, Object> map) {
		return faqMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return faqMapper.selectRowCount(map);
	}

	@Override
	public void insertBoard(FAQVO faq) {
		faqMapper.insertBoard(faq);
	}
	
	@Override
	public FAQVO selectBoard(Integer f_num) {
		return faqMapper.selectBoard(f_num);
	}

	@Override
	public void updateBoard(FAQVO faq) {
		faqMapper.updateBoard(faq);
	}

	@Override
	public void deleteBoard(Integer f_num) {
		faqMapper.deleteBoard(f_num);
	}

}
