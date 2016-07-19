package com.longtime.app.base.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.longtime.app.base.dao.AuthorizeDao;
import com.longtime.app.base.model.Authorize;
import com.longtime.app.base.model.BaseGroupRelation;
import com.longtime.app.base.service.AuthorizeService;
import com.longtime.app.base.service.GroupRelationService;
import com.longtime.app.base.service.UserLinkJobLevelService;
import com.longtime.app.base.service.UserService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("authorizeService")
public class AuthorizeServiceImpl extends BaseService4HImpl<Authorize, String> implements AuthorizeService{
    
    @Resource
    private AuthorizeDao authorizeDao;
    
    @Resource
    private GroupRelationService groupRelationService;
    
    @Resource
    private UserService userService;
    
    @Resource
    private UserLinkJobLevelService userLinkJobLevelService;

    @Resource
    private NamedParameterJdbcTemplate jdbcTemplate;
    
    @Override
    public BaseDAO<Authorize, String> getDAO() {
        return authorizeDao;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<String> getSids(int rcategory, String rid, int scategory) {
        StringBuffer sb = new StringBuffer("select a.sid from iapp_base_authorize a where a.rcategory = '"+rcategory+"' and a.rid = '"+rid+"' ");
        
        if(scategory != -1){
            sb.append(" and a.scategory = '"+scategory+"'");
        }
        
        return jdbcTemplate.queryForList(sb.toString(), MapUtils.EMPTY_MAP, String.class);
    }

    @Override
    public boolean deleteGroup(int rcategory, String rid, int scategory) {
        String hql = "delete from Authorize auth where auth.rcategory = ? and auth.rid = ? and auth.scategory = ? ";
        this.authorizeDao.execute(hql, new Object[]{rcategory, rid, scategory});
        
        return true;
    }

	@Override
	public boolean checkAuth(String rid, String uid, int rcategory,String domain) {
		String sql = "select count(*) as count from v_authorize where rid=:rid and uid=:uid and rcategory=:rcategory and domain=:domain ";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("rid", rid);
		param.put("uid", uid);
		param.put("rcategory", rcategory);
		param.put("domain", domain);
		
		long count = this.jdbcTemplate.queryForLong(sql, param);
		if(count>0){
			return true;
		}
		return false;
	}
    
	@Override
	public Set<String> listAuthUids(String rid,String domain) {
		String hql = "from Authorize where rid=? and domain=? ";
		List<Authorize> auths = authorizeDao.list(hql, rid,domain);
		if(CollectionUtils.isEmpty(auths)){
			return Sets.newHashSet();
		}
		
		Set<String> uSet = Sets.newHashSet();
		Set<String> oSet = Sets.newHashSet();
		Set<String> jobSet = Sets.newHashSet();
		List<String> ugList = Lists.newArrayList();
		//从授权表内获取该资源的授权对象：用户、组织、职级、用户组
		for(Authorize auth : auths){
			if(Authorize.S_CATEGORY_USER == auth.getScategory()){
				uSet.add(auth.getSid());
			} else if(Authorize.S_CATEGORY_ORG == auth.getScategory()){
				oSet.add(auth.getSid());
			} else if(Authorize.S_CATEGORY_JOBLEVEL == auth.getScategory()){
				jobSet.add(auth.getSid());
			} else if(Authorize.S_CATEGORY_GROUP == auth.getScategory()){
				ugList.add(auth.getSid());
			}
		}
		
		//根据用户组获取用户组内关联的用户、组织、职级
		List<BaseGroupRelation> groupRelations = groupRelationService.getGroupRelations(ugList,domain); 
		for(BaseGroupRelation groupRelation : groupRelations){
			if(BaseGroupRelation.USER_TYPE == groupRelation.getType()){
				uSet.add(groupRelation.getRid());
			} else if(BaseGroupRelation.ORG_TYPE == groupRelation.getType()){
				oSet.add(groupRelation.getRid());
			}  else if(BaseGroupRelation.JOBLEVEL_TYPE == groupRelation.getType()){
				jobSet.add(groupRelation.getRid());
			}  else if(BaseGroupRelation.RULE_TYPE == groupRelation.getType()){
				//暂不支持
			} 
		}
		
		//根据组织获取用户
		if(CollectionUtils.isNotEmpty(oSet)){
			List<String> uids = userService.getByOids(oSet);
			uSet.addAll(uids);
		}
		
		//根据职级获取用户
		if(CollectionUtils.isNotEmpty(jobSet)){
			List<String> uids = userLinkJobLevelService.getByJobIds(jobSet);
			uSet.addAll(uids);
		}
		
		return uSet;
	}
    
}
