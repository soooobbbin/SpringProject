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

	@Override
	public List<QnAVO> selectQnAList(Map<String, Object> map) {
		return qnaMapper.selectQnAList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return qnaMapper.selectRowCount(map);
	}

	@Override
	public QnAVO selectQnA(Integer q_num) {
		return qnaMapper.selectQnA(q_num);
	}

}
