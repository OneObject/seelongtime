package com.longtime.app.ixin.service.handlers;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.longtime.app.base.model.User;
import com.longtime.app.base.service.UserService;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.ixin.protocol.Message;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageNews;
import com.longtime.app.ixin.protocol.ReplyMessageText;

@Service("specialHandler")
public class SpecialHandler {
	
	@Resource(name="fodderService")
	private FodderService fodderService;
	@Value("${com.longtime.ixin.COVER_SUFFIX}")
	private String suffix;
	@Value("${com.longtime.ixin.IMAGE_BASE_PATH}")
	private String qiniuImageBasePath;
	
	@Value("${com.longtime.ixin.matterdetail_basepath}")
	private String fodderBasePath;
	
	@Resource(name = "userService")
	private UserService userService;
	
	
	/**
	 * 处理关注事件
	 * @param msg
	 * @return
	 */
	public ReplyMessage processSubscribe(Message msg){
		if(msg.isWxQY()){
			String username = msg.getFromUserName();
			String domain = msg.getDomain();
			
			User user = this.userService.findByUsername(username,domain);
			if(null!=user){
				user.setAttentionstatus(2);
				this.userService.update(user);
			}
		}
		
		FodderVO vo = fodderService.getFodderVOResp(msg.getDomain());
		if(vo == null){
			
			ReplyMessageText replyText = new ReplyMessageText();
			replyText.setContent("欢迎关注我们官方微信公众号");
			replyText.setMsgType(ReplyMessage.REPLY_MESSAGE_TEXT);
			
			return replyText;
		}
		if(vo.getExtType().equals("fodder")){
			ReplyMessageNews replyMsg = new ReplyMessageNews();
			replyMsg.setCreateTime(System.currentTimeMillis());
			replyMsg.setMsgId(System.currentTimeMillis());
			replyMsg.setMsgType(ReplyMessage.REPLY_MESSAGE_NEWS);
			List<ItemArticle> articleItems = new ArrayList<ItemArticle>();
			ItemArticle item = new ItemArticle();
			item.setDescription(StringUtils.isEmpty(vo.getSummary())?vo.getContent():vo.getSummary());
			item.setId(vo.getId());
			item.setPicUrl(String.format("%s%s%s", qiniuImageBasePath,vo.getCoverPath(),suffix));
			item.setUrl(String.format("%s%s%s", fodderBasePath,"id=",vo.getId()));
			item.setTitle(vo.getTitle());
			articleItems.add(item);
			replyMsg.setCount(articleItems.size());
			replyMsg.setArticleItems(articleItems);
			return replyMsg;
		}else if(vo.getExtType().equals("text")){
			ReplyMessageText replyText = new ReplyMessageText();
			replyText.setContent(vo.getContent());
			replyText.setMsgType(ReplyMessage.REPLY_MESSAGE_TEXT);
			
			return replyText;
		}
		return null;
	}
	
	/**
	 * 处理取消关注事件
	 * @param msg
	 * @return
	 */
	public ReplyMessage processUnsubscribe(Message msg){
		if(msg.isWxQY()){
			String username = msg.getFromUserName();
			String domain = msg.getDomain();
			
			User user = this.userService.findByUsername(username,domain);
			user.setAttentionstatus(3);
			this.userService.update(user);
		}
		return null;
	}
	
}
