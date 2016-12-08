package first.common.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private int product_id;
	private String product_name;
	private int price;
	private String description;
	private String picture_url;
	//업로드한 파일이 저장되는 객체
	private MultipartFile file1;
	
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}
	//입력생성자(매개변수 5개)

	public ProductDTO(int product_id, String product_name, int price, String description, String picture_url) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.price = price;
		this.description = description;
		this.picture_url = picture_url;
	}
	//getter setter
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPicture_url() {
		return picture_url;
	}

	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	//toString
	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", product_name=" + product_name + ", price=" + price
				+ ", description=" + description + ", picture_url=" + picture_url + "]";
	}
	
	
	
	
}
