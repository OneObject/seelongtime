package com.longtime.app.base.controller.vo;

import com.longtime.app.oplog.model.OpLog;

import com.longtime.app.oplog.model.OpLog;

public class OrganizationVo {
	
	private String id;
	
	private String pId;
	
	private String name;
	
	private String title;
	
	private boolean open=false;
	
	private boolean checked=false;
	private boolean click=false;
	
	private boolean defaultchecked=false;
	
	
	private int synchronousstatus=0;
	    
	 
	private int synctype = OpLog.ACTION_ADD;
	
	private boolean isShowSyncIcon = false;
	    
/**
 * 添加iconskin属性，保存简写css的类名*/
  	private String iconSkin;
	public void setIconSkin(String iconSkin) {
		this.iconSkin = iconSkin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public void setDefaultchecked(boolean defaultchecked) {
		this.defaultchecked = defaultchecked;
	}
	public boolean isDefaultchecked() {
		return defaultchecked;
	}
	public void setClick(boolean click) {
		this.click = click;
	}
	public boolean isClick() {
		return click;
	}
	public int getSynchronousstatus() {
		return synchronousstatus;
	}
	public void setSynchronousstatus(int synchronousstatus) {
		this.synchronousstatus = synchronousstatus;
	}
	public int getSynctype() {
		return synctype;
	}
	public void setSynctype(int synctype) {
		this.synctype = synctype;
	}
	
	public boolean isShowSyncIcon() {
		return isShowSyncIcon;
	}
	public void setShowSyncIcon(boolean isShowSyncIcon) {
		this.isShowSyncIcon = isShowSyncIcon;
	}
	/**
	 * 实现文字标识同步状态的判断
		public String getSyncStatus() {
			if(this.synchronousstatus == OpLog.SYNC_YES){
				return "已同步";
			}
			if(this.synchronousstatus == OpLog.SYNC_FAIL){
				return "同步失败";
			}
			if(this.synchronousstatus == OpLog.SYNC_NO){
			if(this.synctype == OpLog.ACTION_ADD){
				return "新增未同步";
			} else if(this.synctype == OpLog.ACTION_UPDATE){
				return "更新未同步";
			} else if(this.synctype == OpLog.ACTION_DEL){
				return "删除未同步";
			} 
			}
			return "";
		}*/
	/**
	 * 通过判断给不同的图片css的id（简写id）
	 */
	  	public String getIconSkin() {
	  		if(!isShowSyncIcon){
	  			return null;
	  		}
			if(this.synchronousstatus == OpLog.SYNC_YES){
				return "icon_01";
			}
			if(this.synchronousstatus == OpLog.SYNC_FAIL){
				return "icon_02";
			}
			if(this.synchronousstatus == OpLog.SYNC_NO){
			if(this.synctype == OpLog.ACTION_ADD){
				return "icon_03";
			} else if(this.synctype == OpLog.ACTION_UPDATE){
				return "icon_04";
			} else if(this.synctype == OpLog.ACTION_DEL){
				return "icon_05";
			} 
			}
			return "";
		
		}
	
}
