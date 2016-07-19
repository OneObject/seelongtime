/**
 * project : iapp
 * user created : lxl
 * date created : 20131025
 */
package com.longtime.app.base.model;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.collections.map.ListOrderedMap;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.longtime.app.oplog.model.OpLog;
import com.longtime.common.model.BaseModel;

@Entity
@Table(name="iapp_base_user")
public class User extends BaseModel<String> {
    private static final long serialVersionUID = 3088343941689720414L;

    @Id
	@Column(length = 36)
    private String id;
    
    /**
     * 用户名
     */
    private String username;
   
    private String status; 

  
    @Column(name="firstoid")
    private String firstoid;
    
    /** 商户 */
    private String domain;
    
    /**
     * 真实姓名
     */
    private String name;
    
    /**
     * 昵称 （唯一）
     */
    @Column(name="nickname")
    private String nickName;
    
    
    @Column(name="avatar")
    private String avatar; //头像
    /**
     * 组织id
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "oid")
    @NotFound(action = NotFoundAction.IGNORE)
    private Organization organization;
    
    
    
    /**
     * for 牧羊
     * 分部组织id
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "supoid")
    @NotFound(action = NotFoundAction.IGNORE)
    private Organization supOrg;
    
    
    
    /**
     * 邮箱
     */
    private String email;

    /**
     * 性别
     */
    @Column(name="gender",columnDefinition ="int default 1")
    private int gender = GENDER_MALE;
    
    /**
     * 用户类型  0：普通用户 1：零时用户
     */
    @Column(name="usertype",columnDefinition ="int default 0")
    private int usertype = USER_TYPE_COMMON;
    
    /**
     * 是否可用
     */
    @Column(name="enable",columnDefinition ="int default 1")
    private int enable = ENABLE_YES; 
    
    /**
     * 生日
     */
    @Column(name="birthday",columnDefinition ="int default 0")
    private long birthday=0;
    
    /**
     * 用户类别
     */
    @Column(name="type",columnDefinition ="int default 0")
    private int type = TYPE_DEFAULT;
    
    @Column(name="category",columnDefinition ="int default 0")
    private String category = CATEGORY_EMPLOYEE;//用户分类
    
    /**
     * 手机
     */
    private String mobile;
    
    /**
     * 电话 
     */
    private String phone;
    /**
     * 绑定状态   0:未绑定，1：绑定
     */
    @Column(name="isbind",columnDefinition ="int default 0")
    private int isbind = 0;

    /**
     * 证件类型
     */
    @Column(name="certificatetype",columnDefinition ="int default 1")
    private int certificateType = CERTIFICATE_TYPE_IDENTITY;  
    
    /**
     * 证件号码
     */
    @Column(name="certificatecode")
    private String certificateCode; 
    
    
    private String unitinfo;//单位信息
    
    private Long effictivestart; //账号有效期开始时间 0和空表示不限制
    
    private Long effictiveend; //账号有效期结束时间 0和空表示不限制
    
    private String labels;//标签
    
    /**
     * 删除标记
     */
    @Column(name="isdel",columnDefinition ="int default 0")
    private int isDel = ISDEL_NO;
    
    /**
     * 创建时间
     */
    @Column(name="createtime")
    private long createTime = System.currentTimeMillis();
    
    @Column(name="creator")
    private  String  creator;
    
    @Column(name="updater")
    private String  updater;

    @Column(name="updatetime")
    private Long   updatetime;
    
    //临时手机号
    @Column(name="temporary_mobile")
    private String temporaryMobile;
    
    //临时邮箱
    @Column(name="temporary_email")
    private String temporary_email;
    
    /**
     * fujixerox 域下字段
     */
    
    @Column(name="offertime")
    private Long offertime=0L;
    
    @Column(name="boardtime")
    private Long boardtime=0L;
    
    //－1 邀请失败 0:未邀请   1：已邀请  2:关注 3取消关注 -2:已冻结 4未关注
    @Column(name="attentionstatus",columnDefinition ="int default 0")
    private int attentionstatus=0;
    
    //0:未同步  1:已同步 -1 失败 －2无需同步 －4 企业号内已不存在
    @Column(name="synchronousstatus",columnDefinition ="int default 0")
    private int synchronousstatus=0;
    
    //同步操作类型
    @Column(name="synctype",columnDefinition ="int default 0")
    private int synctype = OpLog.ACTION_ADD;
    
    //新奥中是否认证字段标示
    @Column(name="authority",columnDefinition ="tinyint default 0")
    private int authority;
    
	private String area;//区域
    
    
    private String batch;//批次
    
    
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
	
    public String getBatch() {
        return batch;
    }
    
