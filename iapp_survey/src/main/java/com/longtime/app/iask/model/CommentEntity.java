/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午1:40:02
 */
package com.longtime.app.iask.model;

import com.myctu.platform.repository.engine.domain.BaseEntity;

/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
public class CommentEntity extends BaseEntity<String>{
	
	private static final long serialVersionUID = 8268130682162776102L;

	private String content; //评论内容
	
	private String author_id;//评论人id
	
	private String author_name;//评论人姓名、
	
	private String source_id;//评论内容的id
	
	private boolean is_comment_theme = true; //true 评论主题  false 回复评论
	
	private String source_author_id;//被评论资源的作者id
	
	private String source_author_name;//被评论资源的作者姓名

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor_id() {
		return author_id;
	}

	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}

	public String getAuthor_name() {
		return author_name;
	}

	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}

	public String getSource_id() {
		return source_id;
	}

	public void setSource_id(String source_id) {
		this.source_id = source_id;
	}

	public boolean isIs_comment_theme() {
		return is_comment_theme;
	}

	public void setIs_comment_theme(boolean is_comment_theme) {
		this.is_comment_theme = is_comment_theme;
	}

	public String getSource_author_id() {
		return source_author_id;
	}

	public void setSource_author_id(String source_author_id) {
		this.source_author_id = source_author_id;
	}

	public String getSource_author_name() {
		return source_author_name;
	}

	public void setSource_author_name(String source_author_name) {
		this.source_author_name = source_author_name;
	}
	
}
