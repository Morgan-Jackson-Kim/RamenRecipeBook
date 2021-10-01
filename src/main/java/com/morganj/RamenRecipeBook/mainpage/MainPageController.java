package com.morganj.RamenRecipeBook.mainpage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainPageController {
	@GetMapping("/page_view")
	public String signInView() {
		return "main/page";
	}
	
	@GetMapping("/mypage_view")
	public String signUpView() {
		return "main/mypage";
	}

}
