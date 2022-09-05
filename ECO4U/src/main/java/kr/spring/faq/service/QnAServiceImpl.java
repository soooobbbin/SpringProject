package kr.spring.faq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.faq.dao.QnAMapper;
import kr.spring.faq.vo.QnAVO;



@Service
@Transactional
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	private QnAMapper qnaMapper;

	@Override
	public void insertQnA(QnAVO qna) {
		qnaMapper.insertQnA(qna);
	}

}
