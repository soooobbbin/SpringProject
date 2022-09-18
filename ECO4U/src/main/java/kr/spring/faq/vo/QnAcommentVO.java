package kr.spring.faq.vo;

import java.sql.Date;

public class QnAcommentVO {
	private int qc_num;//1:1문의 댓글 번호
	private String qc_content;//댓글 내용
	private Date reg_date;//등록일
	private Date modify_date;//수정일
	private int mem_num;//회원번호
	private int q_num;//1:1문의 글번호
	
	private String mem_name;//회원이름
	private int auth;//1 일반, 2 관리자

	public int getQc_num() {
		return qc_num;
	}

	public void setQc_num(int qc_num) {
		this.qc_num = qc_num;
	}

	public String getQc_content() {
		return qc_content;
	}

	public void setQc_content(String qc_content) {
		this.qc_content = qc_content;
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

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "QnAcommentVO [qc_num=" + qc_num + ", qc_content=" + qc_content + ", reg_date=" + reg_date
				+ ", modify_date=" + modify_date + ", mem_num=" + mem_num + ", q_num=" + q_num + ", mem_name="
				+ mem_name + ", auth=" + auth + "]";
	}
}
