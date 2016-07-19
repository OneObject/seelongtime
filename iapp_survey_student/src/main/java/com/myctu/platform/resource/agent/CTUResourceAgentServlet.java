/* Copyright © 2010 www.myctu.cn. All rights reserved. */
/**
 * project : resource-agent
 * user created : pippo
 * date created : 2012-8-28 - 下午12:25:51
 */
package com.myctu.platform.resource.agent;

import com.myctu.platform.resource.agent.signature.ResourceSignatureProcessor;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @since 2012-8-28
 * @author pippo
 */
public class CTUResourceAgentServlet extends HttpServlet {

	private static final long serialVersionUID = 5616119765298645795L;

	private static final Logger logger = LoggerFactory.getLogger(CTUResourceAgentServlet.class);

	protected static final String RESOURCE_PROXY = "resource_proxy";

	protected static final String DOMAIN = "domain";

	protected static final String EXPIRE = "expire";

	protected static final String USER = "user";

	protected static final String RESOURCE_ID = "resource_id";

	protected static final String PLAYER = "player";

	/* http://host:port/resopurce_proxy */
	private String resource_proxy;

	private String domain;

	private long expire;

	@Override
	public void init(ServletConfig config) throws ServletException {
		//Jersey uses java.util.logging - bridge to slf4
		/*java.util.logging.Logger rootLogger = LogManager.getLogManager().getLogger("");
		Handler[] handlers = rootLogger.getHandlers();
		for (int i = 0; i < handlers.length; i++) {
			rootLogger.removeHandler(handlers[i]);
		}
		SLF4JBridgeHandler.install();*/
		/************************************************************************/
		super.init(config);
		/************************************************************************/
		resource_proxy = config.getInitParameter(RESOURCE_PROXY);
		domain = config.getInitParameter(DOMAIN);
		expire = NumberUtils.toLong(config.getInitParameter(EXPIRE), 1000 * 60 * 60 * 24);

		logger.info("the init parameters is:[download_url={},domain={},expire={}]", new Object[] { resource_proxy,
				domain,
				expire });
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String domain = StringUtils.defaultIfBlank(req.getParameter(DOMAIN), this.domain);
		Long expire = NumberUtils.toLong(req.getParameter(EXPIRE), this.expire);
		String user = req.getParameter(USER);
		String resource_id = req.getParameter(RESOURCE_ID);

		ResourceSignatureProcessor processor = new ResourceSignatureProcessor(domain, user);
		processor.setExpire(System.currentTimeMillis() + expire);
		processor.setResource_id(resource_id);
		processor.sign();

		Validate.isTrue(processor.isValid(),
			String.format("invalid file signature,the error is:[%s]", processor.getError()));

		String resource_download = this.genURI(req, processor);
		logger.debug("the resource:[user={},resource_id={}] browse uri is:[{}]", new Object[] { user,
				resource_id,
				resource_download });

		resp.sendRedirect(resource_download);
	}

	private static final String URI_TYPE = "uri_type";

	private static final String INDEX = "index";

	private static final String DEFAULT_PLAYER = "simple";

	private static final String DOWNLOAD_PATTERN = "%s/service/download/%s/%s?type=%s&domain=%s";

	private static final String PLAYER_PATTERN = "%s/service/sites/%s/%s?type=%s&domain=%s&is_trace=%s&index=%s";

	private static final String IS_TRACE = "is_trace";

	private static final String DEFAULT_RECORD = "true";
	

	private String genURI(HttpServletRequest req, ResourceSignatureProcessor processor) {
		String uri_type = req.getParameter(URI_TYPE);
		String is_trace = StringUtils.defaultIfBlank(req.getParameter(IS_TRACE), DEFAULT_RECORD);
		String player_type = StringUtils.defaultIfBlank(req.getParameter(PLAYER), DEFAULT_PLAYER);
		
		
		if ("download".equalsIgnoreCase(uri_type)) {
			return String.format(DOWNLOAD_PATTERN,
				resource_proxy,
				processor.getUser(),
				processor.getSignature(),
				player_type,
				processor.getDomain());
		} else {
			String index = req.getParameter(INDEX);
			return String.format(PLAYER_PATTERN,
				resource_proxy,
				processor.getUser(),
				processor.getSignature(),
				player_type,
				processor.getDomain(),
				is_trace,
				index != null ? index : StringUtils.EMPTY);
		}
	}
	
}
