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
	private FAQMapper FAQMapper;
	
	@Override
	public List<FAQVO> selectList(Map<String, Object> map) {
		return FAQMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return FAQMapper.selectRowCount(map);
	}

	@Override
	public void insertBoard(FAQVO faq) {
		FAQMapper.insertBoard(faq);
	}

}
