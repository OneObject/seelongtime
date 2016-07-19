package com.longtime.app.ixin.mgr.fodder.service;

import java.util.List;
import java.util.Map;

import com.longtime.app.ixin.mgr.fodder.model.FodderEntity;
import com.longtime.app.ixin.mgr.fodder.model.SourceFileEntity;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.protocol.ReplyMessage;

public interface FodderService {

	Map<String, String> getRequiredParams();

	/**
	 * 保存文件
	 * 
	 * @param file
	 */
	String saveSourceFile(SourceFileEntity file, String domain);

	/**
	 * 根据ID删除文件
	 * 
	 * @param id
	 */
	void delSourceFile(String id);

	/**
	 * 保存
	 * 
	 * @param vo
	 */
	void saveOrUpdateFodderDraft(FodderVO vo, boolean isSave);

	/**
	 * 查询正式数据是否存在
	 * 
	 * @param baseId
	 * @return
	 */
	boolean checkExist(String baseId);

	/**
	 * 删除草稿箱中对应记录
	 * 
	 * @param id
	 */
	void delFodderDraft(String id);

	/**
	 * 修改正式数据
	 * 
	 * @param vo
	 */
	void updateFodder(FodderVO vo);

	/**
	 * 保存正式数据
	 * 
	 * @param vo
	 */
	void saveFodder(FodderVO vo);

	/**
	 * 得到正式数据的总条数
	 * @param currentDomain
	 * @return
	 */
	int getFodderTotalSize(String currentDomain);

	/**
	 * 得到带查询条件的总的数据条数
	 */
	int getTitalSizeWithSearch(String domain,String searchcontent);
	
	/**
	 * 分页查询正式数据
	 * 
	 */
	List<FodderVO> getFodderByPage(int pageSize, int currPage, String domain);
	
	List<FodderVO> getFodderByPageWithSerch(int pageSize, int currPage, String domain,String searchecontent);

	/**
	 * 根据Id查询素材信息
	 * 
	 * @param id
	 * @return
	 */
	FodderVO getFodderVOById(String id);

	/**
	 * 删除素材，标记删除
	 * 
	 * @param id
	 */
	void del(String id);

	/**
	 * 得到草稿中的记录总数
	 * 
	 * @param domain
	 * @return
	 */
	int getFodderDraffTotalSize(String domain);

	/**
	 * 分页获取草稿中的记录
	 * 
	 * @param pageSize
	 * @param currPage
	 * @param domain
	 * @return
	 */
	List<FodderVO> getFodderDraffByPage(int pageSize, int currPage,
			String domain);

	/**
	 * 草稿详情
	 * 
	 * @param id
	 * @return
	 */
	FodderVO getFodderVOByDraffId(String id);

	/**
	 * 保存栏目信息
	 * 
	 * @param columnType
	 * @param baseId
	 * @param domain
	 */
	void saveColumnInfo(String columnType, String baseId, String domain);

	/**
	 * 根据图文素材ID列表获得返回信息
	 * 
	 * @param asList
	 * @param domain
	 * @return
	 */
	public ReplyMessage getReplyByIds(List<String> ids, String domain);

	/**
	 * 保存关注回复信息
	 * 
	 * @param content
	 * @param type
	 * @param currentDomain
	 */
	void saveAttResp(String content, String type, String currentDomain);

	/**
	 * 根据租户域获取回复消息信息
	 * 
	 * @param currentDomain
	 * @return
	 */
	FodderVO getFodderVOResp(String currentDomain);

	/**
	 * 删除关注回复消息
	 * 
	 * @param attId
	 */
	void delAttResp(String attId);

	List<FodderEntity> list(String[] ids);

	int getFodderTotalSize(String domain, String param);

	List<FodderEntity> fodderList(int pagesize, int currentpage, String domain,
			String param);

}
