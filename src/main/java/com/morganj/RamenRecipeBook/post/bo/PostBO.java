package com.morganj.RamenRecipeBook.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.morganj.RamenRecipeBook.common.FileManagerService;
import com.morganj.RamenRecipeBook.post.dao.PostDAO;
import com.morganj.RamenRecipeBook.post.model.Post;
import com.morganj.RamenRecipeBook.post.model.PostOnlyGallery;


@Service
public class PostBO {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	private PostDAO postDAO;
	
	
	
	public int addPost(int userId, String userName, String recipeName, String content, String ingredient, String usedRamen, String tag ,  MultipartFile file) {
		FileManagerService fileManager = new FileManagerService();
		
		String filePath = fileManager.saveFile(userId, file);
		
		if(filePath == null) {
			return -1;
		}	
		return postDAO.newPost(userId, userName, recipeName, content, ingredient, usedRamen, tag, filePath);
		
	}
	
	public List<PostOnlyGallery> getPostList(){
		List<Post> postList = postDAO.selectPostImages();
		List<PostOnlyGallery> postOnlyGalleryList = new ArrayList<>();
		
		for(Post post:postList) {
			
			PostOnlyGallery postOnlyGallery = new PostOnlyGallery();
			postOnlyGallery.setPost(post);
			
			postOnlyGalleryList.add(postOnlyGallery);
		}
		
		return postOnlyGalleryList;
	}
}
                