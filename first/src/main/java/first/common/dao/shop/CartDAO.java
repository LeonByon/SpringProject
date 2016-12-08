package first.common.dao.shop;

import java.util.List;

import first.common.dto.CartDTO;


public interface CartDAO {
	//장바구니에 추가
	public void cartAdd(CartDTO dto);

	//장바구니 목록
	//장바구니는 사용자마다 장바구니가 다르기 때문에 userid를 입력받아 식별자로 사용
	//그 아이디에 해당되는 장바구니 목록을 리스트로 만들어서 리턴
	public List<CartDTO> cartList(String userid);

	//장바구니 삭제
	public void cartDel(int idx);

	//장바구니 비우기
	public void cartDelAll(String id);
}
