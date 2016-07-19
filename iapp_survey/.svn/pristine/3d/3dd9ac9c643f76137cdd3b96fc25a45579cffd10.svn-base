package com.longtime.app.base.model;

import java.util.Set;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;


@Entity
@Table(name = "iapp_base_permission",schema="")
public class Permission  extends BaseModel<String> {
	
	private static final long serialVersionUID = 1366686264865935922L;
	
	@Transient
	public boolean isLeaf() {
		return rightWeight - leftWeight == 1;
	}
	
	@Transient
	public boolean isSystemType() {
        return this.getIsSystemType() == IS_SYSTEM_YES;
	}
	
	@Transient
    public boolean getIsLeaf() {
        return rightWeight - leftWeight == 1;
    }

	public static final String root_id = "6d52c9cb-309f-4ca8-b3be-f41f391bb4f9";
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(generator = "hibernate-uuid")
	@GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	@Column(length = 40)
	private String id;
	
	@Column(name="parent_id")
	private String parentId;      //父节点id
	
	@Column(name="depth")
	private int depth;      // 深度

	@Column(name="is_leaf")
	private int isLeaf=Permission.IS_LEAF_YES;  //是否是叶节点
	
	@Column(name="name")
	private String name;    // 权限名称 
	
	@Column(name="url")
	private String url;    // 权限url
	
	@Column(name="source_id")
	private String sourceId;    // 资源id
	
	@Column(name="left_weight")
	private Integer leftWeight = 0 ;
	
	@Column(name="right_weight")
	private Integer rightWeight = 0;
	
	@Column(name="remark", length=255)
	private String remark;  // 备注
	
	@Column(name="app")
	private String app ;//组织代码
	
	@Column(name="domain")
	private String domain;
	
	@Column(name="system_type")
	private int isSystemType = Permission.IS_SYSTEM_NO ;//系统类型初始化数据为true 不能删除
	
	@Column(name="is_del")
	private int isDel=Permission.IS_DEL_NO;    //删除标记：0.未删除；1.已删除
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "parentId")
	@Cache(region = "entity.cache", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
	private Set<Permission> children;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getDepth() {
		return depth;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public Integer getLeftWeight() {
		return leftWeight;
	}

	public void setLeftWeight(Integer leftWeight) {
		this.leftWeight = leftWeight;
	}

	public Integer getRightWeight() {
		return rightWeight;
	}

	public void setRightWeight(Integer rightWeight) {
		this.rightWeight = rightWeight;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getIsSystemType() {
        return isSystemType;
    }

    public void setIsSystemType(int isSystemType) {
        this.isSystemType = isSystemType;
    }

    public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Set<Permission> getChildren() {
		return children;
	}

	public void setChildren(Set<Permission> children) {
		this.children = children;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSourceId() {
        return sourceId;
    }

    public void setSourceId(String sourceId) {
        this.sourceId = sourceId;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(int isDel) {
        this.isDel = isDel;
    }

    public String getApp() {
        return app;
    }

    public void setApp(String app) {
        this.app = app;
    }
    
    /** 未删除 */
    public static int IS_DEL_NO = 0;
    
    /** 已删除 */
    public static int IS_DEL_YES = 1;
    
    /** 不是叶子节点 */
    public static int IS_LEAF_NO = 0;
    
    /** 是叶子节点 */
    public static int IS_LEAF_YES = 1;
    
    /** 不是系统初始化数据 */
    public static int IS_SYSTEM_NO = 0;
    
    /** 是系统初始化数据 */
    public static int IS_SYSTEM_YES = 1;

    
    public static void main(String[] args) {
        System.out.println(UUID.randomUUID().toString());
    }

    public void setIsLeaf(int isLeaf) {
        this.isLeaf = isLeaf;
    }
}
