package com.morganj.RamenRecipeBook.post.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Post {
	private int id;
	private int userId;
	private String userName;
	private String content;
	private String ingredient;
	private String usedRamen;
	private	String tag;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
}
