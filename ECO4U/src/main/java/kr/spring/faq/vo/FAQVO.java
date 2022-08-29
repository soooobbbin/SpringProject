package kr.spring.faq.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

public class FAQVO {
	private int f_num;//faq게시글 번호
	@NotEmpty
	private String f_title;//faq제목
	@NotEmpty
	private String f_content;//faq내용
	private int f_category;//1.회뭔문의 2.상품/배송문의 3.기타
	private Date reg_date;//등록일
	private Date modify_date;//수정일
	private int mem_num; //회원번호
	
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public int getF_category() {
		return f_category;
	}
	public void setF_category(int f_category) {
		this.f_category = f_category;
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
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	@Override
	public String toString() {
		return "FAQVO [f_num=" + f_num + ", f_title=" + f_title + ", f_content=" + f_content + ", f_category="
				+ f_category + ", reg_date=" + reg_date + ", modify_date=" + modify_date + ", mem_num=" + mem_num + "]";
	}
}
