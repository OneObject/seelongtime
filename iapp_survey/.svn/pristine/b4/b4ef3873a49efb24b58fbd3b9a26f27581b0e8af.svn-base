package com.longtime.app.image.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.longtime.app.image.service.ImageService;
import com.longtime.app.image.service.impl.ImageServiceImpl;
import com.longtime.app.image.utils.CovertUtils;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.spring.SpringContextUtil;

public class UploadServlet extends HttpServlet {

	/*
	 * 参考qiniu
	 */
	/*
	 * @Override protected void doOptions(HttpServletRequest request,
	 * HttpServletResponse response) throws ServletException, IOException {
	 * super.doOptions(request, response);
	 * response.setHeader("Access-Control-Request-Headers",
	 * "x-requested-with,content-type");
	 * response.setHeader("Access-Control-Request-Method", "OPTIONS,HEAD,POST");
	 * response.setHeader("Access-Control-Allow-Origin", "*");
	 * response.setHeader("Access-Control-Max-Age", "2592000");
	 * response.setHeader("Cache-Control",
	 * "no-store, no-cache, must-revalidate"); response.setHeader("Connection",
	 * "keep-alive"); response.setHeader("Content-Type",
	 * "text/plain; charset=utf-8"); response.setHeader("Pragma", "no-cache");
	 * response.setHeader("Transfer-Encoding", "chunked");
	 * response.setHeader("X-Content-Type-Options", "nosniff");
	 * response.setHeader("X-Reqid", "42gAALy1srWkNLQT"); }
	 */

	private static final long serialVersionUID = -7549702169389840407L;

	private static Logger logger = LoggerFactory.getLogger(UploadServlet.class);

	public static ImageService imgService = SpringContextUtil.getBean(ImageServiceImpl.class);

	public static String PATH = "/resource/image";

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String tmp = config.getInitParameter("path");
		if (StringUtils.isNotBlank(tmp)) {
			PATH = tmp;
		}
	}

	/**
	 * 图片截取
	 */
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String basepath = req.getSession().getServletContext().getRealPath(PATH);;
		String imageId = req.getParameter("imageid");
		String action = req.getParameter("action");
		// crop 确定是否是截取
		if(!"crop".equals(action)){
			return;
		}
		
		if(logger.isDebugEnabled()){
			logger.debug("invoked doGet");
		}
		
		String x1 = req.getParameter("x1");
		String y1 = req.getParameter("y1");
		String w = req.getParameter("w");
		String h = req.getParameter("h");

		int position_x = Integer.parseInt(x1);
		int position_y = Integer.parseInt(y1);
		int width = Integer.parseInt(w);
		int height = Integer.parseInt(h);
		Gson gson = new Gson();
		Map<String, Object> map = null;
		String filepath = "";
		Map<String, Object> info = new HashMap<String, Object>();
		//判断image是否存在
		if (StringUtils.isNotBlank(imageId)) {
			map = this.imgService.getById(imageId);
			if (map != null && CollectionUtils.isNotEmpty(map.keySet())) {// 根据id查询，有记录
				//获取图片真实路径
				String fileid = (String) map.get("id");
				String suffix = (String) map.get("suffix");
				String[] infos = fileid.split("-");
				String path = basepath + "/%s/%s/%s-%s";
				if (infos.length == 3) {
					path = basepath + "/%s/%s/%s";
				}
				path = String.format(path, infos);
				filepath = String.format("%s.%s", path, suffix);
				if(logger.isDebugEnabled()){
					logger.debug("file real path: " + filepath);
				}
				// 进行图片截取处理
				CovertUtils.cover(filepath, filepath, position_x, position_y, width, height);
				info.put("name", map.get("realname"));
				info.put("state", "SUCCESS");
				info.put("w", width);
				info.put("h", height);
				info.put("url", fileid);
				info.put("hash", fileid);
				info.put("suffix", suffix);
				
			} else {
				info.put("state", "FAIL");
				info.put("msg", "imageid invalid");
			}
		}else{
			info.put("state", "FAIL");
			info.put("msg", "imageid can not be empty");
		}
		String result = gson.toJson(info);
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(result);
	}

	/**
	 * 图片上传
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String basepath = req.getSession().getServletContext().getRealPath(PATH);
		SimpleDateFormat formatpath = new SimpleDateFormat("/yyyy/MM");
		SimpleDateFormat formatFilename = new SimpleDateFormat("yyyy-MM");

		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setHeaderEncoding("UTF-8"); // 处理中文问题
		// sfu.setSizeMax(1024 * 1024); // 限制文件大小
		String result = "{\"flag\": \"fail\"}";
		Gson gson = new Gson();
		try {
			List<FileItem> fileItems = sfu.parseRequest(req); // 解码请求 得到所有表单元素
			List<FileItem> fils = new ArrayList<FileItem>();
			String token;
			String appid;
			// TODO
			for (FileItem fi : fileItems) {
				if (fi.isFormField()) { // 这个选项是 文字
					if ("token".equals(fi.getFieldName())) {
						token = fi.getString();
					} else if ("appid".equals(fi.getFieldName())) {
						appid = fi.getString();
					}
				} else {
					fils.add(fi);
				}
			}

			logger.debug("files num={}", fils.size());
			// TODO 验证appid 与token

			// 验证通过
			for (FileItem fi : fils) {
				Date date = new Date();
				String uuid = IdGenerator.nextId32().toString().toLowerCase();
				String path = String.format("%s/%s", basepath, formatpath.format(date));// 文件路径
				String realName = fi.getName();
				String suffix = realName.substring(realName.indexOf('.') + 1, realName.length());// 后缀
				String fileName = String.format("%s.%s", uuid, suffix);// 文件名称

				fi.setFieldName(fileName);
				logger.debug("文件名是：" + fileName); // 文件名
				File file = new File(path);
				if (!file.exists()) {
					file.mkdirs();
				}
				file = new File(file, fileName);
				fi.write(file);
				String fileid = String.format("%s-%s", formatFilename.format(date), uuid);// 保存数据库文件id

				// 保存数据库
				boolean flag = imgService.save(fileid, realName, suffix, date.getTime());
				Map<String, Object> map = new HashMap<String, Object>();
				if (flag) {
					BufferedImage srcImage = ImageIO.read(file);
					map.put("name", realName);
					map.put("state", "SUCCESS");
					map.put("w", srcImage.getWidth());
					map.put("h", srcImage.getHeight());
					map.put("url", fileid);
					map.put("hash", fileid);
					map.put("suffix", suffix);
				} else {
					map.put("state", "FAIL");
				}
				result = gson.toJson(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("upload due to fail", e);
		}
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(result);
	}

}