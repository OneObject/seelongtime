//package com.longtime.app.base.controller;
//
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.List;
//import java.util.Set;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//
//import org.apache.commons.lang.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.google.common.base.Splitter;
//import com.google.common.collect.Sets;
//import com.googlecode.genericdao.search.Filter;
//import com.longtime.app.base.model.User;
//import com.longtime.app.base.service.UserService;
//import com.longtime.app.util.IdGenerator;
//import com.longtime.app.util.PageUtil;
//import com.longtime.common.utils.HtmlUtils;
//import com.longtime.common.utils.LoginSessionHelper;
//import com.longtime.common.utils.Page;
//import com.longtime.common.utils.QueryCondition;
//import com.longtime.common.utils.ResultSet;
//import com.longtime.common.utils.Sort;
//import com.longtime.message.model.Member;
//
//@Controller("innerMessage")
//@RequestMapping("/base/admin/message")
//public class MessageController {
//	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
//
//	@Resource
//	private UserService userService;
//
//	@Resource
//	private com.longtime.message.service.MessageService messageService;
//
//	@RequestMapping("/index")
//	public String index() {
//		return "base/admin/message/sendmessage";
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "send", method = RequestMethod.POST)
//	public ModelMap sendMessage(HttpServletRequest req, ModelMap modelMap) {
//		String title = req.getParameter("title");
//		String content = req.getParameter("content");
//		String platform = req.getParameter("platform");
//		String isopen = req.getParameter("isopen");// 是否全站公开
//		String url = req.getParameter("url");
//		String type = req.getParameter("type");// 0 域下私信 1 域下公开信 2 全站公开信
//		int itype = Integer.parseInt(type);
//		String userids = req.getParameter("userids");
//		String domain = LoginSessionHelper.getCurrentDomain(req);
//
//		User user = LoginSessionHelper.getCurrentUser(req);
//		String sendName = user.getName();
//		if (StringUtils.isBlank(sendName))
//			sendName = user.getUsername();
//
//		com.longtime.message.model.Message message = new com.longtime.message.model.Message();
//		message.setId(IdGenerator.nextId32().toString());
//		message.setPlatform(platform);// //消息类别
//		message.setTitle(title);
//		message.setContent(content);
//		message.setType(itype);
//		message.setUrl(url);
//		message.setStatus(0);// 发送状态
//		message.setDomain(domain);
//		message.setCreatetime(System.currentTimeMillis());
//		message.setSendid(user.getId());
//		message.setSendname(sendName);
//		message.setIsdel(0);
//
//		logger.debug(message.getId());
//
//		List<Member> members = new ArrayList<Member>();
//		if (itype == com.longtime.message.model.Message.TYPE_PRIVATE) {// 指定用户
//			Iterable<String> idlist = Splitter.on(",").trimResults().omitEmptyStrings().split(userids);
//			for (String id : idlist) {
//				Member member = new Member();
//				member.setTid(id);
//				member.setType(User.USER_TYPE_COMMON);
//				members.add(member);
//			}
//		}  
//
//		messageService.send(message, members);
//		modelMap.put("status", true);
//		return modelMap;
//	}
//
//	/**
//	 * 选择 用户
//	 * 
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = "chooseuser", method = RequestMethod.POST)
//	public String chooseUser(HttpServletRequest req, ModelMap model) {
//		String username = HtmlUtils.getAvailableString(req, "username");
//		String userids = req.getParameter("userids"); 
//		Page page = PageUtil.getPage(req);
//
//		QueryCondition query = new QueryCondition(); 
//		query.addFilterEqual("domain", LoginSessionHelper.getCurrentDomain(req));
//
//		if (StringUtils.isNotBlank(username)) {
//			query.addFilterLike("username", "%" + username + "%");
//		}
//		query.addFilterEqual("isDel", User.ISDEL_NO);
//		query.addSort(new Sort("createTime", Sort.ORDER_DES));
//		model.put("orderField", "createTime");
//		model.put("orderDirection", "_desc");
//		query.addFilterEqual("usertype", User.USER_TYPE_COMMON);
//		ResultSet<User> res = userService.list(query, page);
//
//		model.put("genderMap", User.GENDER_MAP);
//
//		model.put("list", res.getItems());
//		model.put("page", res.getPage());
//		model.put("userids", userids);
//		return "base/admin/message/chooseuserlist";
//	}
//
//	@RequestMapping(value = "user", method = RequestMethod.POST)
//	public String userList(HttpServletRequest req, ModelMap model) {
//		String userids = req.getParameter("userids");
//		String[] array = userids.split(",");
//		List<String> idlist = Arrays.asList(array);
//		Page page = PageUtil.getPage(req);
//		Set<String> set = Sets.newHashSet(idlist);
//
//		QueryCondition query = new QueryCondition();
//		query.addFilter("id", set, Filter.OP_IN);
//		query.addFilterEqual("domain", LoginSessionHelper.getCurrentDomain(req));
//		query.addFilterEqual("isDel", User.ISDEL_NO);
//		query.addSort(new Sort("createTime", Sort.ORDER_DES));
//
//		query.addFilterEqual("usertype", User.USER_TYPE_COMMON);
//		ResultSet<User> res = userService.list(query, page);
//
//		model.put("genderMap", User.GENDER_MAP);
//
//		model.put("list", res.getItems());
//		model.put("page", res.getPage());
//		model.put("userids", userids);
//		return "base/admin/message/userlist";
//	}
//
//}
