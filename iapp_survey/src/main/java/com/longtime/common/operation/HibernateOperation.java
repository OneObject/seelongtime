/**
 * project : repository-engine
 * user created : songsp
 * date created : 2012-8-10 - 下午1:35:50
 */
package com.longtime.common.operation;
import org.hibernate.Session;

import com.longtime.common.RepositoryUnexpectedException;
/**
 * @since 2012-8-10
 * @author songsp
 */
public interface HibernateOperation<R> {

	R execute(Session session) throws RepositoryUnexpectedException;

}
