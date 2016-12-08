package first.common.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.common.dao.MemberDAO;
import first.common.dto.MemberDTO;


//현재 클래스를 스프링의 컨트롤러 bean으로 등록시킴
@Controller
public class MemberController {
	//MemberDAO 인스턴스를 스프링에서 주입시킴
	@Inject
	MemberDAO memberDao;

	@RequestMapping("member/login.do")
	public String login(String id, String passwd, Model model, HttpSession session){
		//입력값이 없으면 login.jsp로 이동시킴
		if(id==null)return "member/login";
//로그인 폼에 입력한 id, passwd가 @RequestParam변수에 저장됨
		System.out.println("login 호출...");
		MemberDTO dto= memberDao.login(id, passwd);
		System.out.println(dto);
		if(dto==null){//로그인 실패
			//login.jsp로 이동
			model.addAttribute("message","아이디 또는 비밀번호가 일치하지 않습니다.");
			return "member/login";
		}else{//러그인 성공
			//세셩 저장은 매개 변수에 저장
			session.setAttribute("id", id);
			session.setAttribute("name", dto.getName());
			//main.jsp로 이동
			model.addAttribute("message", dto.getName()+"님 환영합니다.");
			return "main";
		}
	}
	@RequestMapping("member/logout.do")
	public String logout(HttpSession session, Model model){
		//세션 변수를 초기화 시킴
		session.invalidate();
		//모델에 자료 저장
		model.addAttribute("message","로그아웃되었습니다.");
		return "member/login";
	}
}
