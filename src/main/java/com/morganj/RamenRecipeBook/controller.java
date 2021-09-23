package com.morganj.RamenRecipeBook;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test01")
public class controller {
	
	@GetMapping("/01")
	public String test01() {
		return "test01";
	}
}
