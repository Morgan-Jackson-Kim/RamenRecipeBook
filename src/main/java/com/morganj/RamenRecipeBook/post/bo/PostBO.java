package com.morganj.RamenRecipeBook.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.morganj.RamenRecipeBook.common.FileManagerService;
import com.morganj.RamenRecipeBook.post.dao.PostDAO;


@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int addPost(int userId, String userName, String content, String ingredient, String usedRamen, String tag ,  MultipartFile file) {
		FileManagerService fileManager = new FileManagerService();
		
		String filePath = fileManager.saveFile(userId, file);
		
		if(filePath == null) {
			return -1;
		}	
		
		return postDAO.newPost(userId, userName, content, ingredient, usedRamen, tag, filePath);
		
	}
}
                