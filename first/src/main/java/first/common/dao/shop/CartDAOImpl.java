package first.common.dao.shop;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import first.common.dto.CartDTO;

//현재 클래스가 스프링이 관리하는 dao bean으로 등록됨
@Repository
public class CartDAOImpl implements CartDAO {
	//스프링이 SqlSession 인스턴스(mybatis 실행 객체)를 생성하여 주입시킴
	@Inject
	SqlSession sqlSession;

	@Override
	public void cartAdd(CartDTO dto) {
		try {
			sqlSession.insert("cartAdd", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
//장바구니 목록
	@Override
	public List<CartDTO> cartList(String userid) {
		List<CartDTO> list=null;
		try {
			list = sqlSession.selectList("cartList", userid);//레코드가 두개 이상일 때는 selectList 한 개일 때는 selectOne
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public void cartDel(int idx) {
		try {
			sqlSession.delete("cartDel",idx);
		} catch (Exception e) {
			e.printStackTrace();		}

	}
	@Override
	public void cartDelAll(String id) {
		try {
			sqlSession.delete("cartDelAll",id);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
