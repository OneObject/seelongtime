package com.longtime.app.ixin.mgr.survey.model;

import java.util.List;

public class SurveyQuestion {

	private String id; //主键
	
	private String  title; //名称
	
	private int type; //题目类型  1 单选  2 多选 3问答4打分   5 矩阵单选题 6 矩阵多选题 7 矩阵打分题 8 段落说明 9 分页
	
	private long weight; //排序权重（升序）
	
	private int  title_num; //题目序号
	
	private int  page_num; //试题在第几页
	
	private int  allow_skip; //该题可跳过不回答 0不允许（默认） 1允许
	
	private int min_answer_num; //最少选几项
	
	private int max_answer_num; //最多选几项
	
	private String survey_id; //调研id
	
	private List<SurveyOption> options; //试题的选项
	
	private List<SurveyOption> matrix_options; //试题的矩阵行
	
	private int op_random; //选项随机排列 0否（默认） 1是
	
	private int mop_random; //矩阵行随机排列 0否（默认） 1是
	
	private int  min_score; //打分题－最低分
	
	private int  max_score; //打分题－最高分
	
	private String left_tip; //左边分数对应的文字
	
	private String middle_tip; //中间分数对应的文字
	
	private String right_tip; //右边分数对应的文字
	
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public long getWeight() {
		return weight;
	}

	public void setWeight(long weight) {
		this.weight = weight;
	}

	public int getTitle_num() {
		return title_num;
	}

	public void setTitle_num(int title_num) {
		this.title_num = title_num;
	}

	public int getPage_num() {
		return page_num;
	}

	public void setPage_num(int page_num) {
		this.page_num = page_num;
	}

	public int getAllow_skip() {
		return allow_skip;
	}

	public void setAllow_skip(int allow_skip) {
		this.allow_skip = allow_skip;
	}

	public int getMin_answer_num() {
		return min_answer_num;
	}

	public void setMin_answer_num(int min_answer_num) {
		this.min_answer_num = min_answer_num;
	}

	public int getMax_answer_num() {
		return max_answer_num;
	}

	public void setMax_answer_num(int max_answer_num) {
		this.max_answer_num = max_answer_num;
	}

	public String getSurvey_id() {
		return survey_id;
	}

	public void setSurvey_id(String survey_id) {
		this.survey_id = survey_id;
	}

	public List<SurveyOption> getOptions() {
		return options;
	}

	public void setOptions(List<SurveyOption> options) {
		this.options = options;
	}

	public List<SurveyOption> getMatrix_options() {
		return matrix_options;
	}

	public void setMatrix_options(List<SurveyOption> matrix_options) {
		this.matrix_options = matrix_options;
	}

	public int getOp_random() {
		return op_random;
	}

	public void setOp_random(int op_random) {
		this.op_random = op_random;
	}

	public int getMop_random() {
		return mop_random;
	}

	public void setMop_random(int mop_random) {
		this.mop_random = mop_random;
	}

	public int getMin_score() {
		return min_score;
	}

	public void setMin_score(int min_score) {
		this.min_score = min_score;
	}

	public int getMax_score() {
		return max_score;
	}

	public void setMax_score(int max_score) {
		this.max_score = max_score;
	}

	public String getLeft_tip() {
		return left_tip;
	}

	public void setLeft_tip(String left_tip) {
		this.left_tip = left_tip;
	}

	public String getMiddle_tip() {
		return middle_tip;
	}

	public void setMiddle_tip(String middle_tip) {
		this.middle_tip = middle_tip;
	}

	public String getRight_tip() {
		return right_tip;
	}

	public void setRight_tip(String right_tip) {
		this.right_tip = right_tip;
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
				.format("SurveyQuestion [id=%s, title=%s, type=%s, weight=%s, title_num=%s, page_num=%s, allow_skip=%s, min_answer_num=%s, max_answer_num=%s, survey_id=%s, options=%s, matrix_options=%s, op_random=%s, mop_random=%s, min_score=%s, max_score=%s, left_tip=%s, middle_tip=%s, right_tip=%s, domain=%s, create_time=%s, creator=%s, update_time=%s, updater=%s, isdel=%s]",
						id, title, type, weight, title_num, page_num,
						allow_skip, min_answer_num, max_answer_num, survey_id,
						options, matrix_options, op_random, mop_random,
						min_score, max_score, left_tip, middle_tip, right_tip,
						domain, create_time, creator, update_time, updater,
						isdel);
	}
	
}