    public void setBatch(String batch) {
        this.batch = batch;
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
	public String getTemporaryMobile() {
		return temporaryMobile;
	}
	public void setTemporaryMobile(String temporaryMobile) {
		this.temporaryMobile = temporaryMobile;
	}
	public int getUsertype() {
		return usertype;
	}
	public void setUsertype(int usertype) {
		this.usertype = usertype;
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
	public Long getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Long updatetime) {
		this.updatetime = updatetime;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDomain() {
        return domain;
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
    public String getNickName() {
        return nickName;
    }
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
    public Organization getOrganization() {
        return organization;
    }
    public void setOrganization(Organization organization) {
        this.organization = organization;
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
    public int getCertificateType() {
        return certificateType;
    }
    public void setCertificateType(int certificateType) {
        this.certificateType = certificateType;
    }
    public String getCertificateCode() {
        return certificateCode;
    }
    public void setCertificateCode(String certificateCode) {
        this.certificateCode = certificateCode;
    }
    public int getIsDel() {
        return isDel;
    }
    public void setIsDel(int isDel) {
        this.isDel = isDel;
    }
    public long getCreateTime() {
        return createTime;
    }
    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }
    
    public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getIsbind() {
		return isbind;
	}
	public void setIsbind(int isbind) {
		this.isbind = isbind;
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
	
	public String getLabels() {
		return labels;
	}
	public void setLabels(String labels) {
		this.labels = labels;
	}
	public int getSynctype() {
		return synctype;
	}
	public void setSynctype(int synctype) {
		this.synctype = synctype;
	}
	public String getFirstoid() {
		return firstoid;
	}
	public void setFirstoid(String firstoid) {
		this.firstoid = firstoid;
	}


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
     * 性别map
     */
    @SuppressWarnings("unchecked")
    public static Map<Integer, String> GENDER_MAP = new ListOrderedMap();
    static {
        GENDER_MAP.put(GENDER_MALE, "男");
        GENDER_MAP.put(GENDER_FEMAIL, "女");
        GENDER_MAP.put(GENDER_OTHER, "保密");
    }
    
    /**
     * 可用
     */
    public static int ENABLE_YES = 1 ; 
    /**
     * 不可用
     */
    public static int ENABLE_NO = 0 ;  

    /**
     *学员
     */
    public static int TYPE_DEFAULT = 0;
    
    /**
     *游客
     */
    public static String NAME_DEFAULT = "游客";
    
    /**
     * 创始人
     */
    public static int TYPE_FOUNDER = 1;
    
    /**
     * 运营商Service operators
     */
    public static int TYPE_SERVICE_OPERATORS= 2;
    
    /**
     * 讲师
     */
    public static int TYPE_TEACHER=3;
    
    /**
     * 普通管理者
     */
    public static int TYPE_MANAGER=4;
    
    
    
    /**
     * 普通用户
     */
    public static int USER_TYPE_COMMON = 0;
    
    /**
     * 临时用户
     */
    public static int USER_TYPE_UNCOMMON = 1;
    
    /**
     * 员工
     */
    public static final String CATEGORY_EMPLOYEE = "0";
    
    /**
     * 专家
     */
    public static final String CATEGORY_EXPERT = "1";
    
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
    public static enum CERTIFICATE_TYPE{
        /** 身份证 */
        IDENTITY(1),
        /** 出生证 */
        BIRTH(2),
        /** 护照  */
        PASSPORT(3),
        /** 其它 */
        OTHER(4);
        
        private int value;
        CERTIFICATE_TYPE(int value) { 
            this.value = value; 
        }
    } 
    
    public static void main(String[] args) {
//        System.out.println(CERTIFICATE_TYPE.OTHER.value);
//        for(CERTIFICATE_TYPE i: CERTIFICATE_TYPE.values()){
//            System.out.println(i.value);
//        }
        CERTIFICATE_TYPE temp = CERTIFICATE_TYPE.IDENTITY;
        switch (temp) {
        case BIRTH:
            System.out.println(temp.value);
            break;
        case IDENTITY:
            System.out.println(temp.value);
            break;

        default:
            System.out.println("default");
            break;
        }
    }
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getUnitinfo() {
		return unitinfo;
	}
	public void setUnitinfo(String unitinfo) {
		this.unitinfo = unitinfo;
	}
    
	
	public boolean isMgr(){
		
		return getType() == TYPE_FOUNDER || getType() == TYPE_SERVICE_OPERATORS || getType()==TYPE_MANAGER;
		
	}
	
	public boolean isSuperMgr(){
		
		return checkIsSuperMgr(this.getType()) ;
		
	}
	public static boolean checkIsSuperMgr(int type){
		
		return type == TYPE_FOUNDER || type == TYPE_SERVICE_OPERATORS ;
		
	}
	
	
	public String getTemporary_email() {
		return temporary_email;
	}
	public void setTemporary_email(String temporary_email) {
		this.temporary_email = temporary_email;
	}
    
    public Organization getSupOrg() {
        return supOrg;
    }
    
    public void setSupOrg(Organization supOrg) {
        this.supOrg = supOrg;
    }
    
    public String getArea() {
        return area;
    }
    
    public void setArea(String area) {
        this.area = area;
    }
    
    public String getCategory() {
        return category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    
    public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	/**
	 * 是否是超级管理员--具有所有权限的身份
	 * @author yangwenkui
	 * @time 2016年6月12日 下午8:54:38
	 * @return
	 */
	public boolean isSuperadmin() {
		if(type == TYPE_FOUNDER || type == TYPE_SERVICE_OPERATORS){
			return true;
		}
		return false;
	}
	
	
//  /**
//   * 超级管理员
//   */
//  public final static Integer ROLE_1=1; 
//  /**
//   * 普通用户
//   */
//  public final static Integer ROLE_2=2; 
//  /**
//   * 一级管理员
//   */
//  public final static Integer ROLE_3=3;  
//  /**
//   * 二级管理员
//   */
//  public final static Integer ROLE_4=4;  
//  /**
//   * 备用
//   */
//  public final static Integer ROLE_5=5; 
//  
//  public static Map<Integer, String> ROLE_MAP = new HashMap<Integer, String>();
//  static{
//      ROLE_MAP.put(ROLE_1, "超级管理员");
//      ROLE_MAP.put(ROLE_2, "普通用户");
//      ROLE_MAP.put(ROLE_3, "一级管理员");
//      ROLE_MAP.put(ROLE_4, "二级管理员");
//      ROLE_MAP.put(ROLE_5, "备用");
//  }
}