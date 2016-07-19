package com.longtime.app.ixin.service.handlers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageNews;

//非上下文类型业务处理程序
@Service("newsHandler")
public class NewsHandler extends AbstartMessageHandler{


	public ReplyMessage processText(MessageText messageText) {
		ReplyMessageNews reply = new ReplyMessageNews();
		List<ItemArticle> itemArticles = new ArrayList<ItemArticle>();
		ItemArticle itemArticle = new ItemArticle();
		itemArticle.setDescription("成本价出货的方法，华为决对不是在学小米，反而是小米的前辈。");
		itemArticle.setPicUrl("http://news.baidu.com/z/resource/r/image/2014-01-09/2b1e6a9fe06f3206a3db821888f0ef5e.jpg");
		itemArticle.setTitle("小米挣钱靠预装 低价出货华为是前辈");
		itemArticle.setUrl("http://jiyongqing.baijia.baidu.com/article/2485");
		itemArticles.add(itemArticle);
		
		itemArticle = new ItemArticle();
		itemArticle.setDescription("腾讯一厢情愿的落花有意，京东大概只能流水无情的表示矜持了。");
		itemArticle.setPicUrl("http://news.baidu.com/z/resource/r/image/2014-01-08/6c6460bcb863f60592f19dbb4d542496.jpg");
		itemArticle.setTitle("腾讯入股京东：来者有意受者无情");
		itemArticle.setUrl("http://lanxi.baijia.baidu.com/article/2429");
		itemArticles.add(itemArticle);
		
		reply.setCount(2);
		reply.setArticleItems(itemArticles);
		reply.setMsgType(ReplyMessage.REPLY_MESSAGE_NEWS);
		return reply;

	}

	public ReplyMessage processEvent(MessageEvent messageEvent) {
		ReplyMessageNews reply = new ReplyMessageNews();
		List<ItemArticle> itemArticles = new ArrayList<ItemArticle>();
		ItemArticle itemArticle = new ItemArticle();
		itemArticle.setDescription("成本价出货的方法，华为决对不是在学小米，反而是小米的前辈。");
		itemArticle.setPicUrl("http://news.baidu.com/z/resource/r/image/2014-01-09/2b1e6a9fe06f3206a3db821888f0ef5e.jpg");
		itemArticle.setTitle("小米挣钱靠预装 低价出货华为是前辈");
		itemArticle.setUrl("http://jiyongqing.baijia.baidu.com/article/2485");
		itemArticles.add(itemArticle);
		
		itemArticle = new ItemArticle();
		itemArticle.setDescription("腾讯一厢情愿的落花有意，京东大概只能流水无情的表示矜持了。");
		itemArticle.setPicUrl("http://news.baidu.com/z/resource/r/image/2014-01-08/6c6460bcb863f60592f19dbb4d542496.jpg");
		itemArticle.setTitle("腾讯入股京东：来者有意受者无情");
		itemArticle.setUrl("http://lanxi.baijia.baidu.com/article/2429");
		itemArticles.add(itemArticle);
		
		reply.setCount(2);
		reply.setArticleItems(itemArticles);
		return reply;
	}

	
}
