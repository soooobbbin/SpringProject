package kr.spring.product.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

public class ProductVO {

	private int p_num; //상품id
	private int r_num; //리뷰id
	@NotEmpty
	private String p_name; //상품명
	@Range(min=1,max=99999999)
	private int p_price; //상품 가격
	@Range(min=0,max=9999)
	private int p_dprice; //상품 배송비
	@Range(min=1,max=99999)
	private int p_quantity; //재고수량
	@NotEmpty
	private String p_brand; //브랜드
	
	//폼에서 전송된 이미지1(파일업로드 유효성 체크)
	private MultipartFile upload;
	//전송된 이미지를 byte[]로 변환
	private byte[] p_photo; //상품 대표이미지
	private String p_photoname; //이미지이름
	
	@NotEmpty
	private String p_cont1; //상품설명(간략)
	private String p_cont2; //상품추가설명
	private int p_status; //상품상태(1.표시/2.미표시)
	private int p_category; //상품카테고리(1.리빙/2.뷰티/3.패션)
	private Date reg_date;
	private Date modify_date;
	private int review_count; //상품에 달린 리뷰 수
	
	
	public MultipartFile getUpload() {
		return upload;
	}
	//업로드 파일 처리
	public void setUpload(MultipartFile upload) throws IOException{
		this.upload = upload;
		//MutipartFile -> byte[] 변환
		setP_photo(upload.getBytes());
		//파일명 구하기
		setP_photoname(upload.getOriginalFilename());
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
	public String getP_brand() {
		return p_brand;
	}
	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
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
	public String getP_cont1() {
		return p_cont1;
	}
	public void setP_cont1(String p_cont1) {
		this.p_cont1 = p_cont1;
	}
	public String getP_cont2() {
		return p_cont2;
	}
	public void setP_cont2(String p_cont2) {
		this.p_cont2 = p_cont2;
	}
	public int getP_status() {
		return p_status;
	}
	public void setP_status(int p_status) {
		this.p_status = p_status;
	}
	public int getP_category() {
		return p_category;
	}
	public void setP_category(int p_category) {
		this.p_category = p_category;
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
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	
	@Override
	public String toString() {
		return "ProductVO [p_num=" + p_num + ", r_num=" + r_num + ", p_name=" + p_name + ", p_price=" + p_price
				+ ", p_dprice=" + p_dprice + ", p_quantity=" + p_quantity + ", p_brand=" + p_brand + ", upload="
				+ upload + ", p_photoname=" + p_photoname + ", p_cont1=" + p_cont1 + ", p_cont2=" + p_cont2
				+ ", p_status=" + p_status + ", p_category=" + p_category + ", reg_date=" + reg_date + ", modify_date="
				+ modify_date + ", review_count=" + review_count + "]";
	}

	
}
