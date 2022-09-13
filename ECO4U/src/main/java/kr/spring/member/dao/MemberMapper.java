package kr.spring.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	//회원관리 - 일반회원
	@Select("SELECT member_seq.nextval FROM dual")
	public int selectMem_num();
	@Insert("INSERT INTO member (mem_num,id,auth) VALUES (#{mem_num},#{id},1)")
	public void insertMember(MemberVO member);
	@Insert("INSERT INTO member_detail (mem_num,"
			+ "mem_name,mem_pw,mem_cell,mem_email)"
			+ " VALUES (#{mem_num},"
			+ "#{mem_name},#{mem_pw},#{mem_cell},#{mem_email})")
	public void insertMember_detail(MemberVO member);
	@Insert("INSERT INTO zipcode (zip_num,zip_name,zip_cell,zip_rec,zip_auth,zipcode,address1,address2,mem_num) "
			+ "VALUES (zipcode_seq.nextval,null,#{mem_cell},#{mem_name},0,#{zipcode},#{address1},#{address2},#{mem_num})")
	public void insertZipcode(MemberVO member);
	
	//카카오 회원가입
	@Insert("INSERT INTO member (mem_num,id) VALUES (#{mem_num},#{id})")
	public void insertkakaoMember(int mem_num,String id);
	@Insert("INSERT INTO member_detail (mem_num,mem_name,mem_email) VALUES (#{mem_num},'카카오회원',#{id})")
	public void insertkakaoMember_detail(int mem_num,String id);
	@Insert("INSERT INTO zipcode (zip_num,mem_num) VALUES (zipcode_seq.nextval,#{mem_num})")
	public void insertkakaoZipcode(int mem_num);
	@Select("SELECT * FROM member WHERE id=#{id}") 
	public MemberVO selectCheckkakaoMember(String id); 
	
	@Select("SELECT m.mem_num,m.id,m.auth,d.mem_pw,d.mem_cell,"
			+ "d.mem_email FROM "
			+ "member m LEFT OUTER JOIN "
			+ "member_detail d ON m.mem_num=d.mem_num "
			+ "WHERE m.id=#{id}")
	public MemberVO selectCheckMember(String id);
	@Select("SELECT m.mem_num,m.id,m.auth,d.mem_cell,"
			+ "d.mem_email FROM "
			+ "member m LEFT OUTER JOIN "
			+ "member_detail d ON m.mem_num=d.mem_num "
			+ "WHERE d.mem_name=#{name}")
	public MemberVO selectCheckNameMember(String name);
	@Select("SELECT * FROM member m JOIN member_detail d ON m.mem_num=d.mem_num JOIN zipcode z ON m.mem_num=z.mem_num WHERE m.mem_num=#{mem_num} AND z.zip_auth=0")
	public MemberVO selectMember(Integer mem_num);
	@Update("UPDATE member_detail SET mem_name=#{mem_name},mem_cell=#{mem_cell},mem_email=#{mem_email} WHERE mem_num=#{mem_num}")
	public void updateMember_detail(MemberVO member);
	@Update("UPDATE zipcode SET zipcode=#{zipcode},address1=#{address1},address2=#{address2} WHERE mem_num=#{mem_num}")
	public void updatezipcode(MemberVO member);
	@Update("UPDATE member_detail SET mem_pw=#{mem_pw} WHERE mem_num=#{mem_num}")
	public void updatePassword(MemberVO member);
	@Update("UPDATE member_detail SET mem_pw=#{mem_pw} WHERE mem_num=#{mem_num}")
	public void updatefindPassword(Integer mem_num,String mem_pw);
	@Delete("DELETE FROM member WHERE mem_num=#{mem_num}")
	public void deleteMember(Integer mem_num);
	@Delete("DELETE FROM member_detail WHERE mem_num=#{mem_num}")
	public void deleteMember_detail(Integer mem_num);
	@Delete("DELETE FROM zipcode WHERE mem_num=#{mem_num}")
	public void deletezipcode(Integer mem_num);
	
	//회원관리-관리자
	public List<MemberVO> selectList(Map<String,Object>map);
	public int selectRowCount(Map<String,Object>map);
	
	
}