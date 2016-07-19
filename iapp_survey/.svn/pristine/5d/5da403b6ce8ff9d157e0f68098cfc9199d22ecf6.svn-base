package com.longtime.app.track.repository.impl;

import com.google.common.collect.Lists;
import com.longtime.app.track.model.UserTrackEntity;
import com.longtime.app.track.repository.UserTraceDao;
import com.longtime.common.dao.BaseDAOImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserTrackDaoImpl extends BaseDAOImpl<UserTrackEntity, String> implements UserTraceDao {

    @Override
    public long countPV(long dayStart, long dayEnd, String rid, String model, String domain) {
        return count(dayStart,dayEnd,rid,model,domain,false);
    }

    @Override
    public long countUV(long dayStart, long dayEnd, String rid, String model, String domain) {
        return count(dayStart,dayEnd,rid,model,domain,true);
    }


    private long count(long dayStart, long dayEnd, String rid, String model, String domain, boolean distinctUid) {
        StringBuilder hql = new StringBuilder(" from UserTrackEntity t where  domain=? and time>=? and time<=?  ");

        List<Object> param = Lists.newArrayList();
        param.add(domain);
        param.add(dayStart);
        param.add(dayEnd);

        if (StringUtils.isNotBlank(model)) {
            hql.append(" and model=?");
            param.add(model);
        }
        if (StringUtils.isNotBlank(rid)) {
            hql.append(" and rid=?");
            param.add(rid);
        }

        String count_hql = String.format("select count(%s) %s", distinctUid ? "distinct uid" : "id", hql.toString());

        Long count = this.query(count_hql, param.toArray());

        return null == count ? 0L : count;
    }
}
