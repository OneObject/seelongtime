package com.longtime.app.base.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name="base_account")
public class Account extends BaseModel<Long> {

	private static final long serialVersionUID = 4111722277390052744L;
	
	@Id
	@GenericGenerator(name = "idGenerator", strategy = "identity")
	@GeneratedValue(generator = "idGenerator")
	private Long   id;
	
    private String account;
    private String pwd;                        // 密文
    private short  type   = Type.email.code;   // 0:邮箱 1：手机 3：xxx
    private String uid;
    private String domainid;
    private short  status = Status.normal.code; // 0可用 1禁用    
    private String creator;
    private String updater;
    private long   createtime;//创建时间
    private long   updatetime;//修改时间  
    private long lastlogintime = 0L; //最后登录时间
    
    public static final String DEFAULT_PWD = "888888";
   
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public long getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(long updatetime) {
		this.updatetime = updatetime;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public short getType() {
		return type;
	}

	public void setType(short type) {
		this.type = type;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getDomainid() {
		return domainid;
	}

	public void setDomainid(String domainid) {
		this.domainid = domainid;
	}

	public short getStatus() {
		return status;
	}

	public void setStatus(short status) {
		this.status = status;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(long createtime) {
		this.createtime = createtime;
	}

	public long getLastlogintime() {
		return lastlogintime;
	}

	public void setLastlogintime(long lastlogintime) {
		this.lastlogintime = lastlogintime;
	}





	public static enum Type {
        email((short) 0), phone((short) 1),username((short)2),other((short)10);

        private short code;

        Type(short code){
            this.code = code;
        }

        public short getCode() {
            return code;
        }
    }

    public static enum Status {
        normal((short) 0), disable((short) 1);

        private short code;

        Status(short code){
            this.code = code;
        }

        public short getCode() {
            return code;
        }
    }

	


	
}
