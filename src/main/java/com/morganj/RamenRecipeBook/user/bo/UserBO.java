package com.morganj.RamenRecipeBook.user.bo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morganj.RamenRecipeBook.common.EncryptUtils;
import com.morganj.RamenRecipeBook.user.dao.UserDAO;
import com.morganj.RamenRecipeBook.user.model.User;


@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int signUp(String loginId, String password, String name, String email, String phone) {
		
		String encryptPassword = EncryptUtils.md5(password);	
		//암호화
		
		if(encryptPassword.equals("")) {
			logger.error("[UserBO signUP] 암호화 실패");
			return 0;
		}
		
		return userDAO.insertNewUser(loginId, password, name, email, phone);
	}
	
	public boolean isDuplicateId(String loginId) {
		if(userDAO.selectCountById(loginId) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public User signIn(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		//암호화
		
		return userDAO.selectUserByIdPassword(loginId, encryptPassword);
	}
}
