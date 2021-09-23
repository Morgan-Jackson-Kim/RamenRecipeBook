package com.morganj.RamenRecipeBook.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	
	public int insertNewUser(
			@Param("loginId")String loginId 
			,@Param("password")String password
			,@Param("name")String name
			,@Param("email") String email
			,@Param("phone") String phone);
	

}
