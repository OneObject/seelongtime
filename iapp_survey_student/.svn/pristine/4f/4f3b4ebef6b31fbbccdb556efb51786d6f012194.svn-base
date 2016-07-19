package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

public class User extends BaseEntity<String> {

	private static final long serialVersionUID = 231540271173279153L;

	private static final long ONE_DAY = 24 * 60 * 60 * 1000L;

	private String id;

	private String username;

	private String firstoid;

	private String status; // 暂不使用

	private String domain; // 商户

	private String name; // 真实姓名

	private String nickname; // 昵称 （唯一）

	private String avatar; // 头像

	private String oid; // 所属组织ID

	private String email; // 邮箱

	private int gender = GENDER_MALE; // 性别

	private int enable = ENABLE_YES; // 是否可用

	private long birthday; // 生日

	private int type = TYPE_DEFAULT; // 用户类别

	private int usertype = USER_TYPE_COMMON;

	private String mobile; // 手机

	private String phone; // 电话

	private int certificatetype = CERTIFICATE_TYPE_IDENTITY; // 证件类型

	private String certificatecode; // 证件号码

	private int isdel = ISDEL_NO; // 删除标记

	private String unitinfo;// 单位信息

	private String temporary_mobile;// 临时手机号（报名时用）

	private String temporary_email;// 临时邮箱（游客使用）

	private Long effictivestart; // 账号有效期开始时间 0和空表示不限制

	private Long effictiveend; // 账号有效期结束时间 0和空表示不限制

	private int isbind = 0;

	private Long offertime = 0L;

	private Long boardtime = 0L;

	// 0:未邀请 1：已邀请 2:关注 3取消关注
	private int attentionstatus = 0;

	// 0:未同步 1:公布
	private int synchronousstatus = 0;

	private int synctype = 0;

	private String area;// 区域

	private String category = CATEGORY_EMPLOYEE;// 用户分类

	private String batch;

	private int authority;

	private String labels;// 标签

	/**
	 * 员工
	 */
	public static final String CATEGORY_EMPLOYEE = "0";

	/**
	 * 指导人
	 */
	public static final String CATEGORY_EXPERT = "1";

	/**
	 * 达人
	 */
	public static final String CATEGORY_SUPER = "3";

	/**
	 * 游客
	 */
	public static String NAME_DEFAULT = "游客";

	/**
	 * 男
	 */
	public static int GENDER_MALE = 1;
	/**
	 * 女
	 */
	public static int GENDER_FEMAIL = 2;
	/**
	 * 保密
	 */
	public static int GENDER_OTHER = 3;

	/**
	 * 可用
	 */
	public static int ENABLE_YES = 1;
	/**
	 * 不可用
	 */
	public static int ENABLE_NO = 0;

	/**
	 * 学员
	 */
	public static int TYPE_DEFAULT = 0;

	/**
	 * 创始人
	 */
	public static int TYPE_FOUNDER = 1;

	/**
	 * 运营商Service operators
	 */
	public static int TYPE_SERVICE_OPERATORS = 2;
	/**
	 * 老师
	 */
	public static int TYPE_TEACHER = 3;

	/**
	 * 未删除
	 */
	public static int ISDEL_NO = 0;

	/**
	 * 已删除
	 */
	public static int ISDEL_YES = 1;

	/**
	 * 身份证
	 */
	public static int CERTIFICATE_TYPE_IDENTITY = 1;
	/**
	 * 军官证
	 */
	public static int CERTIFICATE_TYPE_OFFICER = 2;
	/**
	 * 护照
	 */
	public static int CERTIFICATE_TYPE_PASSPORT = 3;
	/**
	 * 其它
	 */
	public static int CERTIFICATE_TYPE_OTHER = 4;
	/**
	 * 证件类型map
	 */

	/**
	 * 普通用户
	 */
	public static int USER_TYPE_COMMON = 0;

	/**
	 * 零时用户
	 */
	public static int USER_TYPE_UNCOMMON = 1;

	public static Map<Integer, String> CERTIFICATE_TYPE_MAP = new HashMap<Integer, String>();

	static {
		CERTIFICATE_TYPE_MAP.put(CERTIFICATE_TYPE_IDENTITY, "身份证");
		CERTIFICATE_TYPE_MAP.put(CERTIFICATE_TYPE_OFFICER, "军官证");
		CERTIFICATE_TYPE_MAP.put(CERTIFICATE_TYPE_PASSPORT, "护照");
		CERTIFICATE_TYPE_MAP.put(CERTIFICATE_TYPE_OTHER, "其它");
	}

