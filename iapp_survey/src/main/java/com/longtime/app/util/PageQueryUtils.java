/**
 * project : repository-server
 * user created : songsp
 * date created : 2012-6-21 - 下午12:55:03
 */
package com.longtime.app.util;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.Validate;
import org.springframework.data.mongodb.core.query.Query;

import com.myctu.platform.repository.engine.domain.Entity;
import com.myctu.platform.repository.engine.domain.query.ExtQuery;
import com.myctu.platform.repository.engine.domain.query.Page;
import com.myctu.platform.repository.engine.domain.query.ResultSet;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

/**
 * @since 2012-6-21
 * @author songsp
 */
public class PageQueryUtils {

	public static <T extends Entity<ID>, ID extends Serializable> ResultSet<T> listByPage(Map<String, Object> query,
			Page page,
			MongoRepository<T, ID> mongoRepository) {

		Validate.notNull(mongoRepository, "mongoRepository argument is  null!");

		if (null == query) {
			/*ResultSet<T> rs = new ResultSet<T>();
			List<T> list = Collections.emptyList();
			rs.setItems(list);
			rs.setPage(new Page());*/
			return ResultSet.emptyResultSet();
		}
		if (page == null) {
			page = new Page();
		}

		Query q = ExtQuery.valueOf(query);
		q.skip((int) page.getStart());
		q.limit((int) page.getLimit());
		List<T> list = mongoRepository.find(q);
		long totalSize = mongoRepository.count(q);
		page.setTotal_size(totalSize);
		ResultSet<T> rs = new ResultSet<T>();
		rs.setItems(list);
		rs.setPage(page);
		return rs;

	}

}
