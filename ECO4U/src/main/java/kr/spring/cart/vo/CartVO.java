package kr.spring.cart.vo;

import java.sql.Date;

public class CartVO {

	private int cart_num;
	private int order_quantity;
	private Date reg_date;
	private Date modify_date;
	private int mem_num;
	private int p_num;
	
	
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
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
		return "CartVO [cart_num=" + cart_num + ", order_quantity=" + order_quantity + ", reg_date=" + reg_date
				+ ", modify_date=" + modify_date + ", mem_num=" + mem_num + ", p_num=" + p_num + "]";
	}
	
	
}
