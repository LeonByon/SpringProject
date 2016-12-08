package first.common.dao.shop;

import java.util.List;

import first.common.dto.ProductDTO;


public interface ProductDAO {
	//java.util.List
	public List<ProductDTO> productList();

	public ProductDTO productDetail(int product_id);
	//상품 코드를 입력 받아서 해당되는 레코드를 DTO에 저장해서 되돌려주는 메소드

	//상품등록
	public void productInsert(ProductDTO dto);

	//상품수정
	public void productUpdate(ProductDTO dto);

	//상품삭제
	public void productDelete(int product_id);
}
