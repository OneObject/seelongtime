package com.longtime.app.ixin.mgr.survey.model;

public class SurveyOption {

	private String id; //主键
	
	private String content; //内容
	
	private Integer has_input_field; //在选项后增加填空框 1是
	
	private Integer content_type; //选项后的填空框输入内容格式，0 不限 1 数字 2字母 3中文 4邮箱 5手机号码
	
	private Integer allow_skip; //选项后的填空框是否可跳过）1是
	
	private long weight; //排序权重（默认升序）
	
	private Integer exclusive; //排他的，就是选了该选项不能选择其他选项  1是
	
	private String domain; //域
	
	private Long create_time; //创建时间
	
	private String creator; //uuid 创建人ID
	
	private Long update_time; //最后修改时间
	
  	private String updater; //uuid 最后修改人ID
	
	private int isdel; //是否删除 0未删除 1已删除

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getHas_input_field() {
		return has_input_field;
	}

	public void setHas_input_field(Integer has_input_field) {
		this.has_input_field = has_input_field;
	}

	public Integer getContent_type() {
		return content_type;
	}

	public void setContent_type(Integer content_type) {
		this.content_type = content_type;
	}

	public Integer getAllow_skip() {
		return allow_skip;
	}

	public void setAllow_skip(Integer allow_skip) {
		this.allow_skip = allow_skip;
	}

	public long getWeight() {
		return weight;
	}

	public void setWeight(long weight) {
		this.weight = weight;
	}

	public Integer getExclusive() {
		return exclusive;
	}

	public void setExclusive(Integer exclusive) {
		this.exclusive = exclusive;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Long getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Long create_time) {
		this.create_time = create_time;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Long getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Long update_time) {
		this.update_time = update_time;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	@Override
	public String toString() {
		return String
				.format("SurveyOption [id=%s, content=%s, has_input_field=%s, content_type=%s, allow_skip=%s, weight=%s, exclusive=%s, domain=%s, create_time=%s, creator=%s, update_time=%s, updater=%s, isdel=%s]",
						id, content, has_input_field, content_type, allow_skip,
						weight, exclusive, domain, create_time, creator,
						update_time, updater, isdel);
	}
	
	
}
