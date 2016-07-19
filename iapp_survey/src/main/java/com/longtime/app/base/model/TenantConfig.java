package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.longtime.common.model.BaseModel;

/**
 * 2016.7.19 增加字段 mailmodule 邮件模板
 * @author ganzw
 *
 */

@Entity
@Table(name = "base_tenant_config")
public class TenantConfig extends BaseModel<String> {

	private static Logger logger = LoggerFactory.getLogger(TenantConfig.class);

	public static class Setting {
		private int autobind; // 自动绑定整体 0:未绑定 2：跳过绑定 4：完成绑定

		public Setting() {
		}

		public static Setting toSetting(String settingStr) {
			if (StringUtils.isNotBlank(settingStr)) {
				try {
					return JSONObject.parseObject(settingStr, Setting.class);
				} catch (Exception e) {
					logger.error(String.format(
							"parse string to setting due to fail.string=[%s]",
							settingStr), e);
					return null;
				}
			}
			return null;
		}

		public String toJson() {
			return JSONObject.toJSONString(this);
		}

		public int getAutobind() {
			return autobind;
		}

		public void setAutobind(int autobind) {
			this.autobind = autobind;
		}

		@JSONField(serialize = false)
		public boolean isMustBind() {
			return autobind == 0;
		}

		@JSONField(serialize = false)
		public void skipBind() {
			this.autobind = 2;
		}

		@JSONField(serialize = false)
		public void finishBind() {
			this.autobind = 4;
		}

		@Override
		public String toString() {
			return String.format("Setting [autobind=%s]", autobind);
		}

		public static void main(String[] args) {

			Setting setting = new Setting();
			setting.setAutobind(1);

			String json = setting.toJson();
			System.out.println(json);

			System.out.println(Setting.toSetting(json));
		}

	}

	private static final long serialVersionUID = -2541548116615328073L;

	@Id
	@Column(length = 36)
	private String id; // 商户标示

	private boolean isopen = false;// 是否全站开放

	private boolean openregister = false; // 开放注册
	
	@Column(length = 2000)
	private String mailmodule;		//邮件模板的HTML语句

	@Column(name="sendnotify",columnDefinition ="boolean default false")
	private boolean sendnotify = false; //开启提醒
	
	private int upperlimit = 0; //当天消息提醒上限 0不限制  未启用
	
	private boolean shownavigation = false;
	
	@Column(name="isautosyn",columnDefinition ="boolean default false")
	private boolean isautosyn = false;
	
	@Column(name="syncfromwx",columnDefinition ="boolean default false")
	private boolean syncfromwx = false;

	private boolean isreply = false; // 是否回复

	private String replycontent; // 回复内容

	@Column(length = 2000)
	private String setting; // 配置信息 json字符串
	
	@Column(length = 32)
	private String color;
	
	
	@Column(name="isfoddershare",columnDefinition ="boolean default false")
	private boolean isfoddershare = false;
	

	private String creater;

	@Column(name = "createtime")
	private Long createtime = System.currentTimeMillis();

	private String updater;

	@Column(name = "updatetime")
	private Long updatetime = 0L;

	@Column(length = 1000)
	private String login_prompt;//登录提示
	
	private String host;

	private Integer port = -1;

	private String username;

	private String password;

	private String alias;
	
	@Override
	public String getId() {
		return id;
	}
	
	public boolean isIsautosyn() {
		return isautosyn;
	}

	public void setIsautosyn(boolean isautosyn) {
		this.isautosyn = isautosyn;
	}

	public boolean isSyncfromwx() {
		return syncfromwx;
	}

	public void setSyncfromwx(boolean syncfromwx) {
		this.syncfromwx = syncfromwx;
	}

	public boolean isIsopen() {
		return isopen;
	}

	public void setIsopen(boolean isopen) {
		this.isopen = isopen;
	}

	public boolean isSendnotify() {
		return sendnotify;
	}

	public void setSendnotify(boolean sendnotify) {
		this.sendnotify = sendnotify;
	}

	public int getUpperlimit() {
		return upperlimit;
	}

	public void setUpperlimit(int upperlimit) {
		this.upperlimit = upperlimit;
	}

	public boolean isIsreply() {
		return isreply;
	}

	public void setIsreply(boolean isreply) {
		this.isreply = isreply;
	}

	public String getReplycontent() {
		return replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
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

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isOpenregister() {
		return openregister;
	}

	public void setOpenregister(boolean openregister) {
		this.openregister = openregister;
	}

	public String getSetting() {
		return setting;
	}

	public void setSetting(String setting) {
		this.setting = setting;
	}

	public Setting getSettingObj() {
		if (StringUtils.isNotBlank(setting)) {
			return Setting.toSetting(setting);
		}
		return null;
	}

	public void setSettingObj(Setting settingObj) {
		if (null != settingObj) {
			this.setting = settingObj.toJson();
		}
	}

	public boolean isShownavigation() {
		return shownavigation;
	}

	public void setShownavigation(boolean shownavigation) {
		this.shownavigation = shownavigation;
	}

	public String getLogin_prompt() {
		return login_prompt;
	}

	public void setLogin_prompt(String login_prompt) {
		this.login_prompt = login_prompt;
	}


	public String getHost() {
		return host;
	}


	public void setHost(String host) {
		this.host = host;
	}


	public Integer getPort() {
		return port;
	}


	public void setPort(Integer port) {
		this.port = port;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getAlias() {
		return alias;
	}


	public void setAlias(String alias) {
		this.alias = alias;
	}


	public boolean isIsfoddershare() {
		return isfoddershare;
	}


	public void setIsfoddershare(boolean isfoddershare) {
		this.isfoddershare = isfoddershare;
	}


	public boolean isSetEmailConfig() {
		if(StringUtils.isBlank(host) || port == null || StringUtils.isBlank(username) || StringUtils.isBlank(password)){
			return false;
		}
		return true;
	}
	
	
	public String getMailmodule() {
		return mailmodule;
	}

	public void setMailmodule(String mailmodule) {
		this.mailmodule = mailmodule;
	}

	@Override
	public String toString() {
		return String
				.format("TenantConfig [id=%s, isopen=%s, openregister=%s, sendnotify=%s, upperlimit=%s, shownavigation=%s, isautosyn=%s, syncfromwx=%s, isreply=%s, replycontent=%s, setting=%s, color=%s, isfoddershare=%s, creater=%s, createtime=%s, updater=%s, updatetime=%s, login_prompt=%s, host=%s, port=%s, username=%s, password=%s, alias=%s, mailmodule=%s]",
						id, isopen, openregister, sendnotify, upperlimit,
						shownavigation, isautosyn, syncfromwx, isreply,
						replycontent, setting, color, isfoddershare, creater,
						createtime, updater, updatetime, login_prompt, host,
						port, username, password, alias, mailmodule);
	}
	
}
