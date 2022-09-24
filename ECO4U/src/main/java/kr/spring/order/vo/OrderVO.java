package kr.spring.order.vo;

import java.sql.Date;

public class OrderVO {
	private int o_num;
	private String o_name;
	private int o_total;
	private int payment;
	private String notice;
	private Date reg_date;
	private Date modify_date;
	private int mem_num;
	private int status;
	
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public int getO_total() {
		return o_total;
	}
	public void setO_total(int o_total) {
		this.o_total = o_total;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "OrderVO [o_num=" + o_num + ", o_name=" + o_name + ", o_total=" + o_total + ", payment=" + payment
				+ ", notice=" + notice + ", reg_date=" + reg_date + ", modify_date=" + modify_date + ", mem_num="
				+ mem_num + ", status=" + status + "]";
	}
	
	

}
