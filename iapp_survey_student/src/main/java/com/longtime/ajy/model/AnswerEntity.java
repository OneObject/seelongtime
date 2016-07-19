/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午1:40:02
 */
package com.longtime.ajy.model;

import com.longtime.common.model.Entity;

/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
public class AnswerEntity  implements Entity<String> {
    
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
    
	private String question_id; //问题的id
	
	private String content; //回答内容
	
	private String contentNoHtml;//纯文本信息
	
	private String author_id; //回答者
	
	private String author_name; //回答者姓名
	
	private Integer agree_num=0; //同意人数
	
	private int disagree_num=0; //反对人数
	
	private Integer comment_num=0; //评论人数
	
	private int is_best_answer=0; //是否是最佳答案
	
	private int anonymous=0; //是否匿名
	
	@Deprecated
	private String view; //评论态度
	
	private Long dateCreated;

	private String userCreated;

	private Long dateLastModified;

	private String userLastModified;
	
	private String domain;
	
	private int isexpert; //是否指导人
	
	private int isinvite;
	
	private long invitetime=0L;
	
	private int contenttype;


	private Integer status = STATUS_NONE;	//答案被推荐字段

	private static final int STATUS_NONE = 0;
	private static final int STATUS_RECOMMEND = 1;


	
	public static final int BEST_ANSWER=0;
	
	public static final int NOT_BEST_ANSWER=1;
  
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public int getIs_best_answer() {
		return is_best_answer;
	}
	
	public void setIs_best_answer(int is_best_answer) {
		this.is_best_answer = is_best_answer;
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

	public Integer getAgree_num() {
		return agree_num;
	}
	

	public int getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(int anonymous) {
		this.anonymous = anonymous;
	}

	public void setAgree_num(Integer agree_num) {
		this.agree_num = agree_num;
	}

	public int getDisagree_num() {
		return disagree_num;
	}

	public void setDisagree_num(int disagree_num) {
		this.disagree_num = disagree_num;
	}

	public Integer getComment_num() {
		return comment_num;
	}

	public void setComment_num(Integer comment_num) {
		this.comment_num = comment_num;
	}

	

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public Long getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Long dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getUserCreated() {
		return userCreated;
	}

	public void setUserCreated(String userCreated) {
		this.userCreated = userCreated;
	}

	public Long getDateLastModified() {
		return dateLastModified;
	}

	public void setDateLastModified(Long dateLastModified) {
		this.dateLastModified = dateLastModified;
	}

	public String getUserLastModified() {
		return userLastModified;
	}

	public void setUserLastModified(String userLastModified) {
		this.userLastModified = userLastModified;
	}

	public int getIsexpert() {
		return isexpert;
	}

	public void setIsexpert(int isexpert) {
		this.isexpert = isexpert;
	}

	public int getIsinvite() {
		return isinvite;
	}

	public void setIsinvite(int isinvite) {
		this.isinvite = isinvite;
	}

	public long getInvitetime() {
		return invitetime;
	}

	public void setInvitetime(long invitetime) {
		this.invitetime = invitetime;
	}

	public int getContenttype() {
		return contenttype;
	}

	public void setContenttype(int contenttype) {
		this.contenttype = contenttype;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
