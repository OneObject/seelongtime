package com.longtime.app.image.web;

import com.longtime.app.image.service.ImageService;
import com.longtime.app.image.utils.CovertUtils;
import com.longtime.common.spring.SpringContextUtil;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ImageServlet extends HttpServlet {

	private static final long serialVersionUID = -402751540257747537L;

	private static Logger logger = LoggerFactory.getLogger(ImageServlet.class);

	public static ImageService imgService = SpringContextUtil.getBean(ImageService.class);
	private static Pattern path_pattern = Pattern.compile("^/([\\w[\\-]]+)(\\??)(\\S*)");
	private static String result = "{\"error\":\"Document not found\"}";
	
	
	private static String PATH = UploadServlet.PATH;
	
	
	

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String tmp = config.getInitParameter("path");
		if(StringUtils.isNotBlank(tmp)){
			PATH = tmp;
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String basepath = req.getSession().getServletContext().getRealPath(PATH); 
		req.setCharacterEncoding("utf-8");
		String pathInfo = req.getPathInfo();
		int index = pathInfo.lastIndexOf(".");
		if(index != -1){//截取以.开始的后缀
			 pathInfo = pathInfo.substring(0, index);
		}
		Matcher matcher = path_pattern.matcher(pathInfo);
		boolean flag = false;
		Map<String, Object> map = null;
		String filepath = "";
		if (matcher.find()) {
			String id = matcher.group(1);
			if (StringUtils.isNotBlank(id)) {
				map = this.imgService.getById(id);
				if (map != null && CollectionUtils.isNotEmpty(map.keySet())) {// 根据id查询，有记录
					String fileid = (String) map.get("id");
					String suffix = (String) map.get("suffix");
					String[] infos = fileid.split("-");
					String path = PATH+"/%s/%s/%s-%s";
					if(infos.length == 3){
						path =  PATH+"/%s/%s/%s";
					}
					path = String.format(path,infos);
					
					filepath = String.format("%s.%s", path, suffix);
					flag = true;
				} else {// 没有记录
					String[] array = id.split("-");
					if (array.length == 4) {// 存在缩放 字符串 ,-100x200";
						String idprefix = id.substring(0, id.lastIndexOf("-"));
						String idsuffix = id.substring(id.lastIndexOf("-") + 1, id.length());
						String[] sizeinfo = idsuffix.split("x");
						if (sizeinfo.length == 2) {// 以x分割字符串，获取要图片要设置的宽高
							try {
								int width = Integer.parseInt(sizeinfo[0]);
								int height = Integer.parseInt(sizeinfo[1]);
								map = this.imgService.getById(idprefix);
								if (map != null && CollectionUtils.isNotEmpty(map.keySet())) {// 根据id(原始图片id，
																								// 即‘_’之前的字符串)查询，有记录,需要截取
									String fileid = (String) map.get("id");
									String suffix = (String) map.get("suffix");

									String[] infos = fileid.split("-");
									String realpath = String.format("%s/%s/%s", infos);
									realpath = String.format("%s/%s.%s", basepath, realpath, suffix);// 原始图片路径

									String targetPath = String.format("%s/%s/%s", idprefix.split("-"));
									targetPath = String.format("%s/%s-%s.%s", basepath, targetPath, idsuffix, suffix);// 转换后图片路径

									// 进行图片截取处理
									CovertUtils.cover(realpath, targetPath, width, height);

									if((new File(targetPath)).isFile()){
									    // 保存处理后，图片的信息
									    this.imgService.save(id, id + "." + suffix, suffix, System.currentTimeMillis());

	                                    filepath = String.format(PATH+"/%s/%s/%s", idprefix.split("-"));
	                                    filepath = String.format("%s-%s.%s", filepath, idsuffix, suffix);
	                                    flag = true;
									}
								}
							} catch (NumberFormatException e) {

							}
						}
						
						if(StringUtils.isBlank(filepath)){
						
						    // 非标准的 -100x100 格式  或者没有生成
						    map = this.imgService.getById(idprefix);
						    if (map != null && CollectionUtils.isNotEmpty(map.keySet())) {// 根据id查询，有记录
			                    String fileid = (String) map.get("id");
			                    String suffix = (String) map.get("suffix");
			                    String[] infos = fileid.split("-");
			                    String path = PATH+"/%s/%s/%s-%s";
			                    if(infos.length == 3){
			                        path =  PATH+"/%s/%s/%s";
			                    }
			                    path = String.format(path,infos);
			                    
			                    filepath = String.format("%s.%s", path, suffix);
			                    flag = true;
						    }
			                
						}   
					}
				}
			}
		}
		if (flag) {
			req.getRequestDispatcher("/"+filepath).forward(req, resp);
		} else {
			logger.debug(result);
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.write(result);
		}
	}

	public static void main(String[] args) {
		// String path="/image/xxx.jpg?afa=ab&b=c";
		// String
		// path="/image/014-12-dd63f97cbb61480d83b4f4269fbf640b-320x180?v=sdf";
		String path = "/image/014-12-dd63f97cbb61480d83b4f4269fbf640b-320x180";
		Pattern path_pattern = Pattern.compile("^/image/([\\w[\\-]]+)(\\??)(\\S*)");
		Matcher matcher = path_pattern.matcher(path);

		if (matcher.find()) {

			System.out.println(matcher.group(0));
			System.out.println(matcher.group(1));
			System.out.println(matcher.group(2));
		}

	}

}
