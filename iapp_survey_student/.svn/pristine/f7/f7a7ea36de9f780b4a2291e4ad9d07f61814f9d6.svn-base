package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

/**
 * 活动关联内容
 * 
 * @project iapp
 * @date 2014年3月31日-下午4:38:06
 * @author longtime
 */
public class ActivityItem extends BaseEntity<Long>{

	private static final long serialVersionUID = -170116209804815358L;

	private String aid; //活动id

	private int restype;//资源类型

	private String resid;//资源id
	
	private String resname;//资源名称

	private String creator;

	private String updater;

	private Long createtime = System.currentTimeMillis();

	private Long updatetime = 0L;

	public static enum Restype {
		vote(1), //投票
		survey(2), //调查
		lottery(3), //抽奖
		rank(4),// 排行
		topic(5),//话题
		course(6),		//课程
		examination(7),//考试
		fodder(8),		//素材、资讯	
		channel(9),    //栏目
//		question(10), //问答
		unknown(-1);// 未知
		public int code;

		Restype(int code) {
			this.code = code;
		}

		public static Restype from(int code) {
			for (Restype item : Restype.values()) {
				if (item.code == code) {
					return item;
				}
			}
			return unknown;
		}
		public static Restype from(String name) {
			for (Restype item : Restype.values()) {
				if (item.name().equals(name)) {
					return item;
				}
			}
			return unknown;
		}

	}

	@Override
	public Long getId() {
		return id;
	}

	@Override
	public void setId(Long id) {
		this.id = id;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public int getRestype() {
		return restype;
	}

	public void setRestype(int restype) {
		this.restype = restype;
	}

	public String getResid() {
		return resid;
	}

	public void setResid(String resid) {
		this.resid = resid;
	}

	public String getResname() {
		return resname;
	}

	public void setResname(String resname) {
		this.resname = resname;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	public Long getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Long updatetime) {
		this.updatetime = updatetime;
	}

	@Override
	public String toString() {
		return String.format("ActivityItem [id=%s, aid=%s, restype=%s, resid=%s, resname=%s, creator=%s, updater=%s, createtime=%s, updatetime=%s]",
			id,
			aid,
			restype,
			resid,
			resname,
			creator,
			updater,
			createtime,
			updatetime);
	}

}
