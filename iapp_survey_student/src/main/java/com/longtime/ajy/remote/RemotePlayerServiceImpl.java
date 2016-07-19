package com.longtime.ajy.remote;

import java.io.IOException;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.longtime.ajy.model.StudyVO;
import com.myctu.platform.HttpHelper;

@Service("remotePlayerService")
public class RemotePlayerServiceImpl implements RemotePlayerService{
	
	
	private static Logger logger = org.slf4j.LoggerFactory.getLogger(RemotePlayerServiceImpl.class);

	
	@Value("${com.longtime.ajy.player.root}")
	private String playerRoot;
	
	
	
	
	@Override
	public StudyVO getCourseInfo(String courseId, int type, String uid) {
		String url = playerRoot+"/statistics/total.json";
		//String url = "http://www.aijiayou.com/player/statistics/total.json";
		String scorm = (type==1)?"true":"false";
		try {
			
			return HttpHelper.get().doGet(String.format("%s?uid=%s&rid=%s&scorm=%s", url,uid,courseId,scorm), replyHandler1);
		} catch (Exception e) {
			return new StudyVO();
		}
	}
	
	private final static ResponseHandler<StudyVO> replyHandler1 = new ResponseHandler<StudyVO>() {

		@Override
		public StudyVO handleResponse(HttpResponse response) throws ClientProtocolException, IOException {

			if (response.getStatusLine().getStatusCode() != 200) {
				String _reply = IOUtils.toString(response.getEntity().getContent());
				throw new IOException(String.format("http response due to error code:[%s],the replay is:[%s]",
					response.getStatusLine(),
					_reply));
			}

			StudyVO entity = new StudyVO();
			try {
				String _reply = IOUtils.toString(response.getEntity().getContent());
				//{"rid":"ff8080814a3344d4014a57aa12f7010f","sec":23,"show":"0000:00:23","showunit":"23秒","uid":"ff808081471467ae014714e329fb029a"}
				JSONObject jsonObject = JSONObject.parseObject(_reply);
				String rid = jsonObject.getString("rid");
				entity.setRid(rid);
				String sec = jsonObject.getString("sec");
				entity.setSec(NumberUtils.toLong(sec, 0));
				String show = jsonObject.getString("show");
				entity.setShow(show);
				String showunit = jsonObject.getString("showunit");
				entity.setShowunit(showunit);
				String uid = jsonObject.getString("uid");
				entity.setUid(uid);
				if(jsonObject.containsKey("lesson_status")){
					String lessonStatus = jsonObject.getString("lesson_status");
					if (StringUtils.isNotBlank(lessonStatus)) {
						entity.setLesson_status(lessonStatus);
					}
				}
				
				return  entity;
			} catch (Exception e) {
				logger.error("request study trace info due to error.", e);
			}
			return  entity;
		}

	};



	
	


	

}
