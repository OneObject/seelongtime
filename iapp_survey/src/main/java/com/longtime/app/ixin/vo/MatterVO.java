package com.longtime.app.ixin.vo;

import java.util.List;

import com.longtime.app.ixin.mgr.model.matter.BaseMatter;
import com.longtime.app.ixin.mgr.model.matter.MatterInfo;

public class MatterVO extends BaseMatter{

	private boolean isdraft;//是否是草稿消息
	private String columnId;
	private String sourceBaseId;
	private List<MatterInfoVO> matterInfos;
	
	public int getCoverShow(){
		if(matterInfos!=null && matterInfos.size()>0){
			return matterInfos.get(0).getCoverShowInText();
		}
		return 0;
	}
	
	public String getTitle(){
		if(matterInfos!=null && matterInfos.size()>0){
			return matterInfos.get(0).getTitle();
		}
		return "";
	}
	public String getAuthor(){
		if(matterInfos!=null && matterInfos.size()>0){
			return matterInfos.get(0).getAuthor();
		}
		return "";
	}
	
	public String getCoverPath(){
		if(matterInfos!=null && matterInfos.size()>0){
			return matterInfos.get(0).getCoverPath();
		}
		return "";
	}

	public String getColumnId() {
		return columnId;
	}

	public void setColumnId(String columnId) {
		this.columnId = columnId;
	}

	public String getDesc(){
		if(matterInfos!=null && matterInfos.size()>0){
			return matterInfos.get(0).getDesc();
		}
		return "";
	}
	
	public String getContent(){
		if(matterInfos!=null && matterInfos.size()>0){
			return matterInfos.get(0).getContent();
		}
		return "";
	}
	
	public String getSourceBaseId() {
		return sourceBaseId;
	}
	public void setSourceBaseId(String sourceBaseId) {
		this.sourceBaseId = sourceBaseId;
	}
	public boolean isIsdraft() {
		return isdraft;
	}
	public void setIsdraft(boolean isdraft) {
		this.isdraft = isdraft;
	}
	public List<MatterInfoVO> getMatterInfos() {
		return matterInfos;
	}
	public void setMatterInfos(List<MatterInfoVO> matterInfos) {
		this.matterInfos = matterInfos;
	}
	public static class MatterInfoVO extends MatterInfo{
		private String coverPath;
		public String getCoverPath() {
			return coverPath;
		}
		public void setCoverPath(String coverPath) {
			this.coverPath = coverPath;
		}
	}
}
