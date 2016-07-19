package com.longtime.app.remind.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Service;

import com.longtime.app.remind.service.RemindTypeService;

@Service(value="remindTypeService")
public class VMRemindTypeServiceImpl implements RemindTypeService{

	private static final ObjectMapper objectMapper = new ObjectMapper();
	private Map<String,String> remindTypeMap = new HashMap<String, String>();
	
	public VMRemindTypeServiceImpl(){
		init();
	}
	@SuppressWarnings({  "unchecked" })
	private void init() {
		InputStream is = VMRemindTypeServiceImpl.class.getResourceAsStream("/com.longtimeit.remindtype.json");
		if(is != null){
			try {
				Map<String,String> map = (Map<String,String>) objectMapper.readValue(is, Map.class);
				for (String key : map.keySet()) {
					remindTypeMap.put(key, map.get(key));
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		VMRemindTypeServiceImpl im =	new VMRemindTypeServiceImpl();
		for (Entry<String,String> e :im.remindTypeMap.entrySet()) {
			System.out.println(e.getKey()+"=="+e.getValue());
		}
	}
	@Override
	public Map<String, String> getTypes() {
		
		return remindTypeMap;
	}
}
