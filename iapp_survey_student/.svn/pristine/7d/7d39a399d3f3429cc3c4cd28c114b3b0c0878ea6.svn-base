/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 上午9:25:27
 */
package com.longtime.ajy.model;


import com.longtime.common.model.Entity;
/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
public class QuestionEntity implements Entity<String>{
	
	private static final long serialVersionUID = -235888430631438078L;

	private String id;

	private String title; //问题主题
	
	private String supplement;//问题详情
	
	private String supplementNoHtml; //纯文本内容
	
	private String author_id; //提问者
	
	private String author_name; //提问者姓名
	
	private int answer_num; //回答人数
	
	@Deprecated
	private int comment_num; //评论人数
	
	private int is_set_best_answer; //是否设置了最佳答案
	
	private Long dateCreated;

	private String userCreated;

	private Long dateLastModified;

	private String userLastModified;
	
	private String domain;//域
	
	private String activity_id;//关联话题id
	
	private String best_aid;
	
	private long best_timestamp=0; //设置最佳答案的时间
	
	private int credit=0;
	
	private int anonymous;
	
	private int week_pv=0;    //周访问量
	
	private Integer visitnum=0;  //总访问量

	private Integer status = STATUS_NONE;// 状态 0 默认  1：推荐 2：疑难  9： 隐藏

	private Integer praisenum =0;//赞数

	private Integer collectnum=0;//收藏数

	private String recommend_aid;//推荐的回答

	private Long recommend_timestamp=0L;//推荐时间
	
	private Long author_last_visit_time=System.currentTimeMillis(); //提问者最后访问时间
	
	private String last_answer_id;//最后一次回答的答案id, 评论不列入
	
	private Long last_answer_time =0L;//最后一次回答的时间，评论也更新，但不包括提问者的
	
	
	private String gid; //所属的组
	private String gtype;//组类型
	
	private String oid;
	
	private Integer taggroup = 0;	//0  谈天说地 ，1  专业交流



	public  static final int STATUS_NONE = 0;
	public static final int STATUS_CREAM = 1;
	public static final int STATUS_DIFFICULT = 2;
	public static final int STATUS_HIDE = 9;
	
	public String getBest_aid() {
		return best_aid;
	}

	public void setBest_aid(String best_aid) {
		this.best_aid = best_aid;
	}


	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public int getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(int anonymous) {
		this.anonymous = anonymous;
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

	public String getActivity_id() {
		return activity_id;
	}

	public void setActivity_id(String activity_id) {
		this.activity_id = activity_id;
	}

	public int getWeek_pv() {
		return week_pv;
	}

	public void setWeek_pv(int week_pv) {
		this.week_pv = week_pv;
	}

    
    public Long getAuthor_last_visit_time() {
        return author_last_visit_time;
    }

    
    public void setAuthor_last_visit_time(Long author_last_visit_time) {
        this.author_last_visit_time = author_last_visit_time;
    }

    
    public String getLast_answer_id() {
        return last_answer_id;
    }

    
    public void setLast_answer_id(String last_answer_id) {
        this.last_answer_id = last_answer_id;
    }

    
    public Long getLast_answer_time() {
        return last_answer_time;
    }

    
    public void setLast_answer_time(Long last_answer_time) {
        this.last_answer_time = last_answer_time;
    }

    
    public long getBest_timestamp() {
        return best_timestamp;
    }

    
    public void setBest_timestamp(long best_timestamp) {
        this.best_timestamp = best_timestamp;
    }

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getGtype() {
		return gtype;
	}

	public void setGtype(String gtype) {
		this.gtype = gtype;
	}

	public Integer getVisitnum() {
		return visitnum==null? 0:visitnum;
	}

	public void setVisitnum(Integer visitnum) {
		this.visitnum = visitnum;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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
