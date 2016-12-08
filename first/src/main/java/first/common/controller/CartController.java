package first.common.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import first.common.dao.shop.CartDAO;
import first.common.dto.CartDTO;

//현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 등록시킴
@Controller
public class CartController {
	@Inject //Repository로 등록된 CartDAOImpl bean을 주입시킴
	CartDAO cartDao;
	/*session 변수에 들어 있는 id와 사용자가 선택한 상품 코드와 개수를 받아서 처리해야한다.
	 * 이때 product_id 즉 상품코드는 히든으로 넘어왔다.
	 * 사용자가 선택한 amount
	 * 이것들을 dto에 저장하도록 함
	 * @RequestParam은 생략가능하며 변수명이 같으면 처리됨
	 * */
	@RequestMapping("shop/cart_add.do")
	public String cart_add(HttpSession session, @RequestParam int product_id, @RequestParam int amount, Model model){
		System.out.println("장바구니에 담기 호출...");
		//세션에 저장된 사용자의 아이디
		String userid=(String)session.getAttribute("id");
		CartDTO dto = new CartDTO(product_id, userid, amount);//생성자 만들었으니 생성자 호출
		cartDao.cartAdd(dto);
		return "redirect:/shop/cart_list.do"; //cart_list.do 컨트롤러로 이동
	}

	@RequestMapping("shop/cart_list.do")
	public String cart_list(HttpSession session, Model model){
		//세션변수에 저장된 사용자의 id
		String userid=(String)session.getAttribute("id");
		//장바구니 목록을 List에 저장
		List<CartDTO> list=cartDao.cartList(userid);
		//cart_list.jsp로 포워딩하여 출력시키기 위해서 모델에 자료 저장
		model.addAttribute("items",list);
		return "shop/cart_list";
	}

	@RequestMapping("shop/cart_del.do")
	public String cart_del(int idx){
		//dao에  delete요청
		cartDao.cartDel(idx);
		//리스트로 이동
		return "redirect:/shop/cart_list.do";
	}

	@RequestMapping("shop/cart_del_all.do")
	//전체 삭제때는 where절에 사용자 id로 해서 삭제 이때 아이디는 session에 저장되어있다.
	public String cart_del_all(HttpSession session){
		String id= (String)session.getAttribute("id");
		//dao에 삭제 요청
		cartDao.cartDelAll(id);
		//리스트로 이동
		return "redirect:/shop/cart_list.do";
	}
}