	/**
	 * 证件类型
	 */
	public static enum CERTIFICATE_TYPE {
		/** 身份证 */
		IDENTITY(1), /** 出生证 */
		BIRTH(2), /** 护照 */
		PASSPORT(3), /** 其它 */
		OTHER(4);

		private int value;

		CERTIFICATE_TYPE(int value) {
			this.value = value;
		}

		public int getValue() {
			return value;
		}
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStatus() {
		return status;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDomain() {
		return domain;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public long getBirthday() {
		return birthday;
	}

	public void setBirthday(long birthday) {
		this.birthday = birthday;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCertificatetype() {
		return certificatetype;
	}

	public void setCertificatetype(int certificatetype) {
		this.certificatetype = certificatetype;
	}

	public String getCertificatecode() {
		return certificatecode;
	}

	public void setCertificatecode(String certificatecode) {
		this.certificatecode = certificatecode;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	public String getUnitinfo() {
		return unitinfo;
	}

	public void setUnitinfo(String unitinfo) {
		this.unitinfo = unitinfo;
	}

	public int getIsbind() {
		return isbind;
	}

	public void setIsbind(int isbind) {
		this.isbind = isbind;
	}

	public int getUsertype() {
		return usertype;
	}

	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}

	public String getTemporary_mobile() {
		return temporary_mobile;
	}

	public void setTemporary_mobile(String temporary_mobile) {
		this.temporary_mobile = temporary_mobile;
	}

	public Long getEffictivestart() {
		return effictivestart;
	}

	public void setEffictivestart(Long effictivestart) {
		this.effictivestart = effictivestart;
	}

	public Long getEffictiveend() {
		return effictiveend;
	}

	public void setEffictiveend(Long effictiveend) {
		this.effictiveend = effictiveend;
	}

	public Long getOffertime() {
		return offertime;
	}

	public void setOffertime(Long offertime) {
		this.offertime = offertime;
	}

	public Long getBoardtime() {
		return boardtime;
	}

	public void setBoardtime(Long boardtime) {
		this.boardtime = boardtime;
	}

	public int getAttentionstatus() {
		return attentionstatus;
	}

	public void setAttentionstatus(int attentionstatus) {
		this.attentionstatus = attentionstatus;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFirstoid() {
		return firstoid;
	}

	public void setFirstoid(String firstoid) {
		this.firstoid = firstoid;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}

	public String getLabels() {
		return labels;
	}

	public void setLabels(String labels) {
		this.labels = labels;
	}

	@Override
	public String toString() {
		return String.format(
				"User [id=%s, username=%s, status=%s, domain=%s, name=%s, nickname=%s, avatar=%s, oid=%s, email=%s, gender=%s, enable=%s, birthday=%s, type=%s, usertype=%s, mobile=%s, phone=%s, certificatetype=%s, certificatecode=%s, isdel=%s, unitinfo=%s, temporary_mobile=%s, temporary_email=%s, effictivestart=%s, effictiveend=%s, isbind=%s, offertime=%s, boardtime=%s, attentionstatus=%s, synchronousstatus=%s, synctype=%s, category=%s]",
				id, username, status, domain, name, nickname, avatar, oid, email, gender, enable, birthday, type,
				usertype, mobile, phone, certificatetype, certificatecode, isdel, unitinfo, temporary_mobile,
				temporary_email, effictivestart, effictiveend, isbind, offertime, boardtime, attentionstatus,
				synchronousstatus, synctype, category);
	}

	public String getTemporary_email() {
		return temporary_email;
	}

	public void setTemporary_email(String temporary_email) {
		this.temporary_email = temporary_email;
	}

	public static class Hepler {
		public static String getShowName(User user) {
			if (null == user) {
				return StringUtils.EMPTY;
			}
			return StringUtils.isNotBlank(user.getNickname()) ? user.getNickname()
					: StringUtils.isNotBlank(user.getName()) ? user.getName() : user.getUsername();
		}
	}

	public boolean isExpired() {
		long current = System.currentTimeMillis();
		if (this.effictivestart != null && this.effictivestart != 0 && this.effictivestart > current) {
			return true;
		}

		if (this.effictiveend != null && this.effictiveend != 0 && (this.effictiveend + ONE_DAY) < current) {
			return true;
		}

		return false;
	}

	public boolean isIneffective() {

		long current = System.currentTimeMillis();

		if (this.effictivestart != null && this.effictivestart != 0 && this.effictivestart > current) {
			return true;
		}

		return false;
	}

}