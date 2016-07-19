package com.longtime.app.ixin.mgr.survey.model;

import java.util.Locale;

public enum SurveyQuestionType {
	//private int type; //题目类型  1 单选 2 多选 3.问答 4打分  5 矩阵单选题 6 矩阵多选题 7 矩阵打分题 8 段落说明 9 分页
	DANXUAN(1),DUOXUAN(2),WENDA(3),DAFEN(4),JZDANXUAN(5),JZDUOXUAN(6),JZDAFEN(7),DUANLUO(8),FENYE(9);
	private int vaule;
	
	private SurveyQuestionType(int value){
		this.vaule = value;
	}

	public int getVaule() {
		return vaule;
	}
	
	public static SurveyQuestionType getQuestionType(String str){
		if(str.equalsIgnoreCase("DANXUAN")){
			return DANXUAN;
		}else if (str.equalsIgnoreCase("DUOXUAN")) {
			return DUOXUAN;
		}else if (str.equalsIgnoreCase("WENDA")) {
			return WENDA;
		}else if (str.equalsIgnoreCase("DAFEN")) {
			return DAFEN;
		}else if (str.equalsIgnoreCase("JZDANXUAN")) {
			return JZDANXUAN;
		}else if (str.equalsIgnoreCase("JZDUOXUAN")) {
			return JZDUOXUAN;
		}else if (str.equalsIgnoreCase("JZDAFEN")) {
			return JZDAFEN;
		}else if (str.equalsIgnoreCase("DUANLUO")) {
			return DUANLUO;
		}else if (str.equalsIgnoreCase("FENYE")) {
			return FENYE;
		}        
		return null;
	}
	
	@Override
	public String toString() {
		return name().toLowerCase(Locale.ENGLISH);
	}
	public static void main(String[] args) {
		String string =  "aa_bb_cc_";
		System.out.println(string.split("_")[2]);
	}
}
