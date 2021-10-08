package com.morganj.RamenRecipeBook.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.morganj.RamenRecipeBook.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("content") String content
			, @RequestParam(value = "file") MultipartFile file
			, @RequestParam("ingredient") String ingredient
			, @RequestParam("usedRamen") String usedRamen
			, @RequestParam(value = "tag" ) List<String> tag
			, HttpServletRequest request
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		
		int count = postBO.addPost(userId, userName, content, ingredient, usedRamen, , file);
		
		Map<String, String> result = new HashMap<>();
		
	}

}
