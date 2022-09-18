package kr.spring.community.vo;


import kr.spring.util.DurationFromNow;

public class CommunityCommentVO {
	private int com_num; //댓글 번호
	private String com_content; //내용
	private String reg_date; //등록일
	private String modify_date; //수정일
	private int c_num; //부모글 번호
	private int mem_num; //회원번호
	private String id; //아이디
	
	private CommunityVO communityVO;
	
	public CommunityVO getCommunityVO() {
		return communityVO;
	}
	public void setCommunityVO(CommunityVO communityVO) {
		this.communityVO = communityVO;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date  = DurationFromNow.getTimeDiffLabel(reg_date);
	}
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(String modify_date) {
		this.modify_date  = DurationFromNow.getTimeDiffLabel(modify_date);
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	
	
	
	@Override
	public String toString() {
		return "CommunityCommentVO [com_num=" + com_num + ", com_content=" + com_content + ", reg_date=" + reg_date + ", modify_date="
				+ modify_date + ", c_num=" + c_num + ", mem_num=" + mem_num + ", id=" + id + ", communityVO=" + communityVO + "]";
	}
}
