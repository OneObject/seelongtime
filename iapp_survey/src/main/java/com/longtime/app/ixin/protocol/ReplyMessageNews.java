package com.longtime.app.ixin.protocol;

import java.util.List;

/**
 * message result news
 * 
 * @author hujiawei
 * 
 */
public class ReplyMessageNews extends ReplyMessage {

	protected int count;
	protected List<ItemArticle> articleItems;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<ItemArticle> getArticleItems() {
		return articleItems;
	}

	public void setArticleItems(List<ItemArticle> articleItems) {
		this.articleItems = articleItems;
	}

}
