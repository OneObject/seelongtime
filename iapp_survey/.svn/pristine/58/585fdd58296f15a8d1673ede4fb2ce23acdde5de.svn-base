/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 上午9:25:27
 */
package com.longtime.app.iask.model;

import java.util.Map;

import org.apache.commons.collections.map.ListOrderedMap;

import com.myctu.platform.repository.engine.domain.BaseEntity;

public class QuestionEntity extends BaseEntity<String>{
	
	private static final long serialVersionUID = -5796065186475919902L;

	private String id;

	private String title; //问题主题
	
	private String supplement;//问题详情
	
	private String supplementNoHtml; //纯文本内容
	
	private String author_id; //提问者
	
	private String author_name; //提问者姓名
	
	private int answer_num; //回答人数
	
	private int comment_num; //评论人数
	
	private int is_set_best_answer; //是否设置了最佳答案
	
	private Long dateCreated;

	private String userCreated;

	private Long dateLastModified;

	private String userLastModified;
	
	private String domain;//域
	
	private Integer week_pv=0;    //周访问量
	
	private Integer visitnum=0;  //总访问量
	
	private Integer praisenum=0;  //赞数
	
	private Integer collectnum=0;  //收藏数
	
	private Integer status = STATUS_NONE;
	
	private String recommend_aid;//推荐的回答

    private Long recommend_timestamp=0L;//推荐时间
    
    private String oid;
	
	private Integer taggroup = 0;	//0  谈天说地 ，1  专业交流
    
	
	
	private static final int STATUS_NONE = 0;
	private static final int STATUS_CREAM = 1;
	private static final int STATUS_DIFFICULT = 2;
	private static final int STATUS_HIDE = 9;
	
	@SuppressWarnings("unchecked")
  	public static Map<Integer, String> STATUS_MAP = new ListOrderedMap();
	
    static {
    	STATUS_MAP.put(STATUS_NONE, "默认");
    	STATUS_MAP.put(STATUS_CREAM, "精华");
    	STATUS_MAP.put(STATUS_DIFFICULT, "疑难");
    	STATUS_MAP.put(STATUS_HIDE, "隐藏");
    }
	
	
	public Integer getPraisenum() {
		return praisenum;
	}

	public void setPraisenum(Integer praisenum) {
		this.praisenum = praisenum;
	}

	public Integer getCollectnum() {
		return collectnum;
	}

	public void setCollectnum(Integer collectnum) {
		this.collectnum = collectnum;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getWeek_pv() {
		return week_pv;
	}

	public void setWeek_pv(Integer week_pv) {
		this.week_pv = week_pv;
	}

	public Integer getVisitnum() {
		return visitnum;
	}
	public void setVisitnum(Integer visitnum) {
		this.visitnum = visitnum;
	}

	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSupplement() {
		return supplement;
	}

	public void setSupplement(String supplement) {
		this.supplement = supplement;
	}

	public String getSupplementNoHtml() {
		return supplementNoHtml;
	}

	public void setSupplementNoHtml(String supplementNoHtml) {
		this.supplementNoHtml = supplementNoHtml;
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

	public int getAnswer_num() {
		return answer_num;
	}

	public void setAnswer_num(int answer_num) {
		this.answer_num = answer_num;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	
	public int getIs_set_best_answer() {
		return is_set_best_answer;
	}

	public void setIs_set_best_answer(int is_set_best_answer) {
		this.is_set_best_answer = is_set_best_answer;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

    
    public String getRecommend_aid() {
        return recommend_aid;
    }

    
    public void setRecommend_aid(String recommend_aid) {
        this.recommend_aid = recommend_aid;
    }

    
    public Long getRecommend_timestamp() {
        return recommend_timestamp;
    }

    
    public void setRecommend_timestamp(Long recommend_timestamp) {
        this.recommend_timestamp = recommend_timestamp;
    }

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public Integer getTaggroup() {
		return taggroup;
	}

	public void setTaggroup(Integer taggroup) {
		this.taggroup = taggroup;
	}
	
	
}
