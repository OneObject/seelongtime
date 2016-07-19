package com.longtime.app.ixin.mgr.vote.vo;

public class OptionVO {

	private String oid;//选项ID
	private String ocontent;//选项内容
	private String ocoverPath;//选项图片
	private String ofileId;//图片ID
	private int voteNum;
	private int shortNum;
	public int getVoteNum() {
		return voteNum;
	}
	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}
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
	
}
