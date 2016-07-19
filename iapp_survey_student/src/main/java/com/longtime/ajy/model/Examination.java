package com.longtime.ajy.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import com.longtime.common.utils.ExtMapUtils;

public class Examination implements MapSerializable{

	private static final long serialVersionUID = -8634238887546119837L;
	
	private String id;
	private String examNo;     //考试编号
	private String examName;   //考试名称
	private String keyword;    //关键字
	private Long examDate;   //考试时长
	private Integer examTimes;     //考试次数 0-10 0表示不限次数
	private Long startTime;    //考试开始时间
	private Long endTime;      //考试结束
	private String manager;    //考试负责人
	private String paperId;    //试卷Id
	private Integer paperNum;     //生成试卷的份数 1-20
	
	private String status="0";   //状态：0，未发布；1，已发布；2，考试中；3，已考试未阅卷；4，已考试已阅卷
	private Boolean isShowScore = false; //是否答卷后即显示得分 false 不显示，true 显示
	private Boolean isContainAsk = false; //是否包含问答题
	private boolean isShowAnswer = false; 
	private boolean isAgain = false; 
	private String domain;//域 all ,longtimeit,ksf
	
	private String lastdir; //试卷的最后一个目录，如果为空，则其最后一个目录为考试ID
	
	private String cover;//封面
	private String content;//简介
	
	private String authorize;
	
	
	private EntityMetaInfo entityMetaInfo;
	/** 未发布 */
	public static String UNPUBLISHED_EXAMINATION="0";	
	/** 发布中 */
	public static String RELEASE_EXANINATION_ZHONG="1";	
	/** 已发布 */
	public static String RELEASE_EXANINATION="2";
	/** 发布失败 */
	public static String RELEASE_FAIL="-1";		
	
	/** 考试中 */
	public static String EXAMING_EXAMINATION="3";	
	/** 考试已结束 */
	public static String EXAMED_END="4"; 
	
	public static Map<String, String> examinationStatusMap = new HashMap<String, String>();
	static{
		examinationStatusMap.put("未发布", Examination.UNPUBLISHED_EXAMINATION);
		examinationStatusMap.put("发布中", Examination.RELEASE_EXANINATION_ZHONG);
		examinationStatusMap.put("发布失败", Examination.RELEASE_FAIL);
		examinationStatusMap.put("已发布", Examination.RELEASE_EXANINATION);
		examinationStatusMap.put("考试中", Examination.EXAMING_EXAMINATION);
		examinationStatusMap.put("已结束", Examination.EXAMED_END);
	}
	
	private String mark;       //考试备注
	
	
	public String getLastdir() {
		return lastdir;
	}

