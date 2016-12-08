package first.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	//웹프로젝트의 시작 페이지 설정
	@RequestMapping("/common/main.do")
	public String main(Model model){
		model.addAttribute("message", "홈페이지 방문을 환영합니다.");
		// /WEB-INF/views/main.jsp로 포워딩
		return "main";
	}
}
