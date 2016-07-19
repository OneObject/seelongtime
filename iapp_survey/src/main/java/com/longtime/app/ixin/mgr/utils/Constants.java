package com.longtime.app.ixin.mgr.utils;

public class Constants {
	/**
	 * 投票
	 */
	public static final int VOTE=0;
	/**
	 * 调研
	 */
	public static final int SURVEY=1;
	
	
	///////////标记删除  start
	/**
	 * 标记删除字段 已删除
	 */
	public static final int IS_DEL = 1;
	/**
	 * 标记删除字段 未删除
	 */
	public static final int NO_DEL = 0;
	///////////标记删除  end
	
	///////////域  start
	/**
	 * 标示商户域  默认ajy
	 */
	public static final String DOMAIN_DEFAULT = "ajy";
	///////////域  end
	
	
	///////////消息类型  start
	/**
	* 消息类型  单图文
	*/
	public static final int MESSAGE_TYPE_SINGLE = 1;
	/**
	* 消息类型  多图文
	*/
	public static final int MESSAGE_TYPE_MUL = 2;
	///////////消息类型  end
	
	///////////是否为草稿  start
	/**
	* 草稿消息
	*/
	public static final int MESSAGE_IS_DRAFT = 0;
	/**
	* 正式消息
	*/
	public static final int MESSAGE_NO_DRAFT = 1;
	///////////是否为草稿  end
	
	///////////封面是否显示在正文 start
	/**
	* 封面显示在正文
	*/
	public static final int COVER_SHOW_TEXT = 1;
	/**
	* 封面不显示在正文
	*/
	public static final int COVER_NOSHOW_TEXT = 0;
	///////////封面是否显示在正文   end
	/**
	 * 跳转到详情
	 */
	public static final int GOTO_TYPE_DETAIL = 0;
	/**
	 * 跳转到指定路径
	 */
	public static final int GOTO_TYPE_ASSIGN = 1;
}
