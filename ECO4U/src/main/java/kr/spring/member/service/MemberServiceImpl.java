package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public void insertMember(MemberVO member) {
		member.setMem_num(memberMapper.selectMem_num());
		memberMapper.insertMember(member);
		memberMapper.insertMember_detail(member);
		memberMapper.insertZipcode(member);
	}
	//카카오회원가입
	@Override
	public void insertkakaoMember(MemberVO member,String id) {
		// TODO Auto-generated method stub
		member.setMem_num(memberMapper.selectMem_num());
		int mem_num = member.getMem_num();
		memberMapper.insertkakaoMember(mem_num,id);
		memberMapper.insertkakaoMember_detail(mem_num,id);
		memberMapper.insertkakaoZipcode(mem_num);
	}
	@Override
	public MemberVO selectCheckkakaoMember(String id) {
		return memberMapper.selectCheckkakaoMember(id);
	}
	
	@Override
	public MemberVO selectCheckMember(String id) {
		return memberMapper.selectCheckMember(id);
	}

	@Override
	public MemberVO selectCheckNameMember(String name) {
		// TODO Auto-generated method stub
		return memberMapper.selectCheckNameMember(name);
	}
	
	@Override
	public MemberVO selectMember(Integer mem_num) {
		return memberMapper.selectMember(mem_num);
	}

	@Override
	public void updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		memberMapper.updateMember_detail(member);
		memberMapper.updatezipcode(member);
		
	}

	@Override
	public void updatePassword(MemberVO member) {
		// TODO Auto-generated method stub
		memberMapper.updatePassword(member);
	}

	@Override
	public void updatefindPassword(Integer mem_num,String mem_pw) {
		// TODO Auto-generated method stub
		memberMapper.updatefindPassword(mem_num,mem_pw);
	}
	
	@Override
	public void deleteMember(Integer mem_num) {
		// TODO Auto-generated method stub
		memberMapper.deletezipcode(mem_num);
		memberMapper.deleteMember_detail(mem_num);
		memberMapper.deleteMember(mem_num);
	}
	
	//회원관리
	@Override
	public List<MemberVO> selectList(Map<String, Object> map) {
		return memberMapper.selectList(map);
	}
	
	@Override
	public int selectRowCount(Map<String, Object> map) {
		return memberMapper.selectRowCount(map);
	}

	
}
