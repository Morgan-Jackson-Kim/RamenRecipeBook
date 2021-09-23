package com.morganj.RamenRecipeBook.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.morganj.RamenRecipeBook.user.bo.UserBO;



@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String,String> signUp(
			@RequestParam("loginId")String loginId
			,@RequestParam("password") String password
			,@RequestParam("name") String name
			,@RequestParam("email") String email
			,@RequestParam("phone") String phone
			){
		Map<String, String> result = new HashMap<>();
		
		int count = userBO.signUp(loginId, password, name, email, phone);
		
		if(count==1) {
			result.put("result","회원가입 성공!");
		}else {
			result.put("result", "회원가입 실패.");
		}
		
		return result;
		
	}

}
