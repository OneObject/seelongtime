package com.longtime.app.image.utils;

import com.longtime.app.image.web.ImageServlet;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import javax.imageio.ImageIO;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.Thumbnails.Builder;
import net.coobird.thumbnailator.geometry.Positions;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CovertUtils {

	private static Logger logger = LoggerFactory.getLogger(ImageServlet.class);

	/**
	 * 
	 * @param sourceFile
	 *            源图片文件
	 * @param targetFile
	 *            目标图片文件
	 * @param targetWidth
	 *            目标图片文件宽
	 * @param targetHeight
	 *            目标图片文件 高
	 * @throws IOException
	 * @throws MagickException
	 */
	public static void cover(String sourceFile, String targetFile, int targetWidth, int targetHeight) {
		// 获取源文件的宽高
		File fromFile = new File(sourceFile);
		if (!fromFile.exists()) {// 目标文件不存在
			return;
		}
		BufferedImage srcImage = null;
		int s_height = 0;
		int s_width = 0;
		try {
			srcImage = ImageIO.read(fromFile);
			s_height = srcImage.getHeight();
			s_width = srcImage.getWidth();
			logger.debug(s_height + "");
			logger.debug(s_width + "");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		// 判断是否需要压缩
		if (  targetWidth != s_width || targetHeight != s_height) {// 需要压缩
			BigDecimal n = new BigDecimal(s_height).divide(new BigDecimal(s_width), 10, BigDecimal.ROUND_UP);// 源图片文件高/宽
			
			
			
			if(targetWidth ==0){
			    if(targetHeight>s_height){
			        targetHeight = s_height; 
			    }
			    targetWidth = new BigDecimal(targetHeight).divide(n).intValue() ;
			}
			
			if(targetHeight == 0){
			    if(targetWidth > s_width){
			        targetWidth = s_width;
			    }
			    targetHeight = new BigDecimal(targetWidth).multiply(n).intValue() ;
			}
			
			
			System.out.println("targetWidth" + targetWidth);
			System.out.println("targetHeight" + targetHeight);
			
			
			// 目标的比例
            BigDecimal m = new BigDecimal(targetHeight).divide(new BigDecimal(targetWidth), 10, BigDecimal.ROUND_UP);// 目标图片文件高/宽
            
			
			
			// 的比例
			logger.debug(n + "");
			logger.debug(m + "");
			int flag = n.compareTo(m);
			try {
				if (flag == 0) {// n == m, 无需裁减, 直接压缩
					logger.debug("flag： " + flag);
					Thumbnails.of(sourceFile).forceSize(targetWidth, targetHeight).outputQuality(0.8f).toFile(targetFile);

				} else {
					// 判断是否需要裁减
					if (flag > 0) {// 高的比例 > 宽的比例，以宽的比例进行缩放， 需要裁减高
						srcImage = Thumbnails.of(sourceFile).width(targetWidth).asBufferedImage();
					} else if (flag < 0) {// n < m 高的比例 < 宽的比例，以高的比例进行缩放， 需要裁减宽
						srcImage = Thumbnails.of(sourceFile).height(targetHeight).asBufferedImage();
					}
					Builder<BufferedImage> builder = Thumbnails.of(srcImage)
							.sourceRegion(Positions.CENTER, targetWidth, targetHeight).size(targetWidth, targetHeight).outputQuality(0.8f);
					builder.toFile(targetFile);
				}
			} catch (IOException e) {
			    logger.error(String.format("cover due to error. sourceFile=[%s] targetFile=[%s]",sourceFile,targetFile),e);
			}
		}else{
		    logger.debug("sourceimg and targetimg  width  heigth is same. width=[{}] height=[{}]",targetWidth, targetHeight);
		    try {
                IOUtils.copy(new FileInputStream(sourceFile), new FileOutputStream(targetFile));
            } catch (IOException e) {
                logger.error(String.format("copy file due to error. sourceFile=[%s] targetFile=[%s]",sourceFile,targetFile),e);
                
            }
		}
	}

	/**
	 * 
	 * @param sourceFile
	 *            源图片文件路径
	 * @param targetFile
	 *            目标图片文件路径
	 * @param x
	 *            原图x轴位移,以图片左上角为参照
	 * @param y
	 *            原图y轴位移,以图片左上角为参照
	 * @param targetWidth
	 *            目标图片文件宽
	 * @param targetHeight
	 *            目标图片文件 高
	 */
	public static void cover(String sourceFile, String targetFile, int x, int y, int targetWidth, int targetHeight) {
		File fromFile = new File(sourceFile);
		if (!fromFile.exists()) {// 目标文件不存在
			return;
		}
		BufferedImage srcImage = null;
		try {
			srcImage = ImageIO.read(fromFile);
			Builder<BufferedImage> builder = Thumbnails.of(srcImage).sourceRegion(x, y, targetWidth, targetHeight)
					.size(targetWidth, targetHeight);
			builder.toFile(targetFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws IOException {
		// String sourceFile =
		// "E://workOfWuxx//mac_iapp//src//main//resources//webapp//uploadimg//2014//12//6972df55641a4c5ca287a2cb1a86627c.png";
		// String targetFile =
		// "E://workOfWuxx//mac_iapp//src//main//resources//webapp//uploadimg//2014//12//6972df55641a4c5ca287a2cb1a86627c_400x800.png";
		// // int width = 80;
		// // int height = 120;
		// int width = 400;
		// int height = 800;
		// try {
		// cover(sourceFile, targetFile, width, height);
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		// String filepath =
		// "E:/workOfLiuxulei/iapp/src/main/resources/webapp/resource/image/2015/01/bfbe5e2737974a00a730cd9777fbece1.png";
		String filepath = "/Users/longtime/Downloads/1/1.bak.png";
		String filepath2 = "/Users/longtime/Downloads/1/1.bak2.png";
		// 72&y1=99&w=142&h=142
		// CovertUtils.cover(filepath, filepath, 72, 99, 142, 142);
		CovertUtils.cover(filepath, filepath2, 580, 0);
	}
}
