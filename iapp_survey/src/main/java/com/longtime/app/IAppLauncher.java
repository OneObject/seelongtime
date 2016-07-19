/**
 * project : repository
 * user created : pippo
 * date created : 2011-11-15 - 下午3:45:04
 */
package com.longtime.app;


/**
 * @since 2011-11-15
 * @author pippo
 */
public class IAppLauncher {

	/*private static ClassPathXmlApplicationContext context;

	public static void main(String[] args) throws Exception {
		AppSettings.init("/com.longtime.properties");
		createApplicationContext();

		IAppServer server = new IAppServer();
		server.setApplicationContext(context);
		server.setHost(AppSettings.getInstance().get("com.longtime.host"));
		server.setPort(AppSettings.getInstance().getInt("com.longtime.port"));
		server.setRootPath(AppSettings.getInstance().get("com.longtime.root.path"));
		server.run();

	}

	private static void createApplicationContext() {
		context = new ClassPathXmlApplicationContext("/com.longtime.context.xml");
		context.registerShutdownHook();
		context.start();
		BeanLocator.setApplicationContext(context);
	}
*/
}
