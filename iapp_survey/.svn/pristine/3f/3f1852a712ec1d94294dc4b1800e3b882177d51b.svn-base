//package com.longtime.app.ixin.mgr.controller;
//
//import com.alibaba.fastjson.JSON;
//import com.google.common.base.Joiner;
//import com.google.common.collect.Lists;
//import com.google.common.collect.Maps;
//import com.kin.weixin.ImgFileForm;
//import com.kin.weixin.Weixin;
//import com.kin.weixin.WeixinApi;
//import com.longtime.ajy.support.PasswordEncoder;
//import com.longtime.ajy.support.service.WxCpAgentService;
//import com.longtime.ajy.support.service.WxMpAgent;
//import com.longtime.app.base.model.Organization;
//import com.longtime.app.base.model.User;
//import com.longtime.app.base.service.OrganizationService;
//import com.longtime.app.base.service.UserService;
//import com.longtime.app.base.util.Constant;
//import com.longtime.app.config.Constants;
//import com.longtime.app.ixin.api.FosunAPIHelper;
//import com.longtime.app.ixin.api.TestDingHelper;
//import com.longtime.app.ixin.mgr.fodder.service.FodderService;
//import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
//import com.longtime.app.ixin.mgr.model.TokenInfo;
//import com.longtime.app.ixin.mgr.service.ITokenService;
//import com.longtime.app.ixin.mgr.service.MessageRecordService;
//import com.longtime.app.util.HTMLUtils;
//import com.longtime.app.util.StringUtil;
//import com.longtime.common.utils.LoginSessionHelper;
//import com.longtime.common.utils.QueryCondition;
//import com.longtime.common.utils.QueryFilter;
//import com.longtime.common.utils.ResultSet;
//import net.sf.json.JSONObject;
//import ognl.Ognl;
//import ognl.OgnlException;
//import org.apache.commons.collections.CollectionUtils;
//import org.apache.commons.lang.StringUtils;
//import org.apache.commons.lang.builder.ToStringBuilder;
//import org.apache.commons.lang3.ArrayUtils;
//import org.joda.time.IllegalFieldValueException;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.File;
//import java.io.IOException;
//import java.util.*;
//
//@Controller("messageController")
//@RequestMapping("/mgr/msg/")
//public class MessageController {
//	private final static Logger logger = LoggerFactory
//			.getLogger(MessageController.class);
//
//	@Resource(name = "fodderService")
//	private FodderService fodderService;
//	/*@Resource(name = "testDingHelper")
//	private TestDingHelper testDingHelper;*/
//	
//	@Resource(name = "messageRecordService")
//	private MessageRecordService messageRecordService;
//	
//	@Resource(name = "userService")
//	private UserService userService;
//	
//	@Resource(name = "organizationService")
//	private OrganizationService organizationService;
//
//	@Resource
//	private ITokenService tokenService;
//	
//	
//	private boolean isSend(int optiontype){
//		return optiontype == 1 ||optiontype==3;
//	}
//	private boolean isCreate(int optiontype){
//		return optiontype==2 || optiontype==3;
//	}
//	@RequestMapping("sendmultimsg_new")
//	@ResponseBody
//	public Map<String,Object> sendMultiMsgNew(HttpServletRequest request,
//		@RequestParam(value = "id[]") String[] ids,
//		@RequestParam(value = "optiontype", required = false, defaultValue = "2") int optiontype, // 1 只发送  2 只创建  3 创建发送
//		HttpServletResponse response, ModelMap map) throws IOException{
//		
//		Map<String, Object> rs = new HashMap<>(2);
//		if(!isSend(optiontype) && !isCreate(optiontype)){
//			rs.put("code", false);
//			rs.put("msg", "请选择操作");
//			return rs;
//		}
//		
//		
//		String domain = LoginSessionHelper.getCurrentDomain(request);
//		TokenInfo tokenInfo = tokenService.getTokenInfoByDomain(domain);
//		if (tokenInfo == null) {
//			rs.put("code", false);
//			rs.put("msg", "没有绑定微信账号，请到[爱微站->公众号绑定]页进行填写");
//			return rs;
//		}
//		
//		if(tokenInfo.isWXQY() && isCreate(optiontype)){
//			rs.put("code", false);
//			rs.put("msg", "企业号不支持创建素材,只能发送");
//			return rs;
//		}
//		
//		if(ids==null || ids.length<1){
//			rs.put("code", false);
//			rs.put("msg", "没有选择图文素材");
//			return rs;
//		}
//		
//		
//		List<FodderVO> fodders = new ArrayList<FodderVO>();// 素材列表
//		List<File> files = new ArrayList<File>();// 素材封面列表
//		for (int i = 0; i < ids.length; i++) {
//			FodderVO fodder = this.fodderService.getFodderVOById(ids[i]);
//			if (fodder == null) {
//				rs.put("code", false);
//				rs.put("msg", "选择的图文素材已经不存在");
//				return rs;
//			}
//			if(!tokenInfo.isWXQY()){
//				String picUrl = fodder.getCoverPath();
//				File file = Weixin.downLoadFile(picUrl, Constants.WX_TMEP_IMG_PATH);
//				if (file == null || file.length() <= 0) {
//					rs.put("code", false);
//					rs.put("msg", "图文素材封面本地保存失败");
//					return rs;
//				}
//				files.add(file);
//			}
//
//			// 处理 素材内容中的图片，需要将图片上传至微信平台
//			try{
//				fodder = processFodderContentImgToWx(fodder,tokenInfo);
//			}catch (Exception e){
//				rs.put("code", false);
//				rs.put("msg", "图文素材内容中的图片上传至微信过程中发生错误.[可能原因：图片大于1M;图片不存在]");
//				return rs;
//			}
//
//			fodders.add(fodder);
//		}
//		
//		
//		
//		// 创建素材
//		if(!tokenInfo.isWXQY() && isCreate(optiontype)){
//			
//			if(tokenInfo.isAuth()){ //高级认证,调用接口创建素材
//				
//				String newsMediaId = WxMpAgent.createMaterialMutilMsg(tokenInfo, fodders, files); //创建永久素材
//				
//				if(StringUtils.isBlank(newsMediaId)){
//					rs.put("code", false);
//					rs.put("msg", "图文素材创建失败");
//					return rs;
//				}
//				
//			}else{  //未高级认证，不能群发。 模拟登录并创建, 并在公众平台上进行发送。
//
//				if (StringUtils.isBlank(tokenInfo.getName())|| StringUtils.isBlank(tokenInfo.getPass())) {
//					rs.put("code", false);
//					rs.put("msg", "未认证公众号无法通过接口创建素材，需要填写微信账号密码，请到[爱微站->公众号绑定]页进行填写");
//					return rs;
//				}
//				createMessage(rs, tokenInfo, files, fodders);
//				
//				return rs;
//			}
//		}
//		
//		if(!isSend(optiontype)){
//			rs.put("code", false);
//			rs.put("msg", "图文素材创建成功");
//			return rs;
//		}
//		
//		
//		//发送
//			
//		if(tokenInfo.isWXQY()){
//				//企业号
//				boolean flag = WxCpAgentService.sendNewsMsg(ids, "@all", null, domain);
//				this.messageRecordService.save(ids.toString(),LoginSessionHelper.getCurrentUserId(request), domain, flag?0:1);
//				if(!flag){
//					rs.put("code", false);
//					rs.put("msg", "发送失败！");
//				}else{
//					rs.put("code", true);
//					rs.put("msg", "发送成功！");
//				}
//				
//				return rs;
//		}
//			
//		if(tokenInfo.isAuth()){//认证的公众号群发
//				
//				String newsMediaId = WxMpAgent.createMutilMsg(tokenInfo, fodders, files); //创建永久素材
//			
//				boolean bool = WxMpAgent.sendAll(tokenInfo, newsMediaId);
//				
//				messageRecordService.save(ids.toString(), LoginSessionHelper.getCurrentUserId(request), domain, bool ? 0 : 1);
//				if(!bool){
//					rs.put("code", false);
//					rs.put("msg", "发送失败！");
//					
//				}else{
//					rs.put("code", true);
//					rs.put("msg", "发送成功！");
//				}
//				return rs;
//		}else{
//			
//			rs.put("code", false);
//			rs.put("msg", "未认证公众号无法通过接口群发，请登录到公众平台进行群发");
//			return rs;
//			
//		}
//			
//	}
//	
//	@RequestMapping(value="sendtocp",method=RequestMethod.POST)
//	@ResponseBody
//	public Map<String,Object> sendToCp(HttpServletRequest request,HttpServletResponse response, ModelMap map) throws IOException{
//		String uidsStr = request.getParameter("uids");
//		String oidsStr = request.getParameter("oids");
//		String contentType = request.getParameter("contentType");//0 图文 1文本
//		String fodderIdsStr = request.getParameter("fodderIds");
//		String content = request.getParameter("content");
//		
//		String[] uids = toArray(uidsStr);
//		String[] oids = toArray(oidsStr);
//		String[] fodderIds = toArray(fodderIdsStr);
//		
//		Map<String, Object> rs = Maps.newHashMap();
//		if(uids != null && uids.length>1000){
//			rs.put("code", false);
//			rs.put("msg", "最多选择1000个用户，请重新选择！");
//			return rs;
//		}
//		
//		if(oids != null && oids.length>100){
//			rs.put("code", false);
//			rs.put("msg", "最多选择100个组织，请重新选择！");
//			return rs;
//		}
//		
//		if("0".equals(contentType) && ArrayUtils.isEmpty(fodderIds)){
//			rs.put("code", false);
//			rs.put("msg", "图文素材不能为空，请重新选择！");
//			return rs;
//		} else if(("1".equals(contentType) && StringUtils.isBlank(content)) || content.length()>1000){
//			rs.put("code", false);
//			rs.put("msg", "文本消息内容为空或过长，请重新设置！");
//			return rs;
//		}
//		
//		String domain = LoginSessionHelper.getCurrentDomain(request);
//		if(FosunAPIHelper.isDingTalkDomain(domain)){
//
//			if("1".equals(contentType)){ //文本信息
//				rs = sendFosunText(uids,oids,content,domain);
//			}
//			if("0".equals(contentType)){//素材
//				FodderVO fodderVO = fodderService.getFodderVOById(fodderIds[0]);
//				if(null==fodderVO || fodderVO.getDel()==1){
//					rs.put("code", false);
//					rs.put("msg", "选择的素材不存在！");
//					return rs;
//				}
//				rs = sendFosunNew(uids,oids,fodderVO,domain);
//			}
//
//			return rs;
//		}
//		
//		
//		TokenInfo tokenInfo = tokenService.getTokenInfoByDomain(domain);
//		if (tokenInfo == null || !tokenInfo.isWXQY()) {
//			rs.put("code", false);
//			rs.put("msg", "非企业号不能通过该方式发送，如有疑问请联系运维人员！");
//			return rs;
//		}
//		
//		String toUser = getToUser(uids);
//		String toParty = getToParty(oids);
//		
//		if(StringUtils.isBlank(toUser) && StringUtils.isEmpty(toParty)){
//			toUser = "@all";
//		}
//		
//		String remark = String.format("uids=[%s],oids=[%s]", uidsStr,oidsStr);
//		
//		boolean flag = true;
//		if("0".equals(contentType)){
//			flag = WxCpAgentService.sendNewsMsg(fodderIds,toUser , toParty, domain);
//			this.messageRecordService.save(fodderIdsStr,contentType,LoginSessionHelper.getCurrentUserId(request), domain, flag?0:1,remark);
//		} else if("1".equals(contentType)){
//			flag = WxCpAgentService.sendTextMsg(content,toUser , toParty, domain);
//			this.messageRecordService.save(content,contentType,LoginSessionHelper.getCurrentUserId(request), domain, flag?0:1,remark);
//		}
//		if(!flag){
//			rs.put("code", false);
//			rs.put("msg", "发送失败！");
//		}else{
//			rs.put("code", true);
//			rs.put("msg", "发送成功！");
//		}
//		
//		return rs;
//	}
//
//
//	private Map<String, Object> sendFosunNew(String[] uids, String[] oids,
//											  FodderVO fodderVO,String domain) {
//		int groupNum = 500;//每组人员数
//
//		String[] toUserStringGroup = null; // 对用户分组推送
//		if(ArrayUtils.isNotEmpty(uids) && uids.length>groupNum){
//			// 分组
//			int group = (uids.length+groupNum-1) /groupNum;
//			toUserStringGroup = new String[group];
//			for(int i=0;i<group;i++){
//				int index_start = i*groupNum;
//				int index_end = (index_start+groupNum)<uids.length?index_start+groupNum:uids.length;
//
//				String[] tmpUids = Arrays.copyOfRange(uids, index_start, index_end);
//
//				toUserStringGroup[i] = getToUser(tmpUids);
//			}
//
//
//
//		}else{
//			toUserStringGroup = new String[1];
//			toUserStringGroup[0] = getToUser(uids);
//		}
//
//
//		String url = String.format("%s%s%s%s%s", Constant.FODDER_BASE_PATH, "id=", fodderVO.getId(), "&fdomain=", fodderVO.getDomain());
//		String imageUrl =  null;
//		if(StringUtils.isNotBlank(fodderVO.getExt())){
//			imageUrl =  String.format("%s/%s-640x320", Constants.IMG_SERVER_DOWNLOAD, fodderVO.getExt());
//
//		}
//
//		boolean success = true;
//		boolean hasSuccess = false; //有部分成功的
//		// 分组推送
//		for(int i=0;i<toUserStringGroup.length;i++){
//
//			String toUser = toUserStringGroup[i];
//			String toParty = null;
//			if(i==0){
//				toParty  = getToParty(oids);
//			}
//
//			boolean b =   FosunAPIHelper.sendImageText( toUser, toParty,fodderVO.getTitle(),fodderVO.getSummary(), url,imageUrl, domain);
//
//			if(b){
//				hasSuccess = true;
//			}
//			success = (success && b);
//		}
//
//		Map<String, Object> rs = new HashMap<String, Object>();
//		if(success){
//			rs.put("code", true);
//				rs.put("msg", "发送成功！");
//		}
//		else{
//
//				rs.put("code", false);
//				rs.put("msg", hasSuccess?"部分人员发送失败!":"发送失败！");
//		}
//		return rs;
//	}
//
//
//
//	private Map<String, Object> sendFosunText(String[] uids, String[] oids,
//			String content,String domain) {
//		Map<String, Object> rs = new HashMap<String, Object>();
//		String toUser = getToUser(uids);
//		String toParty = getToParty(oids);
//		/*
//		if(StringUtils.isBlank(toUser) && StringUtils.isEmpty(toParty)){
//			rs.put("code", true);
//			rs.put("msg", "发送成功！");
//			return rs;
//		}*/
//		
//		boolean success = FosunAPIHelper.sendText(content,toUser,toParty,domain);
//		if(success){
//			rs.put("code", true);
//			rs.put("msg", "发送成功！");
//		}
//		else{
//			
//			rs.put("code", false);
//			rs.put("msg", "发送失败！");
//		} 
//		
//		return rs;
//	}
//
//	private String[] toArray(String ids) {
//		if(StringUtils.isBlank(ids)){
//			return null;
//		}
//		String[] arr = ids.split(",");
//		List<String> list = Lists.newArrayList();
//		for(String id : arr){
//			if(StringUtils.isNotBlank(id)){
//				list.add(id);
//			}
//		}
//		return list.toArray(new String[list.size()]);
//	}
//	private String getToUser(String[] uids) {
//		if(ArrayUtils.isEmpty(uids)){
//			return null;
//		}
//		QueryCondition conditions = new QueryCondition();
//		conditions.addFilter(QueryFilter.in("id", Arrays.asList(uids)));
//		conditions.addFilter("isDel", User.ISDEL_NO);
//		ResultSet<User> rs = this.userService.list(conditions);
//		
//		if(rs == null || CollectionUtils.isEmpty(rs.getItems())){
//			return null;
//		}
//
//		List<String> usernames = Lists.newArrayList();
//		for(User user : rs.getItems()){
//			usernames.add(user.getUsername());
//		}
//		return Joiner.on("|").join(usernames);
//	}
//	
//	private String getToParty(String[] oids) {
//		if(ArrayUtils.isEmpty(oids)){
//			return null;
//		}
//		QueryCondition conditions = new QueryCondition();
//		conditions.addFilter(QueryFilter.in("id", Arrays.asList(oids)));
//		conditions.addFilter("isdel", User.ISDEL_NO);
//		ResultSet<Organization> rs = this.organizationService.list(conditions);
//		
//		if(rs == null || CollectionUtils.isEmpty(rs.getItems())){
//			return null;
//		}
//		
//		List<String> cpids = Lists.newArrayList();
//		for(Organization org : rs.getItems()){
//			if(0 != org.getCpid()){
//				cpids.add(String.valueOf(org.getCpid()));
//			}
//		}
//		return Joiner.on("|").join(cpids);
//	}
//	
//	@RequestMapping("sendmultimsg")
//	@ResponseBody
//	public Map<String, Object> sendMultiMsg(
//			HttpServletRequest request,
//			@RequestParam(value = "id[]") String[] ids,
//			@RequestParam(value = "optiontype", required = false, defaultValue = "0") int optiontype,
//			HttpServletResponse response, ModelMap map) throws IOException {
//		Map<String, Object> rs = Maps.newHashMap();
//		String domain = LoginSessionHelper.getCurrentDomain(request);
//		TokenInfo tokenInfo = tokenService.getTokenInfoByDomain(domain);
//		if (tokenInfo == null) {
//			rs.put("code", false);
//			rs.put("msg", "没有绑定微信账号，请到[爱微站->公众号绑定]页进行填写");
//			return rs;
//		}
//
//		if (StringUtils.isBlank(tokenInfo.getName())
//				|| StringUtils.isBlank(tokenInfo.getPass())) {
//			rs.put("code", false);
//			rs.put("msg", "没有填写微信账号密码，请到[爱微站->公众号绑定]页进行填写");
//			return rs;
//		}
//
//		List<String> idlist = new ArrayList<String>();
//		StringBuffer idBuffer = new StringBuffer();
//		for (String fid : ids) {// 去除为空
//			if (!fid.isEmpty()) {
//				idlist.add(fid);
//				idBuffer.append(fid).append(",");
//			}
//		}
//		if (idlist.size() == 0) {
//			rs.put("code", false);
//			rs.put("msg", "没有选择图文素材");
//			return rs;
//		}
//
//		List<File> files = new ArrayList<File>();// 素材封面列表
//		List<FodderVO> fodders = new ArrayList<FodderVO>();// 素材列表
//		// boolean debug =
//		// BooleanUtils.toBoolean(request.getParameter("debug"));
//		for (int i = 0; i < idlist.size(); i++) {
//			FodderVO fodder = this.fodderService.getFodderVOById(idlist.get(i));
//			if (fodder == null) {
//				rs.put("code", false);
//				rs.put("msg", "选择的图文素材已经不存在");
//				return rs;
//			}
//			
//			if(!tokenInfo.isWXQY()){
//				String picUrl = fodder.getCoverPath();
//				File file = Weixin.downLoadFile(picUrl, Constants.WX_TMEP_IMG_PATH);
//				if (file == null || file.length() <= 0) {
//					rs.put("code", false);
//					rs.put("msg", "图文素材封面加载失败");
//					return rs;
//				}
//				files.add(file);
//				// 处理 素材内容中的图片，需要将图片上传至微信平台
//				try{
//					fodder = processFodderContentImgToWx(fodder,tokenInfo);
//				}catch (Exception e){
//					rs.put("code", false);
//					rs.put("msg", "图文素材内容中的图片上传至微信过程中发生错误.[可能原因：图片大于1M;图片不存在]");
//					return rs;
//				}
//
//				fodders.add(fodder);
//			}
//		}
//
//		// ============================认证的服务号调用微信接口发送消息=================================
//		if (tokenInfo.getType() != null && "1".equals(tokenInfo.getType())
//				&& tokenInfo.getType() != null
//				&& "1".equals(tokenInfo.getAuthentication())) {// 已认证服务号
//
//			if (StringUtils.isBlank(tokenInfo.getAppId())
//					|| StringUtils.isBlank(tokenInfo.getAppSecret())) {// 没有填写微信AppId、AppSecret
//				rs.put("code", false);
//				rs.put("msg", "没有填写微信AppId、AppSecret，请到[爱微站->公众号绑定]页进行填写");
//				return rs;
//			}
// 
//			switch (optiontype) {
//			case 1:// 只发送
//				sendMessageAll(request, rs, domain, tokenInfo, idBuffer, files,
//						fodders);
//				break;
//			case 2:// 只创建
//				createMessage(rs, tokenInfo, files, fodders);
//				if((Boolean) rs.get("code")){//创建成功
//					idBuffer.delete(idBuffer.length() - 1,
//							idBuffer.length());
//					messageRecordService.save(idBuffer.toString(),
//							LoginSessionHelper.getCurrentUserId(request),
//							domain,0);
//				}
//				break;
//			case 3:// 创建发送
//				createMessage(rs, tokenInfo, files, fodders);
//				if((Boolean) rs.get("code")){//创建成功
//					sendMessageAll(request, rs, domain, tokenInfo, idBuffer, files,
//							fodders);
//					if((Boolean) rs.get("code")){//发送成功
//						rs.put("code", true);
//						rs.put("msg","素材同步微信平台成功，可在<a target='_blank' href='https://mp.weixin.qq.com/' style='color:blue;'>微信平台</a>进行查看，微信平台将在几分钟后完成消息发送");
//					}else{//发送失败
//						rs.put("code", true);
//						rs.put("msg", "在微信平台创建图文素材成功,但发送失败。请前往<a target='_blank' href='https://mp.weixin.qq.com/' style='color:blue;'>微信平台</a>群发消息.");
//					}
//				} 
//				break;
//			default:
//				break;
//			}
//			// ============================调用微信接口发送消息=================================
//		} else if(tokenInfo.isWXQY()){
//			
//			//企业号
//			String[] idarrays = new String[idlist.size()];
//			idlist.toArray(idarrays);
//			boolean flag = WxCpAgentService.sendNewsMsg(idarrays, "@all", null, domain);
//			this.messageRecordService.save(idBuffer.toString(),LoginSessionHelper.getCurrentUserId(request), domain, flag?0:1);
//			if(!flag){
//				rs.put("code", false);
//				rs.put("msg", "发送失败！");
//			}else{
//				rs.put("code", true);
//				rs.put("msg", "发送成功！");
//			}
//			
//		}else {// ===============素材上传微信平台，在微信平台发送 
//			createMessage(rs, tokenInfo, files, fodders);
//			if((Boolean) rs.get("code")){//创建成功
//				idBuffer.delete(idBuffer.length() - 1,
//						idBuffer.length());
//				messageRecordService.save(idBuffer.toString(),
//						LoginSessionHelper.getCurrentUserId(request),
//						domain,0);
//			}
//			
//			
//			
//			
//		}
//		return rs;
//	}
//
//	/**
//	 * 在微信平台，模拟登录并模拟创建消息
//	 * 
//	 * @param rs
//	 * @param tokenInfo
//	 * @param files
//	 *            图文素材封面列表
//	 * @param fodders
//	 *            素材封面列表
//	 */
//	private boolean createMessage(Map<String, Object> rs, TokenInfo tokenInfo,
//			List<File> files, List<FodderVO> fodders) {
//		String domain = tokenInfo.getDomain();
//		//账号密码解密
//		String decodeusername = PasswordEncoder.decode(tokenInfo.getName(), domain);
//		String decodepassword = PasswordEncoder.decode(tokenInfo.getPass(), domain);
//		Weixin wx = new Weixin(decodeusername, decodepassword);
//		List<String> imgids = new ArrayList<String>();
//		// 上传封面
//		for (File f : files) {
//			ImgFileForm form = new ImgFileForm();
//			form.setToken(wx.getToken());
//			form.setUploadfile(f);
//			String imgid = wx.updateImg2(form);
//			if (StringUtils.isBlank(imgid)) {
//				rs.put("code", false);
//				rs.put("msg", "封面无法上传到微信平台.");
//				return false;
//			}
//			imgids.add(imgid);
//		}
//
//		// 创建素材
//		String msgid = wx.createImgTextMsg(fodders, imgids);
//
//		if (StringUtils.isBlank(msgid)) {
//			rs.put("code", false);
//			rs.put("msg", "在微信平台创建图文素材失败.");
//			return false;
//		} else { 
//			rs.put("code", true);
//			rs.put("msg",
//					"在微信平台创建图文素材成功,请前往<a target='_blank' href='https://mp.weixin.qq.com/' style='color:blue;'>微信平台</a>群发消息.");
//			return true;
//		}
//		
//	}
//
//	/**
//	 * 微信群发消息
//	 * 
//	 * @param request
//	 * @param rs
//	 * @param domain
//	 * @param tokenInfo
//	 * @param idBuffer素材id列表
//	 * @param files
//	 *            图文素材封面列表
//	 * @param fodders
//	 *            素材封面列表
//	 */
//	private void sendMessageAll(HttpServletRequest request,
//			Map<String, Object> rs, String domain, TokenInfo tokenInfo,
//			StringBuffer idBuffer, List<File> files, List<FodderVO> fodders ) {
//		String accessToken = WeixinApi.getToken(WeixinApi.GET_TOKEN_URL,
//				tokenInfo.getAppId(), tokenInfo.getAppSecret());// 获取token
//
//		if (accessToken != null) {// token成功获取
//			logger.debug(accessToken);
//
//			List<String> fileids = new ArrayList<String>();
//			for (File f : files) { // 上传图文素材封面
//				String fileid = WeixinApi.uploadImage(
//						WeixinApi.UPLOAD_IMAGE_URL, accessToken, "image", f);
//				if (fileid != null) {// 图文素材封面成功上传
//					fileids.add(fileid);
//				} else {
//					rs.put("code", false);
//					rs.put("msg", "发送失败，失败原因:</br>素材封面上传微信平台失败");
//					return;
//				}
//			}
//
//			// 构造图文消息数据(可以有多个素材)
//			JSONObject msg = WeixinApi.createFodderMessage(fileids, fodders,
//					"1"); //封装消息
//			String msgString = msg.toString();
//			logger.debug(msgString);
//
//			String mediaId = WeixinApi.uploadFodder(
//					WeixinApi.UPLOAD_FODDER_URL, accessToken, msgString);// 上传图文消息(可以有多个素材)
//
//			if (mediaId != null) {// 图文消息 上传成功
//				logger.debug(mediaId);
//
//				String[] idArray = WeixinApi.getGroups(
//						WeixinApi.GET_USER_GROUP, accessToken);// 获取用户分组信息
//				if (idArray != null) {// 获取成功
//					logger.debug(Arrays.toString(idArray));
//					 boolean isSuccess = true;
//					for (String gid : idArray) {// 一个组一个组遍历发送
//						// 构造发送数据
//						JSONObject groupMessage = WeixinApi.createGroupMessage(
//								gid, mediaId, "mpnews");
//
//						logger.debug(groupMessage.toString());
//						String result = WeixinApi.sendMsg(
//								WeixinApi.SEND_MESSAGE_URL, accessToken,
//								groupMessage.toString());// 消息发送
//						if (result != null) {// 发送成功
//							logger.debug(result);
//							rs.put("code", true);
//							rs.put("msg", "发送成功，微信平台将在几分钟后完成消息发送");
//						} else {
//							isSuccess = false; 
//							rs.put("code", false);
//							rs.put("msg", "用户消息发送失败");
//						}
//					}
//					// 全部发送成功,保存消息发送记录
//					if (isSuccess) { 
//						idBuffer.delete(idBuffer.length() - 1,
//								idBuffer.length());
//						messageRecordService.save(idBuffer.toString(),
//								LoginSessionHelper.getCurrentUserId(request),
//								domain,0);
//					}
//				} else {
//					rs.put("code", false);
//					rs.put("msg", "发送失败，失败原因:</br>用户分组信息获取失败");
//				}
//			} else {
//				rs.put("code", false);
//				rs.put("msg", "发送失败，失败原因:</br>在微信平台创建图文消息失败");
//			}
//
//		} else {
//			rs.put("code", false);
//			rs.put("msg",
//					"发送失败，失败原因:</br>AppId、AppSecret,填写错误，access_token获取失败");
//		}
//	}
//
//
//	private FodderVO processFodderContentImgToWx(FodderVO fodderVO,TokenInfo tokenInfo) throws IllegalFieldValueException{
//
//		String content =fodderVO.getContent();
//
//		List<String> imgSrcList = HTMLUtils.getHtmlImgSrc(content);
//		Map<String,String> replaceImgMap = Maps.newHashMap();
//		for (String src : imgSrcList) {
//
//			String wxImgSrc = doUploadImgToWx(src, tokenInfo);
//
//			if(StringUtils.isBlank(wxImgSrc)){
//				throw  new IllegalFieldValueException("fodder.content",String.format("content img src upload to weixin due to error. img src=[%s]",src));
//			}
//			replaceImgMap.put(src, wxImgSrc);
//		}
//
//		//图片链接替换
//	    for (String key:replaceImgMap.keySet()) {
//			String value = replaceImgMap.get(key);
//			content = replaceImgSrc(content, key, value);
//		}
//
//		fodderVO.setContent(content);
//		return fodderVO;
//
//	}
//
//	private String replaceImgSrc(String content, String originalSrc, String newSrc) {
//		content = content.replaceAll(originalSrc,newSrc);
//		return content;
//	}
//
//	private String  doUploadImgToWx(String imgsrc,TokenInfo tokenInfo){
//
//		try {
//			File imgFile  = Weixin.downLoadFile(imgsrc, Constants.WX_TMEP_IMG_PATH);
//			return WxMpAgent.updateFodderContentImg(tokenInfo,imgFile);
//
//		} catch (IOException e) {
//			logger.error(String.format("img file download due to error. img=[%s]",imgsrc),e);
//		}
//		return null;
//
//	}
//
//	public static void main(String[] args) throws OgnlException {
//		Map<String,Object> json = Maps.newHashMap();
//
//		Ognl.setValue("a",json,Maps.newHashMap());
//		Ognl.setValue("a.b",json,1);
//
//		System.out.println(JSON.toJSONString(json));
//
//
//
//
//	}
//
//}
