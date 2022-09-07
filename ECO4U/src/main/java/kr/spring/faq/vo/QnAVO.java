package kr.spring.faq.vo;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class QnAVO {
	private int q_num;//1:1문의글 번호
	@NotEmpty
	private String q_title;//문의글 제목
	@NotEmpty
	private String q_content;//문의글 내용
	private int q_category;//1.회원문의 2.상품배송문의 3.기타
	private Date reg_date;//등록일
	private Date modify_date;//수정일
	private byte[] q_photo;
	private String q_photo_name;
	private int mem_num;//회원번호
	
	private String mem_id;//회원 아이디
	
	//========= 이미지 BLOB 처리 ==========//
	//(주의) 폼에서 파일업로드 파라미터네임은 반드시 upload로 지정해야함
	public void setUpload(MultipartFile upload)throws IOException {
		//MultipartFile -> byte[]
		setQ_photo(upload.getBytes());
		//파일 이름
		setQ_photo_name(upload.getOriginalFilename());
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public int getQ_category() {
		return q_category;
	}

	public void setQ_category(int q_category) {
		this.q_category = q_category;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public byte[] getQ_photo() {
		return q_photo;
	}

	public void setQ_photo(byte[] q_photo) {
		this.q_photo = q_photo;
	}

	public String getQ_photo_name() {
		return q_photo_name;
	}

	public void setQ_photo_name(String q_photo_name) {
		this.q_photo_name = q_photo_name;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "QnAVO [q_num=" + q_num + ", q_title=" + q_title + ", q_content=" + q_content + ", q_category="
				+ q_category + ", reg_date=" + reg_date + ", modify_date=" + modify_date + ", q_photo="
				+ Arrays.toString(q_photo) + ", q_photo_name=" + q_photo_name + ", mem_num=" + mem_num + ", mem_id="
				+ mem_id + "]";
	}
}
