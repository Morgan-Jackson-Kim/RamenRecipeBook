package com.morganj.RamenRecipeBook.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.morganj.RamenRecipeBook.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertNewUser(
			@Param("loginId")String loginId 
			,@Param("password")String password
			,@Param("name")String name
			,@Param("email") String email
			,@Param("phone") String phone);
	
	public int selectCountById(@Param("loginId") String loginId);
	
	public User selectUserByIdPassword(
			@Param("loginId") String loginID
			, @Param("password") String password);
}
