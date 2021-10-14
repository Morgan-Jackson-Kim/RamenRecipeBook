package com.morganj.RamenRecipeBook.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {
	
	public int newPost(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("content") String content
			, @Param("ingredient") String ingredient
			, @Param("usedRamen") String usedRamen
			, @Param("tag")	String tag
			, @Param("imagePath") String imagePath
			);
	

}
