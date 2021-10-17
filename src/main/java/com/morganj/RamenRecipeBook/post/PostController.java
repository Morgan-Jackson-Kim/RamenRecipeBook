package com.morganj.RamenRecipeBook.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.morganj.RamenRecipeBook.post.bo.PostBO;
import com.morganj.RamenRecipeBook.post.model.PostOnlyGallery;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/newpost")
	public String newPost(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		return "post/newpost";
	}
	
	@GetMapping("/main")
	public String mainpage(
			HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		List<PostOnlyGallery> postList = postBO.getPostList();
		
		
		model.addAttribute("postList", postList);
		
		return "post/page";
	}
	
	@GetMapping("/mypage_view")
	public String mainpageView() {
		return "post/mypage";
	}

}
