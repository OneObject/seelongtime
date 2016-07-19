package com.longtime.app.ixin.mgr.fodder.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.fodder.model.FodderEntity;
import com.longtime.app.ixin.mgr.fodder.model.SourceFileEntity;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.protocol.ItemArticle;

public interface FodderDao {

	/**
	 * 
	 * @param file
	 */
	void saveSourceFile(SourceFileEntity file)throws Exception;

	void delSourceFile(String id);

	void saveOrUpdateFodderDraft(FodderVO vo,boolean isSave)throws Exception;

	boolean checkExist(String baseId);

	void delFodderDraft(String id);

	void updateFodder(FodderVO vo)throws Exception;

	void saveFodder(FodderVO vo)throws Exception;

	int getFodderTotalSize(String domain);
	
	int getTitalSizeWithSearch(String domain,String searchcontent);

	List<FodderVO> getFodderByPage(int pageSize, int currPage, String domain,
			String qiniuImageBasePath, String coverSuffix);
	
	List<FodderVO> getFodderByPageWithSerch(int pageSize, int currPage, String domain,String searchcontent);

	FodderVO getFodderVOById(String id);

	void del(String id);

	int getFodderDraffTotalSize(String domain);
	

	List<FodderVO> getFodderDraffByPage(int pageSize, int currPage,
			String domain);
	
	int getFodderTotalSize(String domain,String param);
	
	List<FodderEntity> fodderList(int pagesize,int currentpage,String domain,String param);

	/**
	 * 草稿下详情
	 * @param id
	 * @return
	 */
	FodderVO getFodderVOByDraffId(String id);

	void saveColumnInfo(String columnType, String fodderId, String domain);

	ItemArticle getItemArticleById(String id, String qiniuImageBasePath,
			String coverSuffix, String fodderBasePath);

	/**
	 * 查询关注回复记录
	 * @param currentDomain
	 * @return
	 */
	String queryAttRespByDomain(String currentDomain);

	/**
	 * 添加关注回复消息
	 * @param content
	 * @param type
	 * @param currentDomain
	 * @param attId
	 */
	void saveAttResp(String content, String type, String currentDomain,
			String attId);

	/**
	 * 修改关注回复消息
	 * @param content
	 * @param type
	 * @param currentDomain
	 * @param attId
	 */
	void updateAttResp(String content, String type, String currentDomain,
			String attId);

	/**
	 * 根据租户信息获取消息内容
	 * @param currentDomain
	 * @return
	 */
	FodderVO getFodderVOResp(String currentDomain);

	/**
	 * 删除关注回复消息
	 * @param attId
	 */
	void delAttResp(String attId);

	List<FodderEntity> list(String[] ids);

	

}
