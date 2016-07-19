package com.longtime.common.web;


import org.apache.commons.lang3.StringUtils;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;
import javax.imageio.ImageIO;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.util.Config;

/**
 * This servlet uses the settings passed into it via the Producer api.
 * 
 * @author testvoogd@hotmail.com
 * @author jon
 * @author cliffano
 */
@SuppressWarnings("serial")
public class KaptchaExtServlet extends HttpServlet implements Servlet {
	private Properties props = new Properties();

	private Producer kaptchaProducer = null;

	private String sessionKeyValue = null;

	private String sessionKeyDateValue = null;

	@Override
	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);

		// Switch off disk based caching.
		ImageIO.setUseCache(false);

		Enumeration<?> initParams = conf.getInitParameterNames();
		while (initParams.hasMoreElements()) {
			String key = (String) initParams.nextElement();
			String value = conf.getInitParameter(key);
			this.props.put(key, value);
		}

		Config config = new Config(this.props);
		this.kaptchaProducer = config.getProducerImpl();
		this.sessionKeyValue = config.getSessionKey();
		this.sessionKeyDateValue = config.getSessionDate();
	}

	/** */
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

		// Set to expire far in the past.
		response.setDateHeader("Expires", 0);
		// Set standard HTTP/1.1 no-cache headers.
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		// Set IE extended HTTP/1.1 no-cache headers (use addHeader).
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		// Set standard HTTP/1.0 no-cache header.
		response.setHeader("Pragma", "no-cache");

		// return a jpeg
		response.setContentType("image/jpeg");

		// create the text for the image
		String capText = this.kaptchaProducer.createText();

		// create the image with the text
		BufferedImage bi = this.kaptchaProducer.createImage(capText);

		ServletOutputStream out = response.getOutputStream();

		// write the data out
		ImageIO.write(bi, "jpg", out);

		// fixes issue #69: set the attributes after we write the image in case the image writing fails.

		// store the text in the session
		req.getSession().setAttribute(this.sessionKeyValue, capText);

		// store the date in the session so that it can be compared
		// against to make sure someone hasn't taken too long to enter
		// their kaptcha
		req.getSession().setAttribute(this.sessionKeyDateValue, new Date());

		CaptchaObj captcha = new CaptchaObj();
		captcha.setValue(capText);
		captcha.setCreateTime(System.currentTimeMillis());
		simpleCaptchaStorage.saveCaptcha(captcha, req);
	}

	private static final String  VALIDATE_RS_Format = "{\"rs\":%s}";
	//验证
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		
		boolean rs = false;
		String input = req.getParameter("input");
		
		rs = CaptchaValidator.validate(input, req);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		java.io.PrintWriter pw = null;
		try {
			pw = response.getWriter();
			pw.write(String.format(VALIDATE_RS_Format, rs));
		} catch (Exception e) {
			pw.write(String.format(VALIDATE_RS_Format, rs));
		} finally {
			pw.close();
		}

	}

	static class CaptchaObj {
		String value;
		long createTime;

		public String getValue() {
			return value;
		}

		public void setValue(String value) {
			this.value = value;
		}

		public long getCreateTime() {
			return createTime;
		}

		public void setCreateTime(long createTime) {
			this.createTime = createTime;
		}

	}

	static interface CaptchaStorage {
		static int  expire = 600000; // 10min
		void saveCaptcha(CaptchaObj captcha, HttpServletRequest req);

		CaptchaObj get(HttpServletRequest req);
	}

	public static CaptchaStorage simpleCaptchaStorage = new CaptchaStorage() {
		private static final String KEY = "s_captcha_k";

		@Override
		public void saveCaptcha(CaptchaObj captcha, HttpServletRequest req) {
			req.getSession(true).setAttribute(KEY, captcha);
		}

		@Override
		public CaptchaObj get(HttpServletRequest req) {
			return (CaptchaObj) req.getSession(true).getAttribute(KEY);
		}

	};
	
	
	public static class CaptchaValidator{
		public static boolean validate(String input ,HttpServletRequest req){
			boolean rs = false;
			if(StringUtils.isNotBlank(input)){
				CaptchaObj captcha =  simpleCaptchaStorage.get(req);
				if(null!=captcha && StringUtils.isNotBlank(captcha.getValue())){
					rs = StringUtils.equalsIgnoreCase(input, captcha.getValue()) && (System.currentTimeMillis()-captcha.getCreateTime()<=CaptchaStorage.expire);
				}
			}
			
			return rs;
		}
	}

}
