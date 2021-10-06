package com.morganj.RamenRecipeBook.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@GetMapping("/newpost")
	public String newPost() {
		return "post/newpost";
	}
	
	@GetMapping("/main")
	public String mainpage(
			HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		
		//model.addAttribute("postList", postList);
		
		return "post/page";
	}
	
	@GetMapping("/mypage_view")
	public String mainpageView() {
		return "post/mypage";
	}

}
