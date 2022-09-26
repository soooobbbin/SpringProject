package kr.spring.order.vo;

public class OrderDetailVO {
	private int od_num;
	private int item_num;
	private String item_name;
	private int item_price;
	private int item_total; //개별상품구매금액
	private int od_quantity; //개별상품구매수량
	private int o_num; //주문번호
	
	public int getOd_num() {
		return od_num;
	}
	public void setOd_num(int od_num) {
		this.od_num = od_num;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_total() {
		return item_total;
	}
	public void setItem_total(int item_total) {
		this.item_total = item_total;
	}
	public int getOd_quantity() {
		return od_quantity;
	}
	public void setOd_quantity(int od_quantity) {
		this.od_quantity = od_quantity;
	}
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	
	
	@Override
	public String toString() {
		return "OrderDetailVO [od_num=" + od_num + ", item_num=" + item_num + ", item_name=" + item_name
				+ ", item_price=" + item_price + ", item_total=" + item_total + ", od_quantity=" + od_quantity
				+ ", o_num=" + o_num ;
	}
	
	
	
}
