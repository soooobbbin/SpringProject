package kr.spring.cart.vo;

import java.sql.Date;
import java.util.Arrays;

public class CartVO {

	private int cart_num;
	private int order_quantity;
	private Date reg_date;
	private Date modify_date;
	private int mem_num;
	private int p_num;
	private String p_name;
	private int p_price;
	private int p_dprice;
	private int p_quantity;
	private byte[] p_photo;
	private String p_photoname;
	private int p_category;
	private String p_brand;
	private int cart_total;

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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_dprice() {
		return p_dprice;
	}
	public void setP_dprice(int p_dprice) {
		this.p_dprice = p_dprice;
	}
	public int getP_quantity() {
		return p_quantity;
	}
	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}
	public byte[] getP_photo() {
		return p_photo;
	}
	public void setP_photo(byte[] p_photo) {
		this.p_photo = p_photo;
	}
	public String getP_photoname() {
		return p_photoname;
	}
	public void setP_photoname(String p_photoname) {
		this.p_photoname = p_photoname;
	}
	public int getP_category() {
		return p_category;
	}
	public void setP_category(int p_category) {
		this.p_category = p_category;
	}
	public String getP_brand() {
		return p_brand;
	}
	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}
	
	public int getCart_total() {
		return cart_total;
	}
	public void setCart_total(int cart_total) {
		this.cart_total = cart_total;
	}
	@Override
	public String toString() {
		return "CartVO [cart_num=" + cart_num + ", order_quantity=" + order_quantity + ", reg_date=" + reg_date
				+ ", modify_date=" + modify_date + ", mem_num=" + mem_num + ", p_num=" + p_num + ", p_name=" + p_name
				+ ", p_price=" + p_price + ", p_dprice=" + p_dprice + ", p_quantity=" + p_quantity + ", p_photoname="
				+ p_photoname + ", p_category=" + p_category + ", p_brand=" + p_brand + ", cart_total=" + cart_total
				+ "]";
	}
	
	
}
