/**
 * project : openfire-connection-manager
 * user created : pippo
 * date created : 2010-11-8 - 下午02:01:21
 */
package com.longtime.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * @author pippo
 * @since 2010-11-8
 */
public class IAppServer implements ApplicationContextAware {

	/*private static Logger logger = LoggerFactory.getLogger(IAppServer.class);

	private static Server server = null;

	public void run() throws Exception {
		if (server != null) {
			return;
		}

		server = new Server();
		QueuedThreadPool boundedThreadPool = new QueuedThreadPool();
		logger.info("availableProcessors--{}", Runtime.getRuntime().availableProcessors());
		int pool_size = Math.max(4, Runtime.getRuntime().availableProcessors());
		boundedThreadPool.setMaxIdleTimeMs(pool_size);
		boundedThreadPool.setMaxThreads(pool_size * 2);
		server.setThreadPool(boundedThreadPool);

		Connector connector = new SelectChannelConnector();
		connector.setHost(this.host);
		connector.setPort(this.port);
		server.addConnector(connector);

		server.setStopAtShutdown(true);
		server.setSendServerVersion(true);
		String path = IAppServer.class.getResource("/webapp").getFile();
		if (logger.isDebugEnabled()) {
			logger.debug(String.format("start console server with context:[%s]", path));
		}
		
		WebAppContext context = new WebAppContext(path, StringUtils.isBlank(this.rootPath)?"/":this.rootPath);
		
		//不锁定静态文件
		//context.getInitParams().put("useFileMappedBuffer", "false");
		// 让嵌入式的web server共享全局的application context //
		context.setClassLoader(this.applicationContext.getClassLoader());
		context.setAttribute(ShareContextLoader.shared_context_name, this.applicationContext);

		server.setHandler(context);
		server.start();
	}

	public void stop() throws Exception {
		if (server != null) {
			server.stop();
			server = null;
		}
	}

	private ApplicationContext applicationContext;

	

	private int port;
	
	private String host;
	
	private String rootPath;

	public void setPort(int port) {
		this.port = port;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public void setRootPath(String rootPath) {
		this.rootPath = rootPath;
	}
	*/
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) {
		//this.applicationContext = applicationContext;
	}

}
