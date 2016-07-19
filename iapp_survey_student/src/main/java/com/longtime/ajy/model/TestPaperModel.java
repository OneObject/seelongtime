/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-8-27 - 上午10:26:43
 */
package com.longtime.ajy.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.jongo.marshall.jackson.oid.Id;



/**
 * @since 2013-8-27
 * @author yangwk
 * 
 */
public class TestPaperModel {

	@Id
	private  String _id;
	
	private String name; //试卷名称
	
	private int difficulty_level; //试题难易度
	
	private Float total_score; //试卷总分
	
	private Float pass_mark; //及格分
	
	private String descript; //试卷描述
	
	private int generate_type;//组卷方式
	
	private EntityMetaInfo entityMetaInfo;
	/**
	 * 是否包含问答题
	 */
	private int isContainAsk;
    
    private String domain;
	
	/**
	 * 自动组卷
	 */
	public static int GENERATE_TYPE_AUTO = 1;
	
	/**
	 * 手工组卷
	 */
	public static int GENERATE_TYPE_HANDLE = 2;
	
	/**
	 * 包含问答题
	 */
	public static int CONTAIN_ASK_YES = 1;
	
	/**
	 * 不包含问答题
	 */
	public static int CONTAIN_ASK_NO = 2;
	
	
	
	public EntityMetaInfo getEntityMetaInfo() {
		return entityMetaInfo;
	}

	public void setEntityMetaInfo(EntityMetaInfo entityMetaInfo) {
		this.entityMetaInfo = entityMetaInfo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDifficulty_level() {
		return difficulty_level;
	}

	public void setDifficulty_level(int difficulty_level) {
		this.difficulty_level = difficulty_level;
	}

	public Float getTotal_score() {
		return total_score;
	}

	public void setTotal_score(Float total_score) {
		this.total_score = total_score;
	}

	public Float getPass_mark() {
		return pass_mark;
	}

	public void setPass_mark(Float pass_mark) {
		this.pass_mark = pass_mark;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public int getGenerate_type() {
		return generate_type;
	}

	public void setGenerate_type(int generate_type) {
		this.generate_type = generate_type;
	}
	public String getFormatCreateDate(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(this.entityMetaInfo.getDateCreated());
	}
	
	public String getFormatUpdateDate(){
		if(this.entityMetaInfo.getDateLastModified()==null || this.entityMetaInfo.getDateLastModified() == 0L){
			return "";
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(new Date(this.entityMetaInfo.getDateLastModified()));
	}

  public int getIsContainAsk() {
    return isContainAsk;
  }

  public void setIsContainAsk(int isContainAsk) {
    this.isContainAsk = isContainAsk;
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




}
