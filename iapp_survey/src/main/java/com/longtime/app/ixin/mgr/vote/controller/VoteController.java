package com.longtime.app.ixin.mgr.vote.controller;

import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFBorderFormatting;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.User;
import com.longtime.app.base.model.UserVo;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.base.service.impl.OrganizationServiceImpl;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceVo;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.service.IXinRuleService;
import com.longtime.app.ixin.mgr.vote.model.VoteActionDetailEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteQuestionEntity;
import com.longtime.app.ixin.mgr.vote.service.VoteOptionService;
import com.longtime.app.ixin.mgr.vote.service.VoteQuestionService;
import com.longtime.app.ixin.mgr.vote.service.VoteService;
import com.longtime.app.ixin.mgr.vote.vo.VoteOptionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteVO;
import com.longtime.app.ixin.utils.DateUtil;
import com.longtime.app.util.Constants;
import com.longtime.app.util.FileUtil;
import com.longtime.app.util.IdGenerator;
import com.longtime.app.util.PageUtil;
import com.longtime.common.PathServlet;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;

@Controller
@RequestMapping("/mgr/vote")
public class VoteController{
	
	private Logger logger = LoggerFactory.getLogger(VoteController.class);

	@Resource
	private OrganizationService organizationService;
	
	@RequestMapping("index")
	public String index(HttpServletRequest request,ModelMap model){
		String surveyOrvote = request.getParameter("surveyOrvote");
		surveyOrvote = "调研";
		HttpSession session = request.getSession();
		session.setAttribute("surveyOrvote",surveyOrvote);
		return "mgr/ixin/vote/index";
	}
	
	@RequestMapping("add")
	public String add(ModelMap model){
		Map<String,String> map = fodderService.getRequiredParams();
		model.put("result", map);
		return "mgr/ixin/vote/add";
	}
	
	@RequestMapping(value="save",method=RequestMethod.POST)
	public String save(HttpServletRequest request){
		String title = request.getParameter("title");
		String coverPath = request.getParameter("coverPath");
		String summary = request.getParameter("summary");
		
		VoteEntity entity = new VoteEntity();
		entity.setTitle(title);
		entity.setCoverPath(coverPath);
		entity.setSummary(StringUtils.isNotBlank(summary) && summary.length()>200 ? summary.substring(0, 200) : summary);
		
		String domain = LoginSessionHelper.getCurrentDomain(request);
		User user = LoginSessionHelper.getCurrentUser(request);
		entity.setDomain(domain);
		entity.setCreator(user.getId());
		entity.setCreatorName(user.getName());
		entity.setCreateTime(System.currentTimeMillis());
		entity.setUpdater(user.getId());
		entity.setUpdaterName(user.getName());
		entity.setUpdatetime(System.currentTimeMillis());
		
		String orgId = user.getOrganization().getId();
		List<String> rootPaths = Lists.newArrayList();
		if(StringUtils.isBlank(orgId)){
			orgId = OrganizationServiceImpl.getRootId(domain);
			rootPaths.add(orgId);
		} else {
			rootPaths = organizationService.getRootPaths(orgId,domain);
		}
		entity.setRootpaths(Joiner.on(",").join(rootPaths));
		entity.setId(IdGenerator.nextId32().toString());
		voteService.insert(entity);
		return String.format("redirect:/mgr/vote/%s.xhtml", entity.getId());
	}
	
	/**
	 * 设置问题
	 * @author yangwenkui
	 * @time 2016年6月17日 下午10:20:03
	 */
	@RequestMapping(value="{id}")
	public String addStep2(@PathVariable String id,ModelMap model){
		model.put("voteId", id);
		model.put("result", fodderService.getRequiredParams());
		return "mgr/ixin/vote/addquestions";
	}
	
