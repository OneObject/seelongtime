package com.longtime.app.ixin.mgr.vote.model;

import org.apache.commons.lang3.StringUtils;

import com.longtime.app.ixin.mgr.vote.vo.OptionVO;
import com.longtime.app.util.IdGenerator;

@Deprecated
public class OptionEntity {
	private String oid;//选项ID
	private String questionId;//问题Id
	private String ocontent;//选项内容
	private String ocoverPath;//选项图片
	private String ofileId;//图片ID
	private int voteNum = 0;//投票数量
	private int shortNum;//排序号
	
	public int getShortNum() {
		return shortNum;
	}
	public void setShortNum(int shortNum) {
		this.shortNum = shortNum;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public String getOcontent() {
		return ocontent;
	}
	public void setOcontent(String ocontent) {
		this.ocontent = ocontent;
	}
	public String getOcoverPath() {
		return ocoverPath;
	}
	public void setOcoverPath(String ocoverPath) {
		this.ocoverPath = ocoverPath;
	}
	public String getOfileId() {
		return ofileId;
	}
	public void setOfileId(String ofileId) {
		this.ofileId = ofileId;
	}
	public int getVoteNum() {
		return voteNum;
	}
	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}
	public static OptionEntity getOptionEntityByOptionVO(OptionVO oVO,
			String qId) {
		OptionEntity entity = new OptionEntity();
		entity.setOcontent(oVO.getOcontent());
		entity.setOcoverPath(oVO.getOcoverPath());
		entity.setOfileId(oVO.getOfileId());
		entity.setOid(StringUtils.isBlank(oVO.getOid())?(String)IdGenerator.nextId32():oVO.getOid());
		entity.setQuestionId(qId);
		return entity;
	}
	public static OptionVO castToOptionVO(OptionEntity entity) {
		OptionVO vo = new OptionVO();
		vo.setOcontent(entity.getOcontent());
		vo.setOcoverPath(entity.getOcoverPath());
		vo.setOfileId(entity.getOfileId());
		vo.setOid(entity.getOid());
		vo.setShortNum(entity.getShortNum());
		vo.setVoteNum(entity.getVoteNum());
		return vo;
	}
	
}
