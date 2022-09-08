package kr.spring.zipcode.vo;

public class ZipcodeVO {
	private int zip_num;
	private String zip_name;
	private String zip_cell;
	private String zip_rec;
	private int zip_auth;
	private String zipcode;
	private String address1;
	private String address2;
	private int mem_num;
	
	public int getZip_num() {
		return zip_num;
	}
	public void setZip_num(int zip_num) {
		this.zip_num = zip_num;
	}
	public String getZip_name() {
		return zip_name;
	}
	public void setZip_name(String zip_name) {
		this.zip_name = zip_name;
	}
	public String getZip_cell() {
		return zip_cell;
	}
	public void setZip_cell(String zip_cell) {
		this.zip_cell = zip_cell;
	}
	public String getZip_rec() {
		return zip_rec;
	}
	public void setZip_rec(String zip_rec) {
		this.zip_rec = zip_rec;
	}
	public int getZip_auth() {
		return zip_auth;
	}
	public void setZip_auth(int zip_auth) {
		this.zip_auth = zip_auth;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	@Override
	public String toString() {
		return "ZipcodeVO [zip_num=" + zip_num + ", zip_name=" + zip_name + ", zip_cell=" + zip_cell + ", zip_rec="
				+ zip_rec + ", zip_auth=" + zip_auth + ", zipcode=" + zipcode + ", address1=" + address1 + ", address2="
				+ address2 + ", mem_num=" + mem_num + "]";
	}
	
}
