package kr.spring.community.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import kr.spring.util.DurationFromNow;


public class CommunityVO {
	private int c_num;
	@NotEmpty
	private String c_title;//제목
	@NotEmpty
	private String c_content;//내용
	private int c_hit;//조회수
	private String reg_date; //등록일
	private String modify_date; //수정일
	private byte[] c_uploadfile;//파일
	private String c_filename;//파일명
	private int c_category;//카테고리
	private int c_auth;//공지
	
	private int mem_num; //회원번호
	private String id; //회원아이디
	
	
	//파일 업로드 처리
		public void setUpload(MultipartFile upload)
		                              throws IOException{
			//MultipartFile -> byte[] 변환
			setC_uploadfile(upload.getBytes());
			//파일명 구하기
			setC_filename(upload.getOriginalFilename());
		}
		
	
	public int getC_auth() {
		return c_auth;
	}
	public void setC_auth(int c_auth) {
		this.c_auth = c_auth;
	}
	
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getC_hit() {
		return c_hit;
	}
	public void setC_hit(int c_hit) {
		this.c_hit = c_hit;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = DurationFromNow.getTimeDiffLabel(reg_date);
	}
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(Date modify_date) {
		this.modify_date = DurationFromNow.getTimeDiffLabel(modify_date);
	}
	public byte[] getC_uploadfile() {
		return c_uploadfile;
	}
	public void setC_uploadfile(byte[] c_uploadfile) {
		this.c_uploadfile = c_uploadfile;
	}
	public String getC_filename() {
		return c_filename;
	}
	public void setC_filename(String c_filename) {
		this.c_filename = c_filename;
	}
	public int getC_category() {
		return c_category;
	}
	public void setC_category(int c_category) {
		this.c_category = c_category;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	
	
	@Override
	public String toString() {
		return "CommunityVO [c_num=" + c_num + ", c_title=" + c_title + ", c_content=" + c_content + ", c_hit=" + c_hit
				+ ", reg_date=" + reg_date + ", modify_date=" + modify_date + ", c_filename=" + c_filename 
				+ ", mem_num=" + mem_num + ", id=" + id + ", c_category=" + c_category +", c_auth=" + c_auth
				+ "]";
	}
}
