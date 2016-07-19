/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午1:40:02
 */
package com.longtime.app.iask.model;

import java.util.Map;

import org.apache.commons.collections.map.ListOrderedMap;

import com.myctu.platform.repository.engine.domain.BaseEntity;

/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
public class AnswerEntity extends BaseEntity<String>{

	private static final long serialVersionUID = -9005847413816880094L;

	private String question_id; //问题的id
	
	private String content; //回答内容
	
	private String contentNoHtml;//纯文本信息
	
	private String author_id; //回答者
	
	private String author_name; //回答者姓名
	
	private int agree_num=0; //同意人数
	
	private int disagree_num=0; //反对人数
	
	private int comment_num; //评论人数
	
	private boolean is_best_answer=false; //是否是最佳答案
	
	private String view; //评论态度
	
	private Integer status = STATUS_NONE;	//答案被推荐字段
	
	public static final int STATUS_NONE = 0;
	public static final int STATUS_RECOMMEND = 1;
	
	@SuppressWarnings("unchecked")
  	public static Map<Integer, String> STATUS_MAP = new ListOrderedMap();
	
    static {
    	STATUS_MAP.put(STATUS_NONE, "默认");
    	STATUS_MAP.put(STATUS_RECOMMEND, "已推荐");
    }
	
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	

	public String getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContentNoHtml() {
		return contentNoHtml;
	}

	public void setContentNoHtml(String contentNoHtml) {
		this.contentNoHtml = contentNoHtml;
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

	public int getAgree_num() {
		return agree_num;
	}

	public void setAgree_num(int agree_num) {
		this.agree_num = agree_num;
	}

	public int getDisagree_num() {
		return disagree_num;
	}

	public void setDisagree_num(int disagree_num) {
		this.disagree_num = disagree_num;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public boolean isIs_best_answer() {
		return is_best_answer;
	}

	public void setIs_best_answer(boolean is_best_answer) {
		this.is_best_answer = is_best_answer;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}
	
}
