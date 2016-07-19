package com.longtime.ajy.mweb.model;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.ListOrderedMap;

import com.longtime.common.model.BaseEntity;

/**
 * 试题
 * 
 */
public class TestQuestionModel extends BaseEntity<String> {
	
	private String _id;
	
	private static final long serialVersionUID = 1L;

	private String itemId; // 题库id

	private String importLogId; // 导入记录id

	private String title; // 试题题目

	private Integer type; // 试题类型

	private List<Option> options; // 选项

	private String answer; // 答案

	private float score; // 分数

	private int difficulty; // 难度

	public static Integer JUDGE_QUESTION = 1; // 判断题

	public static Integer SINGLE_QUESTION = 2; // 单选

	public static Integer MULTIPLE_QUESTION = 3; // 多选

	public static Integer ASK_QUESTION = 4; // 问答题

	private String mark; // 备注

	private String domain;

	private EntityMetaInfo entityMetaInfo; // 选项

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getImportLogId() {
		return importLogId;
	}

	public void setImportLogId(String importLogId) {
		this.importLogId = importLogId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public List<Option> getOptions() {
		return options;
	}

	public void setOptions(List<Option> options) {
		this.options = options;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}



	@Override
	public String toString() {
		return String.format("TestQuestionModel [_id=%s, itemId=%s, importLogId=%s, title=%s, type=%s, options=%s, answer=%s, score=%s, difficulty=%s, mark=%s, domain=%s, entityMetaInfo=%s]",
			_id,
			itemId,
			importLogId,
			title,
			type,
			options,
			answer,
			score,
			difficulty,
			mark,
			domain,
			entityMetaInfo);
	}



	@SuppressWarnings("unchecked")
	public static Map<String, Integer> questionTypeMap = new ListOrderedMap();
	static {
		questionTypeMap.put("是非题", TestQuestionModel.JUDGE_QUESTION);
		questionTypeMap.put("单选题", TestQuestionModel.SINGLE_QUESTION);
		questionTypeMap.put("多选题", TestQuestionModel.MULTIPLE_QUESTION);
		questionTypeMap.put("问答题", TestQuestionModel.ASK_QUESTION);
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public EntityMetaInfo getEntityMetaInfo() {
		return entityMetaInfo;
	}

	public void setEntityMetaInfo(EntityMetaInfo entityMetaInfo) {
		this.entityMetaInfo = entityMetaInfo;
	}

	@Override
	public String getId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setId(String id) {
		// TODO Auto-generated method stub
		
	}

}
