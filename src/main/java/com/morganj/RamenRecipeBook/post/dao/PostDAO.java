package com.morganj.RamenRecipeBook.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {
	
	public int newPost(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("content") String content
			, @Param("ingredient") String ingredient
			, @Param("usedRamen")
			, @Param("tag")
			, @Param("imagePath") String imagePath
			);
	

}
