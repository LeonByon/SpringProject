package first.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CvController {
	@RequestMapping("shop/cv_list.do")
	public String cv_list(){
		System.out.println("cv_list.do호출...");
		return "shop/cv_list";
	}
}
