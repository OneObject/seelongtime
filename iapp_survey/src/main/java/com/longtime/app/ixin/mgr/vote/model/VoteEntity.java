package com.longtime.app.ixin.mgr.vote.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;

import com.longtime.app.ixin.mgr.utils.Constants;
import com.longtime.app.ixin.mgr.vote.vo.VoteVO;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "ixin_vote")
public class VoteEntity extends BaseModel<String>{
	private static final long serialVersionUID = 3856824833120250282L;
	
	@Id
	@Column(length = 36)
	private String id; //投票的ID
	private String title;//主题
	private String summary;//简介
	private long weight=System.currentTimeMillis();//排序值
	private String rootpaths;//创建用户所属组织的路径，从根节点到其本身，多个id用英文逗号分开
	private String domain;//所属商户
	private String creator;
	private long createTime = System.currentTimeMillis();//创建时间
	private String creatorName;
	private String updater;
	private long updatetime;
	private String updaterName;
	private int del = Constants.NO_DEL;//默认是未删除
	
	//unuse
	private String coverPath;//投票封面
	private String fileId;//封面的Id
	private long startTime;//开始时间
	private long endTime;//结束时间
	private String author;//发起人
	private String keywords;//关键字
	private int voteNum = 0;//投票数量
	private int surveyOrvote=0;
	private String resultconfig;//结果显示设置 json格式，statistics记录是否显示统计、personoption记录是否显示个人选择，1都为显示、0都为不显示
	private int isrelease = 0; //发布 0 已发布 1 未发布
	private int showinlist = 0;//是否展示在前端列表页  0展示 1 不展示
	private int showresult = 0;//提交之后是否展示结果 0显示 1 不显示
	
	
	/**
	 * 调研
	 */
	public static int SURVEY = 1;
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
	public String getUpdaterName() {
		return updaterName;
	}
	public void setUpdaterName(String updaterName) {
		this.updaterName = updaterName;
	}
	/**
	 * 投票
	 */
	public static int VOTE = 0;
	
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	public Long getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Long updatetime) {
		this.updatetime = updatetime;
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
	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
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
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
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
	public int getVoteNum() {
		return voteNum;
	}
	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}
	public long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(long createTime) {
		this.createTime = createTime;
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
	}
	
	public int getShowresult()
	{
		return showresult;
	}
	public void setShowresult(int showresult)
	{
		this.showresult = showresult;
	}
	
	public String getRootpaths() {
		return rootpaths;
	}
	public void setRootpaths(String rootpaths) {
		this.rootpaths = rootpaths;
	}
	
	
	public static VoteEntity getVoteEntityByVoteVO(VoteVO vo,String domain){
		try{
			VoteEntity entity = new VoteEntity();
			entity.setAuthor(vo.getAuthor());
			entity.setCoverPath(vo.getCoverPath());
			entity.setEndTime(vo.getEndTime());
			entity.setFileId(vo.getFileId());
			entity.setId(StringUtils.isBlank(vo.getId())?(String)IdGenerator.nextId32():vo.getId());
			entity.setKeywords(vo.getKeywords());
			entity.setStartTime(vo.getStartTime());
			entity.setSummary(vo.getSummary());
			entity.setDomain(domain);
			entity.setTitle(vo.getTitle());
			return entity;
		}catch(Exception e){
			return null;
		}
	}
	
	public static VoteVO castToVoteVO(VoteEntity entity){
		VoteVO vo = new VoteVO();
		DateFormat df = new SimpleDateFormat(VoteVO.DATE_FORMAT);
		vo.setAuthor(entity.getAuthor());
		vo.setCoverPath(entity.getCoverPath());
		vo.setEndTime(entity.getEndTime());
		vo.setStartTime(entity.getStartTime());
		vo.setFileId(entity.getFileId());
		vo.setId(entity.getId());
		vo.setKeywords(entity.getKeywords());
		vo.setSummary(entity.getSummary());
		vo.setTitle(entity.getTitle());
		vo.setVoteNum(entity.getVoteNum());
		vo.setSurveyOrvote(entity.getSurveyOrvote());
		vo.setWeight(entity.getWeight());
		vo.setResultconfig(entity.getResultconfig());
		vo.setEndTime(entity.getEndTime());
		vo.setStartTime(entity.getStartTime());
		vo.setResultconfig(entity.getResultconfig());
		vo.setIsrelease(entity.getIsrelease());
		vo.setShowinlist(entity.getShowinlist());
		vo.setShowresult(entity.getShowresult());
		vo.setCreatorName(entity.getCreatorName());
		vo.setCreator(entity.getCreator());
		if(entity.getStartTime() > 0){
		    vo.setStartTimeStr(df.format(new Date(entity.getStartTime())));
		}
		if(entity.getEndTime() > 0){
		    vo.setEndTimeStr(df.format(new Date(entity.getEndTime())));
		}
		vo.setDomain(entity.getDomain());
		return vo;
	}
	@Override
	public String toString() {
		return String
				.format("VoteEntity [id=%s, title=%s, coverPath=%s, fileId=%s, startTime=%s, endTime=%s, author=%s, summary=%s, keywords=%s, del=%s, domain=%s, voteNum=%s]",
						id, title, coverPath, fileId, startTime, endTime,
						author, summary, keywords, del, domain, voteNum);
	}
	
}
