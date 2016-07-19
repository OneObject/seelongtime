package com.longtime.app.image.web;

import org.apache.commons.lang3.math.NumberUtils;
import com.longtime.app.image.model.ImageModel;
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

public class ImageServlet2 extends HttpServlet {

	private static final long serialVersionUID = -402751540257747537L;

	private static Logger logger = LoggerFactory.getLogger(ImageServlet2.class);

	public static ImageService imgService = SpringContextUtil.getBean(ImageService.class);
	private static String result = "{\"error\":\"Document not found\"}";
	
	
	private static String IMG_STROAGE_RELATION_DIR = UploadServlet.PATH;
	
	
	

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String path = config.getInitParameter("path");
		if(StringUtils.isNotBlank(path)){
			IMG_STROAGE_RELATION_DIR = path;
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String absoluteImgDir = getImgeAbsoluteDir(req); 
		
		boolean imgExist = true;
		String urlPathInfo = req.getPathInfo();
		ImgeInfo imgInfo = formatImgeInfo(urlPathInfo);
		
		logger.debug("imginfo=[{}]", imgInfo);
		
		String imgPath = null;
		
		if(!imgInfo.isSpecial()){
		    String originalImgId = imgInfo.getOriginalImgId();
		    
		    ImageModel coverImgModel = imgService.get(imgInfo.getCoverImgId());
		    logger.debug("cover imgmodel=[{}]", coverImgModel);
		    
		    if(coverImgModel!=null){
		        imgInfo.extension =coverImgModel.getSuffix();
		    }else{
		        ImageModel imageModel = imgService.get(originalImgId);
		        logger.debug("original imgmodel=[{}]", imageModel);
    		    if(null!=imageModel){
    		        imgInfo.extension =imageModel.getSuffix();
    		        
    		        if(!imgInfo.isOriginalImg()){
    		            // 获取cover信息
    		            
    		            if(null==coverImgModel){
    		              //图片处理
    	                    String originalImgPath = imgInfo.getOriginalImgPath();
    	                    String coverImgPath = imgInfo.getRelationPath();
    	                    logger.error("cover img.original=[{}] target=[{}]", originalImgPath,coverImgPath);
    	                    // 进行图片截取处理
    	                    CovertUtils.cover(genAbsolutePath(absoluteImgDir,originalImgPath), genAbsolutePath(absoluteImgDir,coverImgPath), imgInfo.cover_width, imgInfo.cover_heigth);
    	                    if((new File(genAbsolutePath(absoluteImgDir,coverImgPath))).isFile()){
    	                        // 保存处理后，图片的信息
    	                        this.imgService.save(imgInfo.getCoverImgId(), imgInfo.getCoverImgId() + "." + imgInfo.extension, imgInfo.extension, System.currentTimeMillis());
    
    	                    }else{
    	                        logger.debug("img cover creat due to fail. ");
    	                        imgInfo.setCover(null);
    	                        
    	                    }
    		            }
    		            
    		            
    		        }
    		    
    		    }else{
    		        
    		        imgExist = false;// 图片不存在
    		    }
		    }
		    
		}
		
		if(!imgExist){
		    logger.debug(result);
            req.setCharacterEncoding("utf-8");
            resp.setContentType("text/html;charset=utf-8");
            PrintWriter out = resp.getWriter();
            out.write(result);
            return;
		    
		}
		
		imgPath = imgInfo.getRelationPath();
		logger.debug("finish show img path[{}/{}]", IMG_STROAGE_RELATION_DIR,imgPath);
		
		req.getRequestDispatcher(String.format("%s/%s", IMG_STROAGE_RELATION_DIR,imgPath)).forward(req, resp);
		
	}

    private String getImgeAbsoluteDir(HttpServletRequest req) {
        String basepath = req.getSession().getServletContext().getRealPath(IMG_STROAGE_RELATION_DIR);
        return basepath;
    }
    
   
    
    private String genAbsolutePath(String absoluteDir,String releationPath){
        
        return String.format("%s/%s", absoluteDir,releationPath);
    }
    
    
    private static Pattern img_path_pattern = Pattern.compile("^/([\\d]{4})-([\\d]{2})-([\\w]+)(-([\\w]+))?");
    
    private ImgeInfo formatImgeInfo(String  urlPathInfo){
        
        
        Matcher matcher = img_path_pattern.matcher(urlPathInfo);
        ImgeInfo imgeInfo = new ImgeInfo();
        if (matcher.find()) {
            imgeInfo.year = matcher.group(1);
            imgeInfo.month = matcher.group(2);
            imgeInfo.uuid = matcher.group(3);
            imgeInfo.setCover( matcher.group(5));
        }else{
            imgeInfo.special_path = urlPathInfo.substring(1);
        }
        
        return imgeInfo;
        
    }
    
    
    class ImgeInfo{
        
        String year;
        String month;
        String uuid;
        String extension;
        private String cover;
        private int cover_width;
        private int cover_heigth;
        String special_path;
        
        
        public void setCover(String cover){
            if(StringUtils.isBlank(cover)){
                this.cover = null;
                return;
            }
            if("portalCover".equals(cover)){
                cover = "360x200";
            }
            String[] a =  cover.split("x");
            
            if(a==null||a.length!=2){
                this.cover = null;
                return;
            }
            
            String width = a[0];
            String heigth = a[1];
            if(NumberUtils.isNumber(width) && NumberUtils.isNumber(heigth)){
                this.cover = cover;
                this.cover_heigth = NumberUtils.toInt(heigth);
                this.cover_width = NumberUtils.toInt(width);
                
            }else{
                this.cover = null;
            }
            
        }
        
        public boolean isSpecial(){
            return StringUtils.isNotBlank(special_path);
        }
        
        public boolean isOriginalImg(){
            return StringUtils.isBlank(cover);
        }
        public String getRelationPath(){
            if(isSpecial()){
                return this.special_path;
            }
            
            return String.format("%s/%s/%s%s%s", year,month,uuid,StringUtils.isNotBlank(cover)?"-"+cover:"",StringUtils.isNotBlank(extension)?"."+extension:"");
            
        }
        
        public String getOriginalImgPath(){
            if(isSpecial()){
                return this.special_path;
            }
            
            return String.format("%s/%s/%s%s", year,month,uuid,StringUtils.isNotBlank(extension)?"."+extension:"");
     
        }
        
        public String getOriginalImgId(){
            return String.format("%s-%s-%s", year,month,uuid);
        }
        
        public String getCoverImgId(){
            return String.format("%s-%s-%s%s", year,month,uuid,StringUtils.isNotBlank(cover)?"-"+cover:"");
            
        }

        @Override
        public String toString() {
            return String.format("ImgeInfo [year=%s, month=%s, uuid=%s, extension=%s, cover=%s, cover_width=%s, cover_heigth=%s, special_path=%s]",
                                 year, month, uuid, extension, cover, cover_width, cover_heigth, special_path);
        }
        
        
        
    }
    
    
    

	public static void main(String[] args) {
		// String path="/image/xxx.jpg?afa=ab&b=c";
		// String
		// path="/image/014-12-dd63f97cbb61480d83b4f4269fbf640b-320x180?v=sdf";
		String path = "/2014-12-dd63f97cbb61480d83b4f4269fbf640b-320x180";
		Matcher matcher = img_path_pattern.matcher(path);

		if (matcher.find()) {

			System.out.println(matcher.group(0));
			System.out.println(matcher.group(1));
			System.out.println(matcher.group(2));
		}

	}

}
