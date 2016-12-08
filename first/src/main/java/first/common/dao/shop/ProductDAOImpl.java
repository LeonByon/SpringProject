package first.common.dao.shop;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import first.common.dto.ProductDTO;


//여기서 Mapper를 호출 (sql)
//스프링 dao bean으로 등록 하기 위해서는 repository를 어노테이션 해야함
@Repository
public class ProductDAOImpl implements ProductDAO {

	//mybatis bean을 주입(Injection)
	@Inject
	SqlSession sqlSession;

	@Override
	public List<ProductDTO> productList() {
		List<ProductDTO> list=null;
		try {
			list=sqlSession.selectList("productList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ProductDTO productDetail(int product_id) {
		ProductDTO dto=null;
		try {//selectOne은 레코드 하나만 select 하겠다.
			dto=sqlSession.selectOne("product_detail", product_id);//상품코드에 해당하는 테그를 만듬
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void productInsert(ProductDTO dto) {
		try {
			sqlSession.insert("productInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void productUpdate(ProductDTO dto) {
		try {
			sqlSession.update("productUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
//상품 삭제
	@Override
	public void productDelete(int product_id) {
		try {
			sqlSession.delete("productDelete",product_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
