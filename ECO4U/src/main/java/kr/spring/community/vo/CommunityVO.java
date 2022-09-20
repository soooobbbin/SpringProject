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
	private Date reg_date2; //등록일 yyyy-mm-dd형식
	private String modify_date; //수정일
	private byte[] uploadfile;//파일
	private String filename;//파일명
	private int c_category;//카테고리
	private int c_auth;//공지사항 0:공지아님 1:공지
	private int com_cnt; //댓글 수 추가
	private int like_cnt; //댓글 수 추가
	

	private int mem_num; //회원번호
	
	

	private String id; //회원아이디
	
	//파일 업로드 처리
	public void setUpload(MultipartFile upload) throws IOException{
		//MultipartFile -> byte[] 변환
		setUploadfile(upload.getBytes());
		//파일명 구하기
		setFilename(upload.getOriginalFilename());
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
	public Date getReg_date2() {
		return reg_date2;
	}
	public void setReg_date2(Date reg_date2) {
		this.reg_date2 = reg_date2;
	}
	
	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}
	public String getModify_date() {
		return modify_date;
	}
	public int getCom_cnt() {
		return com_cnt;
	}

	public void setCom_cnt(int com_cnt) {
		this.com_cnt = com_cnt;
	}

	public byte[] getUploadfile() {
		return uploadfile;
	}


	public void setUploadfile(byte[] uploadfile) {
		this.uploadfile = uploadfile;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
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
	
	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	@Override
	public String toString() {
		return "CommunityVO [c_num=" + c_num + ", c_title=" + c_title + ", c_content=" + c_content + ", c_hit=" + c_hit
				+ ", reg_date=" + reg_date + ", reg_date2=" + reg_date2 + ", modify_date=" + modify_date  + ", filename=" + filename + ", c_category="
				+ c_category + ", c_auth=" + c_auth + ", mem_num=" + mem_num + ", com_cnt=" + com_cnt + ", like_cnt=" + like_cnt + ", id=" + id + "]";
	}

	

}