	/**
	 * 保存问题
	 * @author yangwenkui
	 * @time 2016年6月18日 下午2:28:12
	 * @param questionVO
	 * @return
	 */
	@RequestMapping(value = "savequestions",method = RequestMethod.POST)
	@ResponseBody
	public String saveQuestions(@RequestBody VoteQuestionVO questionVO){
		boolean flag = voteService.doSaveQuestions(questionVO);
		if(flag)	{
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping("update")
	public String update(@RequestParam("id")String id,ModelMap model){
		Map<String,String> map = fodderService.getRequiredParams();
		model.put("result", map);
		
		VoteEntity entity = voteService.get(id);
		model.put("entity", entity);
		return "mgr/ixin/vote/update";
	}
	
	@RequestMapping(value="updatesave",method=RequestMethod.POST)
	public String updateSave(HttpServletRequest request){
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String coverPath = request.getParameter("coverPath");
		String summary = request.getParameter("summary");
		
		VoteEntity entity = voteService.get(id);
		entity.setTitle(title);
		entity.setCoverPath(coverPath);
		entity.setSummary(StringUtils.isNotBlank(summary) && summary.length()>200 ? summary.substring(0, 200) : summary);
		User user = LoginSessionHelper.getCurrentUser(request);
		entity.setUpdater(user.getId());
		entity.setUpdaterName(user.getName());
		entity.setUpdatetime(System.currentTimeMillis());
		voteService.update(entity);
		return String.format("redirect:/mgr/vote/%s.xhtml", entity.getId());
	}
	
	/**
	 * 获取该问题关联的逻辑跳转
	 * @author yangwenkui
	 * @time 2016年6月17日 下午10:20:03
	 */
	@RequestMapping(value="getrelationinfo")
	public String getRelationInfo(HttpServletRequest req,ModelMap model){
		String id = req.getParameter("id");
		VoteQuestionVO questionVO = voteService.getVoteQuestionVOByQuestionId(id);
		List<VoteQuestionEntity> list = voteQuestionService.findByWeight(id,questionVO.getVoteId(),questionVO.getWeight());
		model.put("question", questionVO);
		model.put("list", list);
		return "mgr/ixin/vote/setrelation";
	}
	
	/**
	 * 保存逻辑调整信息
	 * @author yangwenkui
	 * @time 2016年6月18日 下午10:50:55
	 * @return
	 */
	@RequestMapping(value="setrelations",method=RequestMethod.POST)
	@ResponseBody
	public boolean setRelations(HttpServletRequest req,ModelMap model){
		String questionId = req.getParameter("questionId");
		String relations = req.getParameter("relations");
		if(StringUtils.isBlank(questionId)){
			return false;
		}
		boolean rs = voteQuestionService.doSetRelations(questionId,relations);
		return rs;
	}
	
	/**
	 * 选择调研问卷-弹出列表
	 * @author yangwenkui
	 * @time 2016年6月12日 下午8:54:38
	 * @return
	 */
	@RequestMapping("choosevotelist")
	public String voteActivityList(HttpServletRequest request,ModelMap model){
		String title = request.getParameter("search");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		Page page = PageUtil.getPage(request);
		User user = LoginSessionHelper.getCurrentUser(request);
		String orgId = user.getOrganization().getId();
		QueryCondition query = new QueryCondition();
		if(!user.isSuperadmin()){
			query.addFilterLike("rootpaths", String.format("%%%s%%",orgId));
		}
		if(StringUtils.isNotBlank(title)){
			query.addFilterLike("title", String.format("%%%s%%",title));
		}
		
		query.addFilterEqual("domain", domain);
		query.addFilterEqual("del", com.longtime.app.ixin.mgr.utils.Constants.NO_DEL);
		query.addOrder("updatetime", Sort.Order.DES);
		ResultSet<VoteEntity> rs = voteService.list(query,page);
		model.put("list", rs.getItems());
		model.put("pager",rs.getPage());
		return "mgr/ixin/vote/chooselist";
	}
	
	/**
	 * 编辑问题
	 * @author yangwenkui
	 * @time 2016年6月18日 下午2:28:51
	 * @param voteQuestionId
	 * @return
	 */
	@RequestMapping("updatevotequestion")
	@ResponseBody
	public VoteQuestionVO updateVoteQuestion(@RequestParam("id")String voteQuestionId){
		VoteQuestionVO vo = voteService.getVoteQuestionVOByQuestionId(voteQuestionId);
		return vo;
	}
	
	@RequestMapping("votequestion")
	public String updatevote(HttpServletRequest request,VoteVO vo,ModelMap model){
		String id = request.getParameter("id");
		//保存基础信息
		VoteVO vote = voteService.getVoteVOById(id);
		List<VoteQuestionVO> questions = vote.getQuestions();
		if(null!=questions && !questions.isEmpty()){
			model.put("question", questions.get(0));
		}
		model.put("vote", vote);
		
		model.put("result", fodderService.getRequiredParams());
		return "mgr/ixin/vote/votequestion";
	}
	
	@RequestMapping("deloption")
	@ResponseBody
	public void delOption(@RequestParam("optionId")String optionId){
		voteService.delOption(optionId);
	}
	@RequestMapping("del")
	@ResponseBody
	public void del(@RequestParam("voteId")String voteId){
		voteService.del(voteId);
		iXinRuleService.delBySid(voteId);
	}
	

	@RequestMapping("deletevotequestion")
	@ResponseBody
	public String deleteVoteQuestion(@RequestParam("id")String voteQuestionId){
		voteService.deleteVoteQuestion(voteQuestionId);
		return "success";
	} 
	
	@RequestMapping("deletevoteoption")
	@ResponseBody
	public void deleteVoteOption(@RequestParam("optionId")String optionId){
		voteService.deleteVoteOption(optionId);
	}
	
	
	
	
	//TODO------------------------unuse---------------------------
	
	/**
	 * 投票或调研查询
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="surveyorvotelist",method=RequestMethod.POST)
	@ResponseBody
	public List<ChannelResourceVo> surveyOrVoteList(HttpServletRequest request,ModelMap model){
		String currentpage=request.getParameter("currentpage");
		String domain=LoginSessionHelper.getCurrentDomain(request);
		List<ChannelResourceVo> channelJsonEntities=Lists.newArrayList();
		String pagesize=request.getParameter("pagesize");
		String param=request.getParameter("param");
		String search = request.getParameter("search");
		Page page=new Page(NumberUtils.toInt(currentpage,1),NumberUtils.toInt(pagesize,Page.PAGESIZE_DEFAULT));
		
		List<VoteEntity> votes=this.voteService.querySurveyOrVoteList(NumberUtils.toInt(currentpage,1), NumberUtils.toInt(pagesize,Page.PAGESIZE_DEFAULT), param, domain,search);
		long count=this.voteService.getSurveyOrVoteCount(param, domain,search);
		if(votes!=null && votes.size()>0){
			int length=votes.size();
			page.setTotal_size((int)count);
			for(int i=0;i<length;i++){
				VoteEntity voteEntity=votes.get(i);
				ChannelResourceVo channelJsonEntity=new ChannelResourceVo();
				
				channelJsonEntity.setCreatetime(voteEntity.getCreateTime());
				channelJsonEntity.setCover(voteEntity.getCoverPath());
				channelJsonEntity.setRemark(voteEntity.getSummary());
				channelJsonEntity.setResourceid(voteEntity.getId());
				channelJsonEntity.setTitle(voteEntity.getTitle());
				if(voteEntity.getSurveyOrvote()==0){
					channelJsonEntity.setType(ChannelResourceEntity.VOTE_RESTYPE);
				}else{
					channelJsonEntity.setType(ChannelResourceEntity.SURVEY_RESTYPE);
				}
				channelJsonEntity.setPager(page);
				
				channelJsonEntities.add(channelJsonEntity);
			}
			
		}
		return channelJsonEntities;
	}
	
	
	//保存投票第一步
	@RequestMapping("savestep1")
	public String saveStep1(HttpServletRequest request,VoteVO vo,ModelMap model) throws ParseException{
		String showinlist = request.getParameter("showinlist");
		String showresult = request.getParameter("showresult");
		if(StringUtils.isEmpty(showinlist))
		{
			showinlist = "1";
		}
		if(StringUtils.isEmpty(showresult))
		{
			showresult = "1";
		}
		
		String title=vo.getTitle().trim();
		
		vo.setTitle(title);
		
		VoteEntity entity = VoteVO.castToVoteEntity(vo,request);
		//model.put("id", entity.getId());
		//将日期格式转换为long型存入实体
		long starttime = DateUtil.transferStringDateToLong(VoteVO.DATE_FORMAT, request.getParameter("startTimeStr"));
		long endtime = DateUtil.transferStringDateToLong(VoteVO.DATE_FORMAT, request.getParameter("endTimeStr"));
		entity.setStartTime(starttime);
		entity.setEndTime(endtime);
		//保存基础信息
		entity.setShowinlist(Integer.parseInt(showinlist));
		entity.setShowresult(Integer.parseInt(showresult));
		voteService.saveOrUpdateStep1(entity);
		
		if(entity.getSurveyOrvote() == VoteEntity.VOTE){ //投票
			return "redirect:/mgr/vote/votequestion.xhtml?id="+entity.getId();
		}
		
		return String.format("redirect:/mgr/vote/%s.xhtml", entity.getId());
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("voteStatistics")
	public String voteStatistics(HttpServletRequest request,ModelMap modelMap){
		String voteid=request.getParameter("voteid");
		VoteVO vo = voteService.getVoteVOById(voteid);
		List<VoteActionDetailEntity> actionlist=this.voteService.getVoteAction(voteid);
		modelMap.put("actionlist",actionlist);
		modelMap.put("vo",vo);
		if (vo.getSurveyOrvote()==1) {
			return "/mgr/ixin/vote/statistics";
		}else{
			return "/mgr/ixin/vote/votestatistics";
		}
	}
	
	
	@RequestMapping("changeweight")
	@ResponseBody
	public int upateWeight(HttpServletRequest request){
		String qid = request.getParameter("qid");
		
		String toqid = request.getParameter("toqid");
		
		if(StringUtils.isBlank(qid) || StringUtils.isBlank(toqid)){
			return 0;
		}
		
		long weight = NumberUtils.toLong(request.getParameter("weight"), 0);
		long toweight = NumberUtils.toLong(request.getParameter("toweight"), 0);
		
		if(weight==toweight){
			weight = weight +1;
		}
		this.voteService.updateWeight(toqid, weight);
		this.voteService.updateWeight(qid, toweight);
		
		return 1;
		
		
	}
	
	@RequestMapping("exportsurveyresult")
	@ResponseBody
	public String exportSurveyResult(HttpServletRequest request){
		String voteid=request.getParameter("voteid");
		VoteVO vo = voteService.getVoteVOById(voteid);
		if(vo == null || CollectionUtils.isEmpty(vo.getQuestions())){
			return "illegal";
		}
		
		List<VoteActionDetailEntity> actionlist=this.voteService.getVoteAction(voteid);
		try {
			createResultFile(vo,actionlist);
		} catch (IOException e) {
			logger.error(String.format("export vote survey result due to error,the voteid=%s",vo.getId()),e);
			return "fail";
		}
		
		String path = String.format("%s/%s/%s_统计结果.xlsx", Constants.EXPORT_VOTE_RESULT_PATH,vo.getId(),vo.getTitle());
		return path;
	}
	
	@RequestMapping(value="exportdetail",method=RequestMethod.POST)
	@ResponseBody
	public String exportdetail(HttpServletRequest request){
		String voteid=request.getParameter("voteid");
		VoteVO vo = voteService.getVoteVOById(voteid);
		if(vo == null || CollectionUtils.isEmpty(vo.getQuestions())){
			return "illegal";
		}
		
		List<VoteActionDetailEntity> actionlist=this.voteService.getVoteAction(voteid);
		if(CollectionUtils.isEmpty(actionlist)){
			actionlist = Collections.emptyList();
		}
		try {
			createResultFile1(vo,actionlist);
		} catch (IOException e) {
			logger.error(String.format("export vote survey result due to error,the voteid=%s",vo.getId()),e);
			return "fail";
		}
		
		String path = String.format("%s/%s/%s_统计明细.xlsx", Constants.EXPORT_VOTE_RESULT_PATH,vo.getId(),vo.getTitle());
		logger.debug(String.format("export vote survey detail path: %s", path));
		
		return path;
	}
	
	@RequestMapping("exportsurveydetail")
	@ResponseBody
	public String exportSurveyDetail(HttpServletRequest request){
		String voteid=request.getParameter("voteid");
		VoteVO vo = voteService.getVoteVOById(voteid);
		if(vo == null || CollectionUtils.isEmpty(vo.getQuestions())){
			return "illegal";
		}
		
		List<VoteActionDetailEntity> actionlist=this.voteService.getVoteAction(voteid);
		if(CollectionUtils.isEmpty(actionlist)){
			return "empty";
		}
		
//		Map<String, String> answers = new HashMap<String, String>();
//		List<String> openIds = new ArrayList<String>();
//		Map<String, String> map = new HashMap<String, String>();
//		for(VoteActionDetailEntity detail : actionlist){
//			answers.put(String.format("%s_%s", detail.getOpenid(),detail.getQuestionid()), detail.getOptionid());
//			map.put(detail.getOpenid(), detail.getUid());
//			if(!openIds.contains(detail.getOpenid())){
//				openIds.add(detail.getOpenid());
//			}
//		}
		Map<String, String> answers = new HashMap<String, String>();
		List<String> uids = new ArrayList<String>();
		for(VoteActionDetailEntity detail : actionlist){
			answers.put(String.format("%s_%s", detail.getUid(),detail.getQuestionid()), detail.getOptionid());
			if(!uids.contains(detail.getUid())){
				uids.add(detail.getUid());
			}
		}
		
		int maxLength = getMaxLength(vo);
		
		for (String uid : uids) {
			try {
				createFile(vo,uid,answers,maxLength,request);
			} catch (IOException e) {
				logger.error(String.format("export vote survey detail due to error,the uid=%s,voteid=%s",uid,vo.getId()),e);
				return "fail";
			}
		}
		
		String sourcePath = getDirectory(vo.getId());
		String zipPath = String.format("%s/%s/%s/", PathServlet.PATH,Constants.EXPORT_VOTE_ZIP_PATH,vo.getId());
		try {
			File zipFile = new File(zipPath);
			if(!zipFile.exists()){
				zipFile.mkdirs();
			}
			FileUtil.zip(sourcePath,String.format("%s%s.zip", zipPath,vo.getTitle()));
		} catch (IOException e) {
			logger.error(String.format("zip vote survey detail due to error,the vote'id=%s", vo.getId()),e);
			return "fail";
		}
		
		String zipRelationPath = String.format("%s/%s/%s.zip", Constants.EXPORT_VOTE_ZIP_PATH,vo.getId(),vo.getTitle());
		return zipRelationPath;
	}
	
	private void createResultFile1(VoteVO vo,List<VoteActionDetailEntity> actionlist) throws IOException {
		int maxLength = 2;
		for(int i = 0;i<vo.getQuestions().size();i++){
			
				maxLength++;
			
		}
		
		// 创建Excel文档
		XSSFWorkbook hwb = new XSSFWorkbook();
		
		// sheet 对应一个工作页
		XSSFSheet sheet = hwb.createSheet(vo.getTitle());
		sheet.setColumnWidth(1, 7500);
		
		XSSFRow row = sheet.createRow(0); // 下标为0的行开始
		
		XSSFCell[] cells = createCells(row,maxLength);
		cells[0].setCellValue(String.format("标题：%s", vo.getTitle()));
		
		XSSFFont titleFont = getFontStyle(hwb);
		XSSFColor xssfColor = new XSSFColor(Color.blue);
		titleFont.setColor(xssfColor);
		XSSFFont baseFont = getFontStyle(hwb);
		
		XSSFCellStyle style = getOrdinaryCellStyle(hwb,baseFont);
		cells[0].setCellStyle(style);
		CellRangeAddress address = new CellRangeAddress(0, 0,0, maxLength-1);
		sheet.addMergedRegion(address);
		
//		row = sheet.createRow(2);
//		cells = createCells(row, maxLength);
//		cells[0].setCellValue("用户名");
//		XSSFCellStyle titleStyle = getOrdinaryCellStyle(hwb, titleFont);
//		cells[0].setCellStyle(titleStyle);
//		for (int i =0; i<vo.getQuestions().size() ; i++) {
//			cells[i+1].setCellValue(vo.getQuestions().get(0).getTitle());
//		}
//		
//		int rowNum = 3;
//		int index = 0;
		
		
		
		Map<String, String> answers = new HashMap<String, String>();
		Map<String, String> answersMap = new HashMap<String, String>();
		
		List<String> uids = new ArrayList<String>();
		for(VoteActionDetailEntity detail : actionlist){
			answers.put(String.format("%s_%s", detail.getUid(),detail.getQuestionid()), detail.getOptionid());
			if(!uids.contains(detail.getUid())){
				uids.add(detail.getUid());
			}
		}
		
		//遍历调研题目
		for (int i = 0; i < vo.getQuestions().size(); i++) {
			VoteQuestionVO vo2 = vo.getQuestions().get(i);
			//单选，打分题,多选
			if (vo2.getType() == 1  || vo2.getType() == 4 || vo2.getType() == 2) {
				//遍历选项
				for (VoteOptionVO option : vo2.getOptions()) {
					//获取用户选择的选项名称
					for (String key : answers.keySet()) {
						String value = answers.get(key);
						if(value.contains(option.getId())){
							if (vo2.getType() == 2) {
								String val = StringUtils.isNotBlank(answersMap.get(key))?answersMap.get(key)+","+option.getTitle():option.getTitle();
								answersMap.put(key,val);
							}else{
								
								answersMap.put(key, option.getTitle());
							}
						}
					}

				}
			}
			
			
		}
		row = sheet.createRow(2);
		cells = createCells(row, maxLength);
		cells[0].setCellValue("用户名");
		XSSFCellStyle titleStyle = getOrdinaryCellStyle(hwb, titleFont);
		cells[0].setCellStyle(titleStyle);
		cells[1].setCellValue("姓名");
		cells[1].setCellStyle(titleStyle);
		int index1 = 2;
		for (int i =0; i<vo.getQuestions().size() ; i++) {
			if (vo.getQuestions().get(i).getType()!=5) {
				cells[index1].setCellValue(vo.getQuestions().get(i).getTitle());
				cells[index1].setCellStyle(titleStyle);
				index1++;
			}
		}
		int rowNum = 3;
		
		
		for (String id : uids) {
			int index = 0;
			row = sheet.createRow(rowNum);
			cells = createCells(row, maxLength);
			cells[index].setCellValue(getUName(id));
			cells[index].setCellStyle(getOrdinaryCellStyle(hwb,baseFont));
			index++;
			cells[index].setCellValue(getName(id));
			cells[index].setCellStyle(getOrdinaryCellStyle(hwb,baseFont));
			index++;
			for (int i =0; i<vo.getQuestions().size() ; i++) {
				if (vo.getQuestions().get(i).getType()!=5) {
					String key = id+"_"+vo.getQuestions().get(i).getId();
					if (vo.getQuestions().get(i).getType()==3) {
						
						cells[index].setCellValue(answers.get(key));
					}else{
						
						cells[index].setCellValue(answersMap.get(key));
					}
					
					cells[index].setCellStyle(getOrdinaryCellStyle(hwb,baseFont));
					index++;
				}
			}
			
			rowNum++;
		}
		
		
		String path = String.format("%s%s%s", PathServlet.PATH,Constants.EXPORT_VOTE_RESULT_PATH,vo.getId());
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
		String absolutePath = String.format("%s/%s_统计明细.xlsx", path,vo.getTitle());
		File file = new File(absolutePath);
		
		OutputStream out = null;
		try {
			out = new FileOutputStream(file);
			
			hwb.write(out);
		} catch (Exception e) {
			logger.error("export vote survey detail due to error,the message is %s",e);
			throw new RuntimeException(e);
		} finally{
			out.close();
		}
		
	}
	private void createResultFile(VoteVO vo,List<VoteActionDetailEntity> actionlist) throws IOException {
		int maxLength = 3;
		// 创建Excel文档
        XSSFWorkbook hwb = new XSSFWorkbook();
        
        // sheet 对应一个工作页
        XSSFSheet sheet = hwb.createSheet(vo.getTitle());
        sheet.setColumnWidth(1, 7500);
        
        XSSFRow row = sheet.createRow(0); // 下标为0的行开始
        
        XSSFCell[] cells = createCells(row,maxLength);
        cells[0].setCellValue(String.format("标题：%s", vo.getTitle()));
        
        XSSFFont titleFont = getFontStyle(hwb);
        XSSFColor xssfColor = new XSSFColor(Color.blue);
    	titleFont.setColor(xssfColor);
    	XSSFFont baseFont = getFontStyle(hwb);
        
        XSSFCellStyle style = getOrdinaryCellStyle(hwb,baseFont);
        cells[0].setCellStyle(style);
        CellRangeAddress address = new CellRangeAddress(0, 0,0, maxLength-1);
		sheet.addMergedRegion(address);
		
		row = sheet.createRow(2);
		cells = createCells(row, maxLength);
		cells[0].setCellValue("标题");
		cells[1].setCellValue("选项");
		cells[2].setCellValue("选择人次");
		XSSFCellStyle titleStyle = getOrdinaryCellStyle(hwb, titleFont);
		cells[0].setCellStyle(titleStyle);
		cells[1].setCellStyle(titleStyle);
		cells[2].setCellStyle(titleStyle);
		
		int rowNum = 3;
        int index = 0;
    	
    	// 添加背景色
		XSSFCellStyle questionStyle = getOrdinaryCellStyle(hwb,baseFont);;
		questionStyle.setFillForegroundColor(new XSSFColor(Color.YELLOW));
		questionStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
    	
    	for(VoteQuestionVO question : vo.getQuestions()){
    		if(question.getType() == 5){
    			continue;
    		}
    		index++;
			row = sheet.createRow(rowNum);
			rowNum++;
			cells = createCells(row, maxLength);
			
			switch (question.getType()) {
			case 3://问答题
				//显示题目
				cells[0].setCellValue(String.format("%s、（问答题）%s", index,question.getTitle()));
				cells[0].setCellStyle(questionStyle);
				
				address = new CellRangeAddress(rowNum-1, rowNum-1,0, maxLength-1);
				sheet.addMergedRegion(address);
				
				List<String> answers = getAnswers(question.getId(),actionlist);
				if(CollectionUtils.isEmpty(answers)){
					row = sheet.createRow(rowNum);
					cells = createCells(row, maxLength);
					rowNum++;
					
    				cells[0].setCellValue("暂无回答");
					cells[0].setCellStyle(getOrdinaryCellStyle(hwb,baseFont));
					
					address = new CellRangeAddress(rowNum-1, rowNum-1,0, maxLength-1);
					sheet.addMergedRegion(address);
				} else {
					//显示答案
					for(String answer : answers){
						if(StringUtils.isBlank(answer)){
							continue;
						}
						row = sheet.createRow(rowNum);
						cells = createCells(row, maxLength);
						rowNum++;
						
	    				cells[0].setCellValue(answer);
						cells[0].setCellStyle(getOrdinaryCellStyle(hwb,baseFont));
						
						address = new CellRangeAddress(rowNum-1, rowNum-1,0, maxLength-1);
						sheet.addMergedRegion(address);
					}
				}
				
				rowNum++;
				break;
			case 1:case 2:case 4:
				String questionType = "";
				if(question.getType() == 1){
					questionType = "单选";
				} else if(question.getType() == 2){
					questionType = "多选";
				} else if(question.getType() == 4){
					questionType = "打分";
				}
				//显示题目
				cells[0].setCellValue(String.format("%s、（%s）%s", index,questionType,question.getTitle()));
				cells[0].setCellStyle(questionStyle);
				address = new CellRangeAddress(rowNum-1, rowNum-1,0, maxLength-1);
				sheet.addMergedRegion(address);
				
				
				List<VoteOptionVO> options = question.getOptions();
				for(VoteOptionVO option : options){
					if(StringUtils.isBlank(option.getTitle())){
						continue;
					}
					row = sheet.createRow(rowNum);
					cells = createCells(row, maxLength);
					rowNum++;
					
    				cells[1].setCellValue(option.getTitle());
					cells[1].setCellStyle(getOrdinaryCellStyle(hwb,baseFont));
					
					cells[2].setCellValue(option.getVoteNum());
					cells[2].setCellStyle(getOrdinaryCellStyle(hwb,baseFont));
				
				}
				rowNum++;
				break;
			default:
				break;
			}
		}
    	
    	String path = String.format("%s%s%s", PathServlet.PATH,Constants.EXPORT_VOTE_RESULT_PATH,vo.getId());
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
		String absolutePath = String.format("%s/%s_统计结果.xlsx", path,vo.getTitle());
		File file = new File(absolutePath);
		
		OutputStream out = null;
		try {
			out = new FileOutputStream(file);
			
			hwb.write(out);
		} catch (Exception e) {
			logger.error("export vote survey detail due to error,the message is %s",e);
			throw new RuntimeException(e);
		} finally{
			out.close();
		}
		
	}

	private List<String> getAnswers(String id,List<VoteActionDetailEntity> actionlist) {
		if(CollectionUtils.isEmpty(actionlist)){
			return Collections.emptyList();
		}
		List<String> answers = new ArrayList<String>();
		for(VoteActionDetailEntity entity : actionlist){
			if(id.equals(entity.getQuestionid())){
				answers.add(entity.getOptionid());
			}
		}
		return answers;
	}

	private String getAnswerDetail(Map<String, String> answerMap, String answer) {
		String[] optionIds = answer.split(",");
		StringBuffer buffer = new StringBuffer();
		int i = 0;
		for(String optionId : optionIds){
			String title = answerMap.get(optionId);
			if(StringUtils.isNotBlank(title)){
				buffer.append(title);
				if(i<optionIds.length-1){
					buffer.append("\r\n");
				}
					
			}
			i++;
		}
		return buffer.toString();
	}

	private XSSFCellStyle getOrdinaryCellStyle(XSSFWorkbook hwb,XSSFFont font) {
		XSSFCellStyle style=hwb.createCellStyle();
		style.setFont(font);
		return style;
	}
	
	private XSSFCellStyle getLastCellStyle(XSSFWorkbook hwb,XSSFFont font,boolean afterSection) {
		XSSFCellStyle style=hwb.createCellStyle();
		style.setFont(font);
		if(afterSection){
			style.setBorderRight(XSSFBorderFormatting.BORDER_MEDIUM);
		}
		return style;
	}

	private int getMaxLength(VoteVO vo) {
		int maxLength  = 0;
		for(VoteQuestionVO question :vo.getQuestions()){
			if(question.getOptions() == null){
				continue;
			}
			int size = question.getOptions().size();
			if(maxLength<size){
				maxLength = size;
			}
		}
		if(maxLength == 0){
			maxLength = 1;
		}
		return maxLength+1;
	}

	private void createFile(VoteVO vo,String uid,Map<String, String> answers, int maxLength,HttpServletRequest request) throws IOException {
		String uname = getName(uid);
		String username = getUserName(uid);
		String orgName = getCompanyName(uid, request);
		String path = getDirectory(vo.getId());
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
		String filename = String.format("%s_%s_%s", vo.getTitle(),uid,uname);
		String absolutePath = String.format("%s/%s.xlsx", path,filename);
		File file = new File(absolutePath);
		if(file.exists()){
			return;
		}
	
		// 创建Excel文档
        XSSFWorkbook hwb = new XSSFWorkbook();
        
        // sheet 对应一个工作页
        XSSFSheet sheet = hwb.createSheet(vo.getTitle());
     
        XSSFRow row = sheet.createRow(0); // 下标为0的行开始
        XSSFRow row1 = sheet.createRow(1); // 下标为1的行开始
        XSSFRow row2 = sheet.createRow(2); // 下标为2的行开始
        
        XSSFCell[] cells = createCells(row,maxLength);
        XSSFCell[] cells1 = createCells(row1,maxLength);
        XSSFCell[] cells2 = createCells(row2,maxLength);
        
        cells[0].setCellValue(String.format("学员姓名：%s", uname));
        cells[1].setCellValue(String.format("调研标题：%s", vo.getTitle()));
       
        cells1[0].setCellValue(String.format("学员账号：%s", username));
        cells2[0].setCellValue(String.format("所在部门：%s", orgName));
        
        XSSFFont baseFont = getFontStyle(hwb);
        
        XSSFCellStyle style = hwb.createCellStyle(); 
        style.setFont(baseFont);
        for(int i=0;i<maxLength;i++){
        	cells[i].setCellStyle(style);
        }
        
        int rowNum = 3;
        boolean afterSection = false;
        int index = 0;
        if(CollectionUtils.isNotEmpty(vo.getQuestions())){
        	short borderFormat = XSSFBorderFormatting.BORDER_MEDIUM;
        	boolean isFirst = true;
        	for(VoteQuestionVO question : vo.getQuestions()){
        		index++;
    			row = sheet.createRow(rowNum);
    			rowNum++;
    			cells = createCells(row, maxLength);
    			if(isFirst){
    				isFirst = false;
    				if(question.getType() !=5){
    					afterSection = true;
    					style=hwb.createCellStyle();
    					style.setBorderBottom(borderFormat);
    					style.setFont(baseFont);
    					for(int i=0;i<maxLength;i++){
    						cells[i].setCellStyle(style);
    					}
    					row = sheet.createRow(rowNum);
    	    			rowNum++;
    	    			cells = createCells(row, maxLength);
    				}
    			}
    			
    			String answer = answers.get(String.format("%s_%s", uid,question.getId()));
    			
    			switch (question.getType()) {
				case 5:
					if(afterSection){
						style = hwb.createCellStyle();
						style.setBorderTop(borderFormat);
						for(int i=0;i<maxLength;i++){
							cells[i].setCellStyle(style);
						}
					}
					row = sheet.createRow(rowNum);
					cells = createCells(row, maxLength);
					rowNum++;
					cells[0].setCellValue(question.getTitle());
					style = hwb.createCellStyle();
					style.setBorderTop(borderFormat);
					style.setFont(baseFont);
					for(int i=0;i<maxLength;i++){
						cells[i].setCellStyle(style);
					}
					
					style = hwb.createCellStyle();
					style.setBorderTop(borderFormat);
					style.setFont(baseFont);
					style.setBorderRight(borderFormat);
					cells[maxLength-1].setCellStyle(style);

					afterSection = true;
					index = 0;
					break;
				case 3:
					cells[0].setCellValue(String.format("%s、%s", index,question.getTitle()));
					XSSFCellStyle styleColor = getOrdinaryCellStyle(hwb,baseFont);;
					styleColor.setFillForegroundColor(new XSSFColor(Color.YELLOW));
					styleColor.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
					cells[0].setCellStyle(styleColor);
					
					if(afterSection){
						style = hwb.createCellStyle();
						style.setFont(baseFont);
						style.setBorderRight(borderFormat);
						cells[maxLength-1].setCellStyle(style);
					}
					
					CellRangeAddress address = new CellRangeAddress(rowNum-1, rowNum-1,0, maxLength-1);
					sheet.addMergedRegion(address);
					
					row = sheet.createRow(rowNum);
					cells = createCells(row, maxLength);
					rowNum++;
					
    				cells[0].setCellValue(answer);
    				style = hwb.createCellStyle();
					style.setFont(baseFont);
					cells[0].setCellStyle(style);
    				if(afterSection){
    					style = hwb.createCellStyle();
    					style.setFont(baseFont);
						style.setBorderRight(borderFormat);
						cells[maxLength-1].setCellStyle(style);
					}
					address = new CellRangeAddress(rowNum-1, rowNum-1,0, maxLength-1);
					sheet.addMergedRegion(address);
					
					break;
				case 1:case 2:case 4:
					List<VoteOptionVO> options = question.getOptions();
					cells[0].setCellValue(String.format("%s、%s", index,question.getTitle()));
					style = hwb.createCellStyle();
					style.setFont(baseFont);
					cells[0].setCellStyle(style);
					boolean isLast = false;
    				for(int j=0;j<options.size();j++){
    					VoteOptionVO option = options.get(j);
    					cells[j+1].setCellValue(option.getTitle());
    					style = hwb.createCellStyle();
    					style.setFont(baseFont);
    					cells[j+1].setCellStyle(style);
    					
    					if(StringUtils.isBlank(answer)){
    						continue;
    					}
    					
    					if(answer.contains(option.getId())){
    						style = hwb.createCellStyle();
    						style.setFont(baseFont);
    						style.setFillForegroundColor(new XSSFColor(Color.BLUE));     
    						style.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
    						cells[j+1].setCellStyle(style);
    						
    						if(j+1==maxLength-1){
    							isLast = true;
    						}
    					}
    				}
    				
    				if(afterSection){
    					style = hwb.createCellStyle();
						style.setFont(baseFont);
						if(isLast){
							style.setFillForegroundColor(new XSSFColor(Color.BLUE));     
    						style.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
						}
						style.setBorderRight(borderFormat);
						cells[maxLength-1].setCellStyle(style);
    				}
					break;
				default:
					break;
				}
    		}
        	
        	if(afterSection){
        		row = sheet.createRow(rowNum);
				cells = createCells(row, maxLength);
				rowNum++;
        		style = hwb.createCellStyle();
				style.setFont(baseFont);
				style.setBorderBottom(borderFormat);
				for(int i=0;i<maxLength;i++){
					cells[i].setCellStyle(style);
				}
				
				style = hwb.createCellStyle();
				style.setFont(baseFont);
				style.setBorderBottom(borderFormat);
				style.setBorderRight(borderFormat);
				cells[maxLength-1].setCellStyle(style);
        	}
        }
		
		OutputStream out = null;
		try {
			out = new FileOutputStream(file);
			hwb.write(out);
		} catch (Exception e) {
			logger.error("export vote survey detail due to error,the message is %s",e);
			throw new RuntimeException(e);
		} finally{
			out.close();
		}
	}
	
	private XSSFFont getFontStyle(XSSFWorkbook workbook){
		XSSFFont font = workbook.createFont();
		font.setFontName("微软雅黑");
		font.setFontHeightInPoints((short)12);
		return font;
	}
	
	private XSSFCell[] createCells(XSSFRow row, int maxLength) {
		XSSFCell[] cells = new XSSFCell[maxLength];
		for(int i=0;i<maxLength;i++){
			cells[i] = row.createCell(i);
		}
		return cells;
	}


	private String getName(String uid) {
		String uname = "";
		if(StringUtils.isNotBlank(uid)){
			User user = this.userService.get(uid);
			if(user != null){
				uname = StringUtils.isBlank(user.getName()) ? user.getUsername() : user.getName();
			}
		}
		if(StringUtils.isBlank(uname)){
			uname = uid;
		}
		return uname;
	}
	private String getUName(String uid) {
		String uname = "";
		if(StringUtils.isNotBlank(uid)){
			User user = this.userService.get(uid);
			if(user != null){
				uname =  user.getUsername() ;
			}
		}
		if(StringUtils.isBlank(uname)){
			uname = uid;
		}
		return uname;
	}
	
	
	private String getUserName(String uid) {
		String uname = "";
		if(StringUtils.isNotBlank(uid)){
			User user = this.userService.get(uid);
			if(user != null){
				uname = StringUtils.isBlank(user.getName()) ? user.getUsername() : user.getName();
			}
		}
		if(StringUtils.isBlank(uname)){
			
				uname = uid;
			
		}
		return uname;
	}
	
	
	private String getCompanyName(String uid,HttpServletRequest request) {
		String companyId = "";
		if(StringUtils.isNotBlank(uid)){
			User user = this.userService.get(uid);
			if(user != null){
				companyId = user.getOrganization().getId();
			}
		}
//		String orgName = "";
//		if (StringUtils.isNotBlank(companyId)){
//			List<Organization> orglist = (List<Organization>)this.organizationService.getFatherOrg(companyId, request);
//			if (orglist.size() != 0){
//				for (int i = 0; i < orglist.size(); i++) {
//					orgName = orglist.get(i).getName()+"-->";
//				}
//			}
//		}
		
		String orgName = "";
		if (StringUtils.isNotBlank(companyId)){
		    
		    Organization org =  organizationService.get(companyId);
		    
		    if(null!=org){
		        orgName=   org.getName();
		    }
		}
		
		
		return orgName;
	}

	@RequestMapping("upatevoteweight")
	@ResponseBody
	public long upateVoteWeight(HttpServletRequest request){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String surveyOrvote = request.getParameter("surveyOrvote");
		String vid = request.getParameter("vid");
		String upOrDown = request.getParameter("upOrDown");
		long weight= NumberUtils.toLong(request.getParameter("weight"),0);
		VoteVO vo = new VoteVO();
		if (StringUtils.isNotBlank(upOrDown)){
			//根据条件获取大于或小于当前记录的实体
			vo = this.voteService.queryVoteVOByUpOrDown(domain, NumberUtils.toInt(surveyOrvote), weight, upOrDown,vid);
			long temporary = weight;
			if (vo != null){
				weight = vo.getWeight();
				if (weight == temporary){
					if (upOrDown.equals("up")){
						weight = weight+1;
					}else{
						weight = weight-1;
					}
				}
				long result = voteService.updateVoteAndSurveyWeight(vid, weight);
				voteService.updateVoteAndSurveyWeight(vo.getId(), temporary);
				return result;
			}
			
		}
		return voteService.updateVoteAndSurveyWeight(vid, weight);	
	}
	
	
	private String getDirectory(String vid) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(PathServlet.PATH);
		buffer.append(Constants.EXPORT_VOTE_DETAIL_PATH);
		if(StringUtils.isNotBlank(vid)){
			buffer.append(vid);
		}
		return buffer.toString();
	}
	
	@RequestMapping("copyadd")
	@ResponseBody
	public boolean copyAdd(@RequestParam("id")String voteId,HttpServletRequest request)
	{  
		
//		VoteVO currentVoteVO = voteService.getVoteVOById(voteId);
//		
//		if(null==currentVoteVO){
//			return false;
//		}
//		currentVoteVO.setId("");
//		VoteEntity newVote = VoteVO.castToVoteEntity(currentVoteVO,request);
//		//*
//		newVote.setVoteNum(0);
//		newVote.setWeight(System.currentTimeMillis());
//		newVote.setKeywords(null); //
//		newVote.setTitle(newVote.getTitle() + " (副本)");
//		voteService.saveOrUpdateStep1(newVote);
//		
//		List<VoteQuestionVO> voteQuestionVOs = currentVoteVO.getQuestions();
//		if (voteQuestionVOs!=null&&voteQuestionVOs.size()>0)
//		{
//			for(VoteQuestionVO questionVO : voteQuestionVOs)
//			{
//				VoteQuestionVO newquestionVO = questionVO;
//				newquestionVO.setId(null);
//				VoteQuestionEntity questionEntity = VoteQuestionVO.castToVoteQuestionEntity(newquestionVO);
//				questionEntity.setVoteId(newVote.getId());
//				//*
//				questionEntity.setWeight(System.currentTimeMillis());
//				questionEntity.setVoteNum(0);
//				
////				System.out.println("新增的投票id是："  + newVote.getId());
//				voteService.saveOrUpdateVoteQuestionEntity(questionEntity);
//				
//				List<VoteOptionVO> options = questionVO.getOptions();
////				System.out.println("新增的试题ID" + questionEntity.getId());
//				if(options!=null&&options.size()>0)
//				{
//					for (VoteOptionVO voteOptionVO : options) {
//						VoteOptionVO newvoteOptionVO = voteOptionVO;
//						newvoteOptionVO.setId(null);
//						VoteOptionEntity optionEntity = VoteOptionVO.castToOptionEntity(newvoteOptionVO,questionEntity.getId());
//						optionEntity.setVoteQuestionId(questionEntity.getId());
//						//*
//						optionEntity.setVoteNum(0);
//						
//						voteService.saveOrUpdateVoteOptionEntity(optionEntity);
//					}
//					//newquestionVO.setOptions(options);
//				}
//			}
//		}
		return true;
		
	}
	@RequestMapping("alluserinfo")
	public String questions(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String voteid = request.getParameter("voteid");
		String type = request.getParameter("type");
		model.put("voteid", voteid);
		model.put("type", type);
		return "/mgr/ixin/vote/alluserinfo";
	}
	
	@RequestMapping("querystudentinfo")
	public String querystudentinfo(HttpServletRequest request,ModelMap model){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String voteid=request.getParameter("voteid");
		String type = request.getParameter("type");
		Page page = PageUtil.getPage(request);
		if (type.equals("1")){
			long joinUserCount = this.voteService.getJoinUserCount(domain, voteid);
			List<UserVo> joinUserlist = this.voteService.queryJoinUser(page, domain, voteid);
			page = new Page(page.getCurrent_page(), page.getPage_size());
	        page.setTotal_size((int)joinUserCount);
			model.put("joinUserlist", joinUserlist);
			model.put("pager", page);
			model.put("voteid",voteid);
			return "/mgr/ixin/vote/joinuserlist";
		}else{
			long noJoinUserCount = this.voteService.getNoJoinUserCount(domain, voteid);
			List<UserVo> noJoinUserlist = this.voteService.queryNoJoinUser(page, domain, voteid);
			page = new Page(page.getCurrent_page(), page.getPage_size());
	        page.setTotal_size((int)noJoinUserCount);
			model.put("noJoinUserlist", noJoinUserlist);
			model.put("pager", page);
	        model.put("voteid",voteid);
			return "/mgr/ixin/vote/nojoinuserlist";
		}
		
		
	}
	
	@RequestMapping("updaterelease")
	@ResponseBody
	public boolean updaterelease(HttpServletRequest request){
		String voteId = request.getParameter("id");
		String status = request.getParameter("status");
		if(StringUtils.isBlank(voteId)||StringUtils.isBlank(status))
		{
			return false;
		}
		long result = voteService.updaterelase(voteId, Integer.parseInt(status));
		return result>0;
	}
	
	@RequestMapping("updateshowinlist")
	@ResponseBody
	public boolean updateshowinlist(HttpServletRequest request){
		String voteId = request.getParameter("id");
		String status = request.getParameter("status");
		if(StringUtils.isBlank(voteId)||StringUtils.isBlank(status))
		{
			return false;
		}
		long result = voteService.updateshowinlist(voteId, Integer.parseInt(status));
		return result>0;
	}
	
	@RequestMapping("updateshowresult")
	@ResponseBody
	public boolean updateshowresult(HttpServletRequest request){
		String voteId = request.getParameter("id");
		String status = request.getParameter("status");
		if(StringUtils.isBlank(voteId)||StringUtils.isBlank(status))
		{
			return false;
		}
		long result = voteService.updateshowresult(voteId, Integer.parseInt(status));
		return result>0;
	}
	
	
	@Resource(name="fodderService")
	private FodderService fodderService;
	
	@Resource(name="voteService")
	private VoteService voteService;
	
	@Resource(name="iXinRuleService")
	private IXinRuleService iXinRuleService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "voteQuestionService")
	private VoteQuestionService voteQuestionService;
	
	@Resource(name = "voteOptionService")
	private VoteOptionService voteOptionService;
}