	public void setLastdir(String lastdir) {
		this.lastdir = lastdir;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getExamNo() {
		return examNo;
	}

	public void setExamNo(String examNo) {
		this.examNo = examNo;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Long getExamDate() {
		return examDate;
	}

	public void setExamDate(Long examDate) {
		this.examDate = examDate;
	}

	public Integer getExamTimes() {
		return examTimes;
	}

	public void setExamTimes(Integer examTimes) {
		this.examTimes = examTimes;
	}

	public Long getStartTime() {
		return startTime;
	}

	public void setStartTime(Long startTime) {
		this.startTime = startTime;
	}

	public Long getEndTime() {
		return endTime;
	}

	public void setEndTime(Long endTime) {
		this.endTime = endTime;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getPaperId() {
		return paperId;
	}

	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}

	public Integer getPaperNum() {
		return paperNum;
	}

	public void setPaperNum(Integer paperNum) {
		this.paperNum = paperNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Boolean getIsShowScore() {
		return isShowScore;
	}

	public void setIsShowScore(Boolean isShowScore) {
		this.isShowScore = isShowScore;
	}

	public Boolean getIsContainAsk() {
		return isContainAsk;
	}

	public void setIsContainAsk(Boolean isContainAsk) {
		this.isContainAsk = isContainAsk;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}
	
    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    
    public String getContent() {
        return content;
    }

    
    public void setContent(String content) {
        this.content = content;
    }
    
    
    public String getAuthorize() {
		return authorize;
	}

	public void setAuthorize(String authorize) {
		this.authorize = authorize;
	}
	
	public String getFormatCreateDate(){
		if(this.entityMetaInfo.getDateCreated()==null || this.entityMetaInfo.getDateCreated() == 0L){
			return "";
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(this.entityMetaInfo.getDateCreated());
	}
	
	
	public boolean getIsShowAnswer() {
		return isShowAnswer;
	}

	public void setIsShowAnswer(boolean isShowAnswer) {
		this.isShowAnswer = isShowAnswer;
	}

	public boolean getIsAgain() {
		return isAgain;
	}

	public void setIsAgain(boolean isAgain) {
		this.isAgain = isAgain;
	}

	public EntityMetaInfo getEntityMetaInfo() {
		return entityMetaInfo;
	}

	public void setEntityMetaInfo(EntityMetaInfo entityMetaInfo) {
		this.entityMetaInfo = entityMetaInfo;
	}

	public String getFormatUpdateDate(){
		if(this.entityMetaInfo.getDateLastModified()==null || this.entityMetaInfo.getDateLastModified() == 0L){
			return "";
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(new Date(this.entityMetaInfo.getDateLastModified()));
	}
	@Override
	public Map<String, Object> toMap() {
		LinkedHashMap<String, Object> m = new LinkedHashMap<String, Object>();
		ExtMapUtils.addIfNotNull(m, "_id", this.id);
		ExtMapUtils.addIfNotNull(m, "examName", this.examName);
		ExtMapUtils.addIfNotNull(m, "examNo", this.examNo);
		ExtMapUtils.addIfNotNull(m, "keyword", this.keyword);
		ExtMapUtils.addIfNotNull(m, "examDate", this.examDate);
		ExtMapUtils.addIfNotNull(m, "examTimes", this.examTimes);
		ExtMapUtils.addIfNotNull(m, "endTime", this.endTime);
		ExtMapUtils.addIfNotNull(m, "manager", this.manager);
		ExtMapUtils.addIfNotNull(m, "paperId", this.paperId);
		ExtMapUtils.addIfNotNull(m, "paperNum", this.paperNum);
		ExtMapUtils.addIfNotNull(m, "status", this.status);
		ExtMapUtils.addIfNotNull(m, "isShowScore", this.isShowScore);
		ExtMapUtils.addIfNotNull(m, "authorize", this.authorize);
		ExtMapUtils.addIfNotNull(m, "isContainAsk", this.isContainAsk);
		ExtMapUtils.addIfNotNull(m, "isShowAnswer", this.isShowAnswer);
		ExtMapUtils.addIfNotNull(m, "isAgain", this.isAgain);
		ExtMapUtils.addIfNotNull(m, "domain", this.domain);
		ExtMapUtils.addIfNotNull(m, "mark", this.mark);
		ExtMapUtils.addIfNotNull(m, "cover", this.cover);
		ExtMapUtils.addIfNotNull(m, "content", this.content);
		ExtMapUtils.addIfNotNull(m, "lastdir", this.lastdir);
		ExtMapUtils.addIfNotNull(m, "entityMetaInfo", this.entityMetaInfo);
		return m;
	}

	@Override
	public void fromMap(Map<String, Object> in) {
		if (in == null) {
			return;
		}
		
		this.id = (String) in.get("_id");
		this.examName = (String) in.get("examName");
		this.examNo = (String) in.get("examNo");
		this.keyword = (String) in.get("keyword");
		this.examDate = (Long) in.get("examDate");
		this.examTimes = (Integer) in.get("examTimes");
		this.startTime = (Long) in.get("startTime");
		this.endTime = (Long) in.get("endTime");
		this.manager = (String) in.get("manager");
		this.paperId = (String) in.get("paperId");
		this.paperNum = (Integer) in.get("paperNum");
		this.status = (String) in.get("status");
		this.authorize = (String) in.get("authorize");
		this.isShowScore = (Boolean) in.get("isShowScore");
		this.isContainAsk = (Boolean) in.get("isContainAsk");
		if (in.get("isShowAnswer")!=null) {
			this.isShowAnswer = (Boolean) in.get("isShowAnswer");
		}
		if (in.get("isAgain")!=null) {
			this.isAgain = (Boolean) in.get("isAgain");
		}
		this.domain = (String) in.get("domain");
		this.mark = (String) in.get("mark");
		this.cover = (String) in.get("cover");
		this.content = (String) in.get("content");
		this.lastdir = (String) in.get("lastdir");
		
		
		Map<String, Object> map =  (Map<String, Object>) in.get("entityMetaInfo");
		if(map != null){
			Long dateCreated = (Long) map.get("dateCreated");
			Long dateLastModified = (Long) map.get("dateLastModified");
			String userCreated = (String) map.get("userCreated");
			String userLastModified = (String) map.get("userLastModified");
			EntityMetaInfo entity = new EntityMetaInfo();
			entity.setDateCreated(dateCreated);
			entity.setDateLastModified(dateLastModified);
			entity.setUserCreated(userCreated);
			entity.setUserLastModified(userLastModified);
			this.entityMetaInfo = entity;
		}
	}

	@Override
	public String toString() {
		return String.format("Examination [id=%s, examNo=%s, examName=%s, keyword=%s, examDate=%s, examTimes=%s, startTime=%s, endTime=%s, manager=%s, paperId=%s, paperNum=%s, status=%s, isShowScore=%s, isContainAsk=%s, domain=%s, lastdir=%s, cover=%s, content=%s, authorize=%s, entityMetaInfo=%s, mark=%s]",
			id,
			examNo,
			examName,
			keyword,
			examDate,
			examTimes,
			startTime,
			endTime,
			manager,
			paperId,
			paperNum,
			status,
			isShowScore,
			isContainAsk,
			domain,
			lastdir,
			cover,
			content,
			authorize,
			entityMetaInfo,
			mark);
	}
	
}
