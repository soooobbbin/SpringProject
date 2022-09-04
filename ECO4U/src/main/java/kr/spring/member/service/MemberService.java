package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import kr.spring.member.vo.MemberVO;

public interface MemberService {
	//회원관리 - 일반회원
	public void insertMember(MemberVO member);
	//회원관리 - 카카오회원
	public void insertkakaoMember(MemberVO member,String id);
	public MemberVO selectCheckkakaoMember(String id);
	public MemberVO selectCheckMember(String id);
	public MemberVO selectCheckNameMember(String name);
	public MemberVO selectMember(Integer mem_num);
	public void updateMember(MemberVO member);
	public void updatePassword(MemberVO member);
	public void updatefindPassword(Integer mem_num,String mem_pw);
	public void deleteMember(Integer mem_num);

	//회원관리 - 관리자
	public List<MemberVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void updateByAdmin(MemberVO member);
}

