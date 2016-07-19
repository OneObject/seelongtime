package com.longtime.ajy.mweb.model;


import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;

public class Video {

	private static final long serialVersionUID = -3292460234841928655L;
	public static final int ISRELEASE = 1;// 发布
	public static final int NORELEASE = 0;// 未发布

	// 推荐等级
	public static final int ONE_STAR = 1;// 一星级
	public static final int TWO_STAR = 2;// 二星
	public static final int THREE_STAR = 3;// 三星级
	public static final int FOUR_STAR = 4;// 四星
	public static final int FIVE_STAR = 5;// 五

	// 视频来源
	public static final String SOURCE_CLOUD = "cloud";// 云端
	public static final String SOURCE_WEBAPP = "webapp";// 服务端

	// 权限域
	public static final String DOMAIN_ALL = "all";

	private String name; // 视频名称

	private String desp; // 视频描述

	private String size; // 视频大小

	private String token; // 令牌，用于取videoid

	private String videoid; // 用于获取播放资源

	private int status; // 视频状态

	private long ftime = 0; // 获取转码刷新次数

	private long duration;// 视频长度，单位秒

	private long coverPoint = 1;// 封面时间点

	private String displayName;// 视频展示名称

	private String posterURL;// 截屏地址

	private int isrelease = NORELEASE;// 是否发布

	private String type;

	private int recommendrank;// 推荐等级

	private String domain;// 域，表示可以允许谁观看

	private String source;// 来源

	private String sourceURL;// 资源地址[可播放的地址]

	private String mp4downloadurl; // mp4编码下载地址

	private Long mp4time; // mp4 create api request time

	private boolean  is_delete;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getRecommendrank() {
		return recommendrank;
	}

	public void setRecommendrank(int recommendrank) {
		this.recommendrank = recommendrank;
	}

	public static enum VideoStatus {
		fail(-1), encoding(0), success(10);

		private VideoStatus(int code) {
			this.code = code;
		}

		public final int code;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public long getCoverPoint() {
		return coverPoint;
	}

	public int getIsrelease() {
		return isrelease;
	}

	public void setIsrelease(int isrelease) {
		this.isrelease = isrelease;
	}

	public String getPosterURL() {
		return posterURL;
	}

	public void setPosterURL(String posterURL) {
		this.posterURL = posterURL;
	}

	public void setCoverPoint(long coverPoint) {
		this.coverPoint = coverPoint;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesp() {
		return desp;
	}

	public void setDesp(String desp) {
		this.desp = desp;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getVideoid() {
		return videoid;
	}

	public void setVideoid(String videoid) {
		this.videoid = videoid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public long getFtime() {
		return ftime;
	}

	public void setFtime(long ftime) {
		this.ftime = ftime;
	}

	public void encodeSuccess(String videoId) {
		this.videoid = videoId;
		this.status = VideoStatus.success.code;
	}

	public void encodeFail() {
		this.status = VideoStatus.fail.code;
	}

	public long incrFtime() {
		return ++this.ftime;
	}

	public long getDuration() {
		return duration;
	}

	public void setDuration(long duration) {
		this.duration = duration;
	}

	/**
	 * 域
	 * 
	 * @return
	 */
	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	/**
	 * 来源，云端、服务端
	 * 
	 * @return
	 */
	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getSourceURL() {
		return sourceURL;
	}

	public void setSourceURL(String sourceURL) {
		this.sourceURL = sourceURL;
	}

	public String getMp4downloadurl() {
		return mp4downloadurl;
	}

	public void setMp4downloadurl(String mp4downloadurl) {
		this.mp4downloadurl = mp4downloadurl;
	}

	public Long getMp4time() {
		return mp4time;
	}

	public void setMp4time(Long mp4time) {
		this.mp4time = mp4time;
	}

	public boolean is_delete() {
		return is_delete;
	}

	public void setIs_delete(boolean is_delete) {
		this.is_delete = is_delete;
	}

	private static String[]  audio_type = new String[]{"MP3","WAV"};
	public boolean isAudio(){

		String extension = FilenameUtils.getExtension(this.name);
		if(StringUtils.isBlank(extension)){

		}
		for(String type:audio_type){
			if(type.equalsIgnoreCase(extension)){
				return true;
			}
		}
		return  false;
	}

}