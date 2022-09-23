package kr.spring.order.vo;

import java.sql.Date;

public class DeliverVO {
	private int d_num;
	private int d_status;
	private Date reg_date;
	private Date modify_date;
	private int zip_num;
	private int mem_num;
	private int p_num;
	private int o_num;
	
	
	public int getD_num() {
		return d_num;
	}
	public void setD_num(int d_num) {
		this.d_num = d_num;
	}
	public int getD_status() {
		return d_status;
	}
	public void setD_status(int d_status) {
		this.d_status = d_status;
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
	public int getZip_num() {
		return zip_num;
	}
	public void setZip_num(int zip_num) {
		this.zip_num = zip_num;
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
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	@Override
	public String toString() {
		return "DeliverVO [d_num=" + d_num + ", d_status=" + d_status + ", reg_date=" + reg_date + ", modify_date="
				+ modify_date + ", zip_num=" + zip_num + ", mem_num=" + mem_num + ", p_num=" + p_num + ", o_num="
				+ o_num + "]";
	}
	
	
}
