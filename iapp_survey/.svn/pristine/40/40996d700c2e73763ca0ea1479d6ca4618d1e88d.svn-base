package com.longtime.app.news.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

/**
 * @see NewsFile.xml
 * @author chenkf
 *
 */
public class NewsResultVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7934167639859324250L;

	private List<CategoryVO> categorys;
	
	private List<CategoryNewsVO> categorynews;

	public List<CategoryVO> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<CategoryVO> categorys) {
		this.categorys = categorys;
	}

	public List<CategoryNewsVO> getCategorynews() {
		return categorynews;
	}

	public void setCategorynews(List<CategoryNewsVO> categorynews) {
		this.categorynews = categorynews;
	}
	
	
	public static void main(String[] args) {
		NewsResultVO result = new NewsResultVO();
		List<CategoryVO> categorys = new ArrayList<CategoryVO>();
		
		for(int i=0;i<1;i++){
			CategoryVO vo = new CategoryVO();
			
			vo.setName("产品新闻");
			
			categorys.add(vo);
		}
		
		List<CategoryNewsVO> categorynews = new ArrayList<CategoryNewsVO>();
		
		for(int i=0;i<1;i++){
			CategoryNewsVO vo = new CategoryNewsVO();
			List<NewsVO> news = new ArrayList<NewsVO>();
			for(int j=0;j<2;j++){
				NewsVO n = new NewsVO();
				/*
				 * <id>
                2013-06-06
            </id>
            <title>康师傅矿物质水新装上市</title>
            <short_content>
        自2003年上市以来，康师傅矿物质水从未停止创新的脚步。2004年充满清新自然风的瓶型，与瓶标、瓶身上的椰树、海浪有机结合，清晰传递健康饮水、享受阳光生活的全新理念；配合2008年奥运会推出的运动瓶型，融入划水、游泳、羽毛球等体育项目图案，同奥运盛事相得益彰；2013年最新推出的新款瓶型在继续传达品牌活力、产品个性之外，水浪的激荡象征生活的多彩，人形的舞动代表心情的愉悦，瓶身质感更为晶透，握感更强、更舒适，一如既往展示出康师傅品牌突破、创新的企业精神。
            </short_content>
            <detail_url>
                http://www.longtimeit.com/news/news-201349001.html
            </detail_url>
            <thumbnail_url>http://www.masterkong.com.cn/trends/news/newsforproduct/images/picxw4i3xu3.jpg</thumbnail_url>
            <time>
                2013-04-09
            </time>
				 */
				n.setId("2013-06-06");
				n.setDetail_url("http://www.longtimeit.com/news/news-201349001.html");
				n.setShort_content(" 自2003年上市以来，康师傅矿物质水从未停止创新的脚步。2004年充满清新自然风的瓶型，与瓶标、瓶身上的椰树、海浪有机结合，清晰传递健康饮水、享受阳光生活的全新理念；配合2008年奥运会推出的运动瓶型，融入划水、游泳、羽毛球等体育项目图案，同奥运盛事相得益彰；2013年最新推出的新款瓶型在继续传达品牌活力、产品个性之外，水浪的激荡象征生活的多彩，人形的舞动代表心情的愉悦，瓶身质感更为晶透，握感更强、更舒适，一如既往展示出康师傅品牌突破、创新的企业精神。");
				n.setThumbnail_url("http://www.masterkong.com.cn/trends/news/newsforproduct/images/picxw4i3xu3.jpg");
				n.setTime("2013-04-09");
				n.setTitle("康师傅矿物质水新装上市");
				
				news.add(n);
			}
			vo.setName("产品新闻");
			vo.setNews(news);
			
			categorynews.add(vo);
		}
		
		result.setCategorynews(categorynews);
		result.setCategorys(categorys);
		
		System.out.println(JSONObject.fromObject(result));
	}
}
