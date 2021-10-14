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
			, @RequestParam("ingredient") String ingredient
			, @RequestParam("usedRamen") String usedRamen
			, @RequestParam("tag" ) String tag
			, @RequestParam(value = "file") MultipartFile file
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		
		int count = postBO.addPost(userId, userName, content, ingredient, usedRamen, tag, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "작성 성공");
		} else {
			result.put("result", "작성 실패");
		}
		
		return result;
		
	}

}
