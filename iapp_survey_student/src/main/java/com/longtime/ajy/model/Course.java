package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

import java.math.BigDecimal;

public class Course extends BaseEntity<String> {

    private static final long serialVersionUID    = 6450199213237130621L;

    private String            name;

    private String            no;

    private long              expiretime;

    private String            resid;
    private int               restype             = 0;

    private String            categoryid;
    
    private String            tid;

    private String            coursewareid;

    private String            descript;

    private String            domainid;

    private String            cover;

    private int               released            = RELEASEED_NO;

    private long              releasetime;

    private int               isdel               = Delete.NORMAL.code;

    private BigDecimal        length;
    
    private BigDecimal        completepercent; 

    private int               openstate           = OPEN_STATE_UNOPENED;

    // 公开
    public static int         OPEN_STATE_OPENED   = 1;
    // 不公开
    public static int         OPEN_STATE_UNOPENED = 2;
    // 全站公开
    public static int         OPEN_STATE_ALL      = 3;

    private String            path;

    private String            remark;

    private int               score               = 0;

    private int               sort                = 0;

    private String            startpage;                                 // 非scorm课件首页

    private int               topindex            = 0;                   // 置顶排序

    private int               containvideo        = CONTAIN_VIDEO_NO;    // 是否包含视频

    public static short       CONTAIN_VIDEO_YES   = 1;                   // 包含
    public static short       CONTAIN_VIDEO_NO    = 0;                   // 不包含

    private short             supportmobile       = SUPPORTMOBILE_NO;    // 是否支持移动端 默认不支持

    public static short       SUPPORTMOBILE_YES   = 1;
    public static short       SUPPORTMOBILE_NO    = 0;

    public static String      DEFAULT_START_PAGE  = "index.html";

    /**
     * scorm课程
     */
    public static int         RES_TYPE_SCORM      = 1;

    /**
     * 非scorm课程
     */
    public static int         RES_TYPE_SITE       = 2;

    /**
     * 视频课程
     */
    public static int         RES_TYPE_VIDEO      = 3;

    public static int         RES_TYPE_DOCUMENT   = 4;                   // 用来表示课程的类型为文档类型。
   
    public static int         RES_TYPE_FODDER   = 5;                   // 用来表示课程的类型为素材类型。
    
    
    public static String IS_SUB_TREE_YES = "1"; //整棵子树
    

    @Override
    public String getId() {
        return this.id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public static int RELEASEED_NO  = 0;
    public static int RELEASEED_YES = 1;

    public static enum Type {
        scorm(1), site(2), video(3);

        private int code;

        Type(int code){
            this.code = code;
        }

        public int getCode() {
            return code;
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public long getExpiretime() {
        return expiretime;
    }

    public void setExpiretime(long expiretime) {
        this.expiretime = expiretime;
    }

    public String getResid() {
        return resid;
    }

    public void setResid(String resid) {
        this.resid = resid;
    }

    public int getRestype() {
        return restype;
    }

    public void setRestype(int restype) {
        this.restype = restype;
    }

    public String getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(String categoryid) {
        this.categoryid = categoryid;
    }

    public String getCoursewareid() {
        return coursewareid;
    }

    public void setCoursewareid(String coursewareid) {
        this.coursewareid = coursewareid;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public String getDomainid() {
        return domainid;
    }

    public void setDomainid(String domainid) {
        this.domainid = domainid;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public int getReleased() {
        return released;
    }

    public void setReleased(int released) {
        this.released = released;
    }

    public long getReleasetime() {
        return releasetime;
    }

    public void setReleasetime(long releasetime) {
        this.releasetime = releasetime;
    }

    public int getIsdel() {
        return isdel;
    }

    public void setIsdel(int isdel) {
        this.isdel = isdel;
    }

    public BigDecimal getLength() {
        return length;
    }

    public void setLength(BigDecimal length) {
        this.length = length;
    }

   

	public BigDecimal getCompletepercent() {
		return completepercent;
	}

	public void setCompletepercent(BigDecimal completepercent) {
		this.completepercent = completepercent;
	}

	public int getOpenstate() {
        return openstate;
    }

    public void setOpenstate(int openstate) {
        this.openstate = openstate;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public String getStartpage() {
        return startpage;
    }

    public void setStartpage(String startpage) {
        this.startpage = startpage;
    }

    public int getTopindex() {
        return topindex;
    }

    public void setTopindex(int topindex) {
        this.topindex = topindex;
    }

    public short getSupportmobile() {
        return supportmobile;
    }

    public void setSupportmobile(short supportmobile) {
        this.supportmobile = supportmobile;
    }

    public int getContainvideo() {
        return containvideo;
    }

    public void setContainvideo(int containvideo) {
        this.containvideo = containvideo;
    }
    

    public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	@Override
    public String toString() {
        return String.format("Course [name=%s, no=%s, expiretime=%s, resid=%s, restype=%s, categoryid=%s, coursewareid=%s, descript=%s, domainid=%s, cover=%s, released=%s, releasetime=%s, isdel=%s, length=%s, openstate=%s, path=%s, remark=%s, score=%s, sort=%s, startpage=%s, topindex=%s, containvideo=%s, supportmobile=%s]",
                             name, no, expiretime, resid, restype, categoryid, coursewareid, descript, domainid, cover,
                             released, releasetime, isdel, length, openstate, path, remark, score, sort, startpage,
                             topindex, containvideo, supportmobile);
    }
}
