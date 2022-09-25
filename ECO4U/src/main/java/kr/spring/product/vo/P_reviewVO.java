package kr.spring.product.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import kr.spring.product.vo.ProductVO;

public class P_reviewVO {

	private int r_num; //리뷰id
	@NotEmpty
	private String r_content; //리뷰내용
	private byte[] r_photo; //이미지
	private String r_photoname; //이미지이름 
	private Date reg_date;
	private Date modify_date;
	private int p_num; //상품번호
	private int mem_num; //회원번호
	
	private int like_cnt; //추천 수
	
	private String id; //회원id
	
	private ProductVO productVO;
	
	// ========이미지 BLOB 처리===============//
	// (주의) 폼에서 파일업로드 파라미터네임은 반드시 upload로 지정해야 함
	public void setUpload(MultipartFile upload) throws IOException {
		// MultipartFile -> byte[]
		setR_photo(upload.getBytes());
		// 파일 이름
		setR_photoname(upload.getOriginalFilename());
	}
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public byte[] getR_photo() {
		return r_photo;
	}
	public void setR_photo(byte[] r_photo) {
		this.r_photo = r_photo;
	}
	public String getR_photoname() {
		return r_photoname;
	}
	public void setR_photoname(String r_photoname) {
		this.r_photoname = r_photoname;
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
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	

	//byte[] 타입의 프로퍼티 제외
	@Override
	public String toString() {
		return "P_reviewVO [r_num=" + r_num + ", r_content=" + r_content + ", r_photoname=" + r_photoname
				+ ", p_num=" + p_num + ", mem_num=" + mem_num + ", reg_date=" + reg_date + ", modify_date=" + modify_date
				+ ", like_cnt=" + like_cnt + ", id=" + id + ", productVO=" + productVO + "]";
	}
}
