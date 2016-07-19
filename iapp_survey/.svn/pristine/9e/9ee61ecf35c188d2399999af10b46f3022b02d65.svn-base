package com.longtime.app.ixin.mgr.model;

public class DocumentEntity  
{
	/**
	 * @author Tai
	 * 文档实体 
	 */
	private String id;//主键
	
	private String name; //文档名
	private String originalname; //原名字
	private int status;//状态   1上传完成  2转换中 3转换完成 4转换失败
	private String failmsg;//转换失败原因
	private int failnum;//转换失败的次数   失败3次就放弃再次转换
	private String path;//路径
	private int pagenum;//文档转换成的图片数
	private String domain;
	private long createtime;
	private String creator;
	private long updatetime;
	private String updater;
	private int isdel;
	private long size;//文档大小
	private long starttime; //iapp端暂时没用
	
	
	public static int STATUS_UPLOAD = 1;  //未转换
	
	public static int STATUS_CONVERTING = 2; //转换中
	
	public static int STATUS_CONVERT_SUCCESS = 3; //转换完成
	
	public static int STATUS_CONVERT_FAIL = 4;  //转换失败
	
	
	public long getStarttime()
	{
		return starttime;
	}
	public void setStarttime(long starttime)
	{
		this.starttime = starttime;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getStatus()
	{
		return status;
	}
	public void setStatus(int status)
	{
		this.status = status;
	}
	public String getOriginalname()
	{
		return originalname;
	}
	public void setOriginalname(String originalname)
	{
		this.originalname = originalname;
	}
	
	public String getFailmsg()
	{
		return failmsg;
	}
	public void setFailmsg(String failmsg)
	{
		this.failmsg = failmsg;
	}
	
	public int getFailnum()
	{
		return failnum;
	}
	public void setFailnum(int failnum)
	{
		this.failnum = failnum;
	}
	public String getPath()
	{
		return path;
	}
	public String getDomain()
	{
		return domain;
	}
	public void setDomain(String domain)
	{
		this.domain = domain;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public int getPagenum()
	{
		return pagenum;
	}
	public void setPagenum(int pagenum)
	{
		this.pagenum = pagenum;
	}
	public long getCreatetime()
	{
		return createtime;
	}
	public void setCreatetime(long createtime)
	{
		this.createtime = createtime;
	}
	public String getCreator()
	{
		return creator;
	}
	public void setCreator(String creator)
	{
		this.creator = creator;
	}
	public long getUpdatetime()
	{
		return updatetime;
	}
	public void setUpdatetime(long updatetime)
	{
		this.updatetime = updatetime;
	}
	public String getUpdater()
	{
		return updater;
	}
	public void setUpdater(String updater)
	{
		this.updater = updater;
	}
	public int getIsdel()
	{
		return isdel;
	}
	public void setIsdel(int isdel)
	{
		this.isdel = isdel;
	}
	
	public long getSize()
	{
		return size;
	}
	public void setSize(long size)
	{
		this.size = size;
	}
	
	@Override
	public String toString()
	{
		return "DocumentEntity [id=" + id + ", name=" + name
				+ ", originalname=" + originalname + ", status=" + status
				+ ", failmsg=" + failmsg + ", failnum=" + failnum + ", path="
				+ path + ", pagenum=" + pagenum + ", domain=" + domain
				+ ", createtime=" + createtime + ", creator=" + creator
				+ ", updatetime=" + updatetime + ", updater=" + updater
				+ ", isdel=" + isdel + "]";
	}
	
}
