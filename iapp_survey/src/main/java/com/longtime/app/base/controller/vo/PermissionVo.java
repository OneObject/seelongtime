package com.longtime.app.base.controller.vo;

public class PermissionVo {
	
	private String id;
	
	private String pId;
	
	private String name;
	
	private String title;
	
	private boolean open=false;
	
	private boolean checked=false;
	private boolean click=false;
	
	private boolean defaultchecked=false;
	
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
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
}
