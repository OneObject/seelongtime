package com.longtime.ajy.mweb.service;

import java.util.List;

import com.longtime.ajy.model.LabelEntity;
import com.longtime.common.service.IService;


public interface LabelService extends IService<LabelEntity, String>{

	/**
	 * 保存标签，同时更新标签关联的内容
	 * @author yangwenkui
	 * @time 2016年6月20日 下午11:18:19
	 * @param labels 标签，多个标签用英文逗号隔开
	 * @param rid 标签关联对象id
	 * @param domain 域
	 * @param creator 创建者
	 */
	void doSave(String labels, String rid,int rtype, String domain, String creator);

	/**
	 * 根据标签获取标签关联的内容
	 * @author yangwenkui
	 * @time 2016年6月30日 下午9:31:00
	 * @param labels
	 * @param domainId 
	 * @return
	 */
	List<String> getRids(String labels,int rtype, String domainId);

	/**
	 * @author yangwenkui
	 * @time 2016年6月30日 下午10:38:45
	 * @param labels
	 * @param id
	 * @param domain
	 * @return
	 */
	boolean isFromLabel(String labels, String id, String domain);
	
}
