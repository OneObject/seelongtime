package com.longtime.app.ixin.mgr.model.matter;

import java.util.UUID;

import com.longtime.app.ixin.mgr.utils.Constants;

/**
 * 附件表ixin_fileinfo
 *
 */
public class FileInfo {

	private String id;
	private long size;
	private String mimeType;
	private String filePath;//文件相对地址
	private long uploadDate;//上传时间
	private int del = Constants.NO_DEL;//标记删除字段
	private String domain;
	
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getMimeType() {
		return mimeType;
	}
	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public long getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(long uploadDate) {
		this.uploadDate = uploadDate;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return String
				.format("FileInfo [id=%s, size=%s, mimeType=%s, filePath=%s, uploadDate=%s]",
						id, size, mimeType, filePath, uploadDate);
	}
	public static void main(String[] args) {
		System.out.println(UUID.randomUUID().toString().replaceAll("-", "").length());
	}
}
