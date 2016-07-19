package com.longtime.app.news.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.longtime.app.news.util.PullParseHelperUtil;
import com.longtime.app.news.util.XMLHanderUtil;
import com.longtime.app.news.vo.CategoryNewsVO;
import com.longtime.app.news.vo.NewsResultVO;
import com.longtime.app.news.vo.NewsVO;

@Service(value="newsService")
public class VMNewsServiceImpl implements NewsService{

	private static NewsResultVO result_ksf = null;
	private static NewsResultVO result_longtime = null;
	private static NewsResultVO result_longtime_nocontent = null;
	private static Map<String,NewsVO> newss = new HashMap<String,NewsVO>();
	
	public VMNewsServiceImpl(){
		init();
	}
	
	private void init(){
		result_ksf = XMLHanderUtil.getXmlResult("/test_news.xml");
		InputStream ins1 = VMNewsServiceImpl.class.getClassLoader().getResourceAsStream("test_news_longtimeit.xml");
		InputStream ins2 = VMNewsServiceImpl.class.getClassLoader().getResourceAsStream("test_news_longtimeit.xml");
		try {
			result_longtime = PullParseHelperUtil.parse(ins1,false);
			result_longtime_nocontent = PullParseHelperUtil.parse(ins2, true);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				ins1.close();
				ins2.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<CategoryNewsVO> list_ksf = result_ksf.getCategorynews();
		List<CategoryNewsVO> list_longtime = result_longtime_nocontent.getCategorynews();
		for (CategoryNewsVO categoryNewsVO : list_ksf) {
			List<NewsVO> news = categoryNewsVO.getNews();
			
			for (NewsVO v : news) {
				newss.put(PullParseHelperUtil.replaceBlank(v.getId()), v);
			}
		}
		if(list_longtime!=null){
			for (CategoryNewsVO categoryNewsVO : list_longtime) {
				List<NewsVO> news = categoryNewsVO.getNews();
				
				for (NewsVO v : news) {
					newss.put(v.getId(), v);
				}
			}
		}
		
	}
	
	public NewsResultVO getAll(String domain){
		
		if(domain.equals("longtimeit")){
			return result_longtime;
		}
		
		return result_ksf;
	}
	
	public NewsVO getNewsById(String id){
		return newss.get(id);
	}
	
	
	public static void main(String[] args) {
		VMNewsServiceImpl vm = new VMNewsServiceImpl();
		System.out.println(JSONObject.fromObject(result_ksf).toString());
		
		NewsVO news = vm.getNewsById("1");
		System.out.println(JSONObject.fromObject(news).toString());
	}
}
