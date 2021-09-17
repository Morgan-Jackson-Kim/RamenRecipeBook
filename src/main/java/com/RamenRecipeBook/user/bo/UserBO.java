package com.RamenRecipeBook.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.RamenRecipeBook.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int signUp(String loginId, String password, String name, String email, String phone) {
		return userDAO.insertNewUser(loginId, password, name, email, phone);
	}
}
