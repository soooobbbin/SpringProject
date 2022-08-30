package kr.spring.wish.vo;

import java.sql.Date;

public class WishVO {
	private int w_num;
	private Date reg_date;
	private Date modify_date;
	private int mem_num;
	private int p_num;
	
	
	public int getW_num() {
		return w_num;
	}
	public void setW_num(int w_num) {
		this.w_num = w_num;
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
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	@Override
	public String toString() {
		return "WishVO [w_num=" + w_num + ", reg_date=" + reg_date + ", modify_date=" + modify_date + ", mem_num="
				+ mem_num + ", p_num=" + p_num + "]";
	}
	
	
}
