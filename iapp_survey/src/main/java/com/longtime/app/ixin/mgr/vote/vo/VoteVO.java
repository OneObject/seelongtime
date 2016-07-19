package com.longtime.app.ixin.mgr.vote.vo;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;
import com.longtime.app.ixin.mgr.vote.model.VoteEntity;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.platform.credit.utils.DateUtil;

/**
 * 传递投票信息的ValueObject
 */
public class VoteVO implements Serializable{
	private static final long serialVersionUID = 4478311256255066163L;
	
	private static Logger logger = LoggerFactory.getLogger(VoteVO.class);
	
	
	private String id; //投票的ID
	private String title;//主题
	private String coverPath;//投票封面
	private String fileId;//封面的Id
	private String startTimeStr;//开始时间
	private String endTimeStr;//结束时间
	private long startTime;//开始时间
	private long endTime;//结束时间
	private String author;//发起人
	private String summary;//简介
	private String keywords;//关键字
	private int surveyOrvote;
	private List<VoteQuestionVO> questions;//投票的问题
	private int voteNum;//投票总数
	private long weight;
	private String resultconfig;//结果显示设置 json格式，statistics记录是否显示统计、personoption记录是否显示个人选择，1都为显示、0都为不显示
	private int isrelease = 0; //发布 0 已发布 1 未发布
	private int showinlist = 0;//是否展示在前端列表页  0展示 1 不展示
	private int showresult = 0;//提交之后是否展示结果 0显示 1 不显示
	private Setting  setting;
	private String domain;
	private String creatorName;
	private String creator;
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getCreatorName() {
		return creatorName;
	}
	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}
	
	public int getSurveyOrvote() {
		return surveyOrvote;
	}
	public void setSurveyOrvote(int surveyOrvote) {
		this.surveyOrvote = surveyOrvote;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCoverPath() {
		return coverPath;
	}
	
	public int getVoteNum() {
		return voteNum;
	}
	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}
	public int getShowresult()
	{
		return showresult;
	}
	public void setShowresult(int showresult)
	{
		this.showresult = showresult;
	}
	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}
	public String getFileId() {
		return fileId;
	}
	public int getIsrelease()
	{
		return isrelease;
	}
	public void setIsrelease(int isrelease)
	{
		this.isrelease = isrelease;
	}
	public int getShowinlist()
	{
		return showinlist;
	}
	public void setShowinlist(int showinlist)
	{
		this.showinlist = showinlist;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getStartTimeStr() {
		return startTimeStr;
	}
	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}
	public String getEndTimeStr() {
		return endTimeStr;
	}
	public void setEndTimeStr(String endTimeStr) {
		this.endTimeStr = endTimeStr;
	}
	public long getStartTime() {
		return startTime;
	}
	public void setStartTime(long startTime) {
		this.startTime = startTime;
	}
	public long getEndTime() {
		return endTime;
	}
	public void setEndTime(long endTime) {
		this.endTime = endTime;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public List<VoteQuestionVO> getQuestions() {
		return questions;
	}
	public void setQuestions(List<VoteQuestionVO> questions) {
		this.questions = questions;
	}
	public long getWeight() {
		return weight;
	}
	public void setWeight(long weight) {
		this.weight = weight;
	}
	
	public String getResultconfig() {
		return resultconfig;
	}
	public void setResultconfig(String resultconfig) {
		this.resultconfig = resultconfig;
		this.setting = Setting.toSetting(resultconfig);
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public Setting getSetting() {
		return setting;
	}
	public void setSetting(Setting setting) {
		this.setting = setting;
		if(null!=setting){
			this.resultconfig = setting.toJson();
		}
	}
	//对外提供VoteVO转换为VoteEntity的方法
	
	public static String  DATE_FORMAT = "yyyy-MM-dd HH:mm";
	public static VoteEntity castToVoteEntity(VoteVO vo,
			HttpServletRequest request) {
		if(vo == null){
			throw new NullPointerException("the entity VoteVO is null.");
		}
		try{
			VoteEntity entity = new VoteEntity();
			entity.setId(StringUtils.isBlank(vo.getId())?(String)IdGenerator.nextId32():vo.getId());
			entity.setDomain(LoginSessionHelper.getCurrentDomain(request));
			entity.setAuthor(vo.getAuthor());
			entity.setCoverPath(vo.getCoverPath());
			entity.setFileId(vo.getFileId());
			entity.setSurveyOrvote(vo.getSurveyOrvote());
			entity.setStartTime(vo.getStartTime());
			entity.setEndTime(vo.getEndTime());
			entity.setKeywords(vo.getKeywords());
			entity.setSummary(vo.getSummary());
			entity.setTitle(vo.getTitle());
			entity.setResultconfig(vo.getResultconfig());
			entity.setShowinlist(vo.getShowinlist());
			entity.setShowresult(vo.getShowresult());
			entity.setCreatorName(vo.getCreatorName());
			entity.setCreator(vo.getCreator());
			return entity;
		}catch(Exception e){
			throw new IllegalArgumentException("the field of VoteVO startTimeStr or endTimeStr cannot parse yyyy-MM-dd");
		}	
	}
	@Override
	public String toString() {
		return String.format("VoteVO [id=%s, title=%s, coverPath=%s, fileId=%s, startTimeStr=%s, endTimeStr=%s, startTime=%s, endTime=%s, author=%s, summary=%s, keywords=%s, surveyOrvote=%s, questions=%s, voteNum=%s, weight=%s, resultconfig=%s, setting=%s, domain=%s,showinlist=%s,showresult=%s]",
			id,
			title,
			coverPath,
			fileId,
			startTimeStr,
			endTimeStr,
			startTime,
			endTime,
			author,
			summary,
			keywords,
			surveyOrvote,
			questions,
			voteNum,
			weight,
			resultconfig,
			setting,
			domain,
			showinlist,
			showresult);
	}
	
	
	public void formatTime(){
		if(getStartTime() != 0){
			this.startTimeStr = DateUtil.parseLongToString(getStartTime(), DATE_FORMAT);
		} else {
			startTimeStr = "";
		}
		if(getEndTime() != 0){
			this.endTimeStr = DateUtil.parseLongToString(getEndTime(), DATE_FORMAT);
		} else {
			endTimeStr = "";
		}
	}
	public static class Setting {
		
		int statistics;
		int personoption;
	
		
		public int getStatistics() {
			return statistics;
		}
		public void setStatistics(int statistics) {
			this.statistics = statistics;
		}
		public int getPersonoption() {
			return personoption;
		}
		public void setPersonoption(int personoption) {
			this.personoption = personoption;
		}
		public static Setting toSetting(String settingStr){
			if(StringUtils.isNotBlank(settingStr)){
				try{
				return  JSONObject.parseObject(settingStr, Setting.class);
				}catch(Exception e){
					logger.error(String.format("parse string to setting due to fail.string=[%s]",settingStr), e);
					return null;
				}
			}
			return null;
		}
		public String toJson(){
			return JSONObject.toJSONString(this);
		}
		@Override
		public String toString() {
			return String.format("Setting [statistics=%s, personoption=%s]", statistics, personoption);
		}
	}
	
}
