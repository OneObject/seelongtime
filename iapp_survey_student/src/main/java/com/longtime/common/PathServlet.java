/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-13 - 上午11:42:05
 */
package com.longtime.common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 * @since 2013-9-13
 * @author yangwk
 * 
 */
public class PathServlet extends HttpServlet{

	private static final long serialVersionUID = -5430682942565748910L;
	
	public static String PATH ;

	@Override
	public void init() throws ServletException {
		PATH = this.getServletContext().getRealPath("/");
	}
}
