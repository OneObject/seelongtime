package com.longtime.ajy.mweb.model;

public class Item {
	
	private String title ;
	private String remark;
	private String img;
	private int index =1;
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	@Override
	public String toString() {
		return String.format("Item [title=%s, remark=%s, img=%s, index=%s]", title, remark, img, index);
	} 
	

}
