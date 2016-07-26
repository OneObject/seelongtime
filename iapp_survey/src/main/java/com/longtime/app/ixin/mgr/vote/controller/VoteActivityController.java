package com.longtime.app.ixin.mgr.vote.controller;

import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFBorderFormatting;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.longtime.app.base.model.Authorize;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.LabelEntityService;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.base.service.impl.OrganizationServiceImpl;
import com.longtime.app.document.Document2PDF;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.vote.model.UserVoteEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteActionDetailEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteActivityEntity;
import com.longtime.app.ixin.mgr.vote.service.UserVoteService;
import com.longtime.app.ixin.mgr.vote.service.VoteActionDetailService;
import com.longtime.app.ixin.mgr.vote.service.VoteActivityService;
import com.longtime.app.ixin.mgr.vote.vo.VoteOptionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.app.ixin.utils.DateUtil;
import com.longtime.app.util.Constants;
import com.longtime.app.util.FileUtil;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.PathServlet;
import com.longtime.common.utils.LoginSessionHelper;

@Controller
@RequestMapping("/mgr/voteactivity")
public class VoteActivityController {
	private static final Logger logger = LoggerFactory.getLogger(VoteActivityController.class);

	@Resource(name = "voteActivityService")
	private VoteActivityService voteActivityService;

	@Resource(name = "labelEntityService")
	private LabelEntityService labelEntityService;

	@Resource
	private OrganizationService organizationService;

	@Resource(name = "fodderService")
	private FodderService fodderService;

	@Resource(name = "voteActionDetailService")
	private VoteActionDetailService voteActionDetailService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "userVoteService")
	private UserVoteService userVoteService;

	@Resource(name = "document2PDF")
	private Document2PDF document2PDF;
	/**
	 * 列表页
	 * 
	 * @author yangwenkui
	 * @time 2016年6月12日 下午9:07:25
	 */
	@RequestMapping("index")
	public String index(HttpServletRequest request, ModelMap model) {
		model.put("surveyOrvote", 1);
		return "mgr/ixin/voteactivity/index";
	}

	/**
	 * 新增
	 * 
	 * @author yangwenkui
	 * @time 2016年6月12日 下午9:07:25
	 */
	@RequestMapping("add")
	public String add(ModelMap model) {
		Map<String, String> map = fodderService.getRequiredParams();
		model.put("result", map);
		return "mgr/ixin/voteactivity/add";
	}

	/**
	 * 保存新增记录
	 * 
	 * @author yangwenkui
	 * @time 2016年6月12日 下午9:07:25
	 */
	@RequestMapping("save")
	public String save(HttpServletRequest request) {
		String title = request.getParameter("title");
		String coverPath = request.getParameter("coverPath");
		String author = request.getParameter("author");
		String summary = request.getParameter("summary");
		String voteId = request.getParameter("voteId");
		String voteName = request.getParameter("voteName");
		String labels = request.getParameter("labels");
		String isOpen = request.getParameter("isOpen");
		String isNotify = request.getParameter("isNotify");
		String showresult = request.getParameter("showresult");
		String allowAnonymous = request.getParameter("allowAnonymous");
		String allowUnLogin = request.getParameter("allowUnLogin");
		// 将日期格式转换为long型存入实体
		long starttime = DateUtil.transferStringDateToLong(Constants.DATE_FORMAT, request.getParameter("startTimeStr"));
		long endtime = DateUtil.transferStringDateToLong(Constants.DATE_FORMAT, request.getParameter("endTimeStr"));

		VoteActivityEntity entity = new VoteActivityEntity();
		entity.setTitle(title);
		entity.setCoverPath(coverPath);
		entity.setAuthor(author);
		entity.setSummary(StringUtils.isNotBlank(summary) && summary.length() > 1000 ? summary.substring(0, 1000) : summary);
		entity.setVoteId(voteId);
		entity.setVoteName(voteName);
		entity.setLabels(labels);
		entity.setIsOpen(NumberUtils.toInt(isOpen, 0));
		entity.setIsNotify(NumberUtils.toInt(isNotify, 0));
		entity.setAllowAnonymous(NumberUtils.toInt(allowAnonymous, 0));
		entity.setShowresult(NumberUtils.toInt(showresult, 0));
		entity.setAllowUnLogin(NumberUtils.toInt(allowUnLogin, 0));
		entity.setStartTime(starttime);
		entity.setEndTime(endtime);

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
		if (StringUtils.isBlank(orgId)) {
			orgId = OrganizationServiceImpl.getRootId(domain);
			rootPaths.add(orgId);
		} else {
			rootPaths = organizationService.getRootPaths(orgId, domain);
		}
		entity.setRootpaths(Joiner.on(",").join(rootPaths));
		entity.setId(IdGenerator.nextId32().toString());
		voteActivityService.doAdd(entity, user);

		return "redirect:/mgr/voteactivity/index.xhtml";
	}

	/**
	 * 修改
	 * 
	 * @author yangwenkui
	 * @time 2016年6月12日 下午9:07:25
	 */
	@RequestMapping("update")
	public String update(@RequestParam("id") String id, ModelMap model) {
		Map<String, String> map = fodderService.getRequiredParams();
		model.put("result", map);

		VoteActivityEntity activityEntity = voteActivityService.get(id);
		model.put("entity", activityEntity);
		return "mgr/ixin/voteactivity/update";
	}

	/**
	 * 保存编辑信息
	 * 
	 * @author yangwenkui
	 * @time 2016年6月12日 下午9:07:25
	 */
	@RequestMapping("updatesave")
	public String update(HttpServletRequest request) {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String coverPath = request.getParameter("coverPath");
		String author = request.getParameter("author");
		String summary = request.getParameter("summary");
		String voteId = request.getParameter("voteId");
		String voteName = request.getParameter("voteName");
		String labels = request.getParameter("labels");
		String isOpen = request.getParameter("isOpen");
		String isNotify = request.getParameter("isNotify");
		String showresult = request.getParameter("showresult");
		String allowAnonymous = request.getParameter("allowAnonymous");
		String allowUnLogin = request.getParameter("allowUnLogin");
		// 将日期格式转换为long型存入实体
		long starttime = DateUtil.transferStringDateToLong(Constants.DATE_FORMAT, request.getParameter("startTimeStr"));
		long endtime = DateUtil.transferStringDateToLong(Constants.DATE_FORMAT, request.getParameter("endTimeStr"));

		VoteActivityEntity entity = voteActivityService.get(id);
		entity.setTitle(title);
		entity.setCoverPath(coverPath);
		entity.setAuthor(author);
		entity.setSummary(StringUtils.isNotBlank(summary) && summary.length() > 1000 ? summary.substring(0, 1000) : summary);
		entity.setVoteId(voteId);
		entity.setVoteName(voteName);
		entity.setLabels(labels);
		entity.setIsOpen(NumberUtils.toInt(isOpen, 0));
		entity.setIsNotify(NumberUtils.toInt(isNotify, 0));
		entity.setAllowAnonymous(NumberUtils.toInt(allowAnonymous, 0));
		entity.setAllowUnLogin(NumberUtils.toInt(allowUnLogin, 0));
		entity.setShowresult(NumberUtils.toInt(showresult, 0));
		entity.setStartTime(starttime);
		entity.setEndTime(endtime);

		String domain = LoginSessionHelper.getCurrentDomain(request);
		User user = LoginSessionHelper.getCurrentUser(request);
		entity.setDomain(domain);
		entity.setUpdater(user.getId());
		entity.setUpdaterName(user.getName());
		entity.setUpdatetime(System.currentTimeMillis());
		voteActivityService.doUpdate(entity, user);

		return "redirect:/mgr/voteactivity/index.xhtml";
	}

	/**
	 * 删除调研活动
	 * 
	 * @author yangwenkui
	 * @time 2016年6月13日 下午10:26:29
	 * @param voteId
	 */
	@RequestMapping("del")
	@ResponseBody
	public void del(@RequestParam("id") String id) {
		voteActivityService.deleteById(id);
	}

	/**
	 * 调整排序值
	 * 
	 * @author yangwenkui
	 * @time 2016年6月13日 下午10:26:40
	 * @param request
	 * @return
	 */
	@RequestMapping("upateweight")
	@ResponseBody
	public long upateVoteWeight(HttpServletRequest request) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String vid = request.getParameter("vid");
		String upOrDown = request.getParameter("upOrDown");
		long weight = NumberUtils.toLong(request.getParameter("weight"), 0);
		VoteActivityEntity entity = new VoteActivityEntity();
		VoteActivityEntity source = voteActivityService.get(vid);
		if (StringUtils.isNotBlank(upOrDown)) {
			// 根据条件获取大于或小于当前记录的实体
			entity = this.voteActivityService.findByUpOrDown(domain, weight, upOrDown, vid);
			long temporary = weight;
			if (entity != null) {
				weight = entity.getWeight();
				if (weight == temporary) {
					if (upOrDown.equals("up")) {
						weight = weight + 1;
					} else {
						weight = weight - 1;
					}
				}
				source.setWeight(weight);
				voteActivityService.update(source);

				entity.setWeight(temporary);
				voteActivityService.update(entity);
				return 1;
			}

		}

		source.setWeight(weight);
		voteActivityService.update(source);
		return 1;
	}

	/**
	 * 发布/取消发布
	 * 
	 * @author yangwenkui
	 * @time 2016年6月13日 下午10:56:43
	 * @param request
	 * @return
	 */
	@RequestMapping("updaterelease")
	@ResponseBody
	public boolean updaterelease(HttpServletRequest request) {
		String id = request.getParameter("id");
		String status = request.getParameter("status");
		if (StringUtils.isBlank(id) || StringUtils.isBlank(status)) {
			return false;
		}
		boolean flag = voteActivityService.doRelease(id, status);
		return flag;
	}

	/**
	 * 调研活动授权
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("toauth")
	public String toAuth(HttpServletRequest req, ModelMap model) {
		String rid = req.getParameter("id");
		model.put("rid", rid);
		model.put("rcategory", Authorize.R_CATEGORY_VOTE_ACTIVITY);
		model.put("scategory", Authorize.S_CATEGORY_USER);
		model.put("domain", LoginSessionHelper.getCurrentDomain(req));
		return "mgr/ixin/voteactivity/auth";
	}

	/**
	 * 调研活动-统计
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("statistics")
	public String statistics(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");
		VoteActivityEntity voteActivityEntity = voteActivityService.get(id);
		List<VoteQuestionVO> questions = voteActivityService.getQuestionsWithStatistics(voteActivityEntity);
		String domain = LoginSessionHelper.getCurrentDomain(req);
		// 得到问答题
		List<VoteActionDetailEntity> voteActionDetailEntities = voteActionDetailService.listAskAndFillIn(id, domain);
		for (VoteQuestionVO questionVo : questions) {
			if (questionVo.getType() != 3 && questionVo.getType() != 6) {
				continue;
			}
			List<VoteActionDetailEntity> currentQAnswers = getCurrentQAnswers(questionVo.getId(),
					voteActionDetailEntities);
			if (CollectionUtils.isEmpty(currentQAnswers)) {
				continue;
			}
			if (questionVo.getType() == 3) {
				List<String> answers = new ArrayList<String>(currentQAnswers.size());
				for (VoteActionDetailEntity voteActionDetailEntity : currentQAnswers) {
					answers.add(voteActionDetailEntity.getOptionid());
				}
				questionVo.setAskAnswers(answers);
			}

			if (questionVo.getType() == 6) {
				List<List<String>> answers = new ArrayList<List<String>>(currentQAnswers.size());
				for (VoteActionDetailEntity voteActionDetailEntity : currentQAnswers) {
					List<String> answer = getFillInAnswer(voteActionDetailEntity);
					answers.add(answer);
				}
				questionVo.setFillInAnswers(answers);
			}
		}

		model.put("entity", voteActivityEntity);
		model.put("questions", questions);
		return "mgr/ixin/voteactivity/statistics";
	}

	/**
	 * 获取填空题的答案--解析字符串optionid,#o#answer,#q#optionid,#o#answer,...
	 * @author yangwenkui
	 * @time 2016年7月2日 上午10:57:46
	 * @param voteActionDetailEntity
	 * @return
	 */
	private List<String> getFillInAnswer(VoteActionDetailEntity voteActionDetailEntity) {
		String answerStr = voteActionDetailEntity.getOptionid();
		String[] items = answerStr.split(",#q#");
		if (ArrayUtils.isEmpty(items)) {
			return Lists.newArrayList();
		}
		List<String> answers = new ArrayList<String>();
		for (String item : items) {
			if (StringUtils.isEmpty(item) || !item.contains(",#o#")) {
				continue;
			}
			String[] arr = item.split(",#o#");
			answers.add(arr[1]);
		}
		return answers;
	}

	/**
	 * 获取某道题的答案
	 * @author yangwenkui
	 * @time 2016年7月2日 上午10:16:12
	 * @param id
	 * @param voteActionDetailEntities
	 * @return
	 */
	private List<VoteActionDetailEntity> getCurrentQAnswers(String id,
			List<VoteActionDetailEntity> voteActionDetailEntities) {
		List<VoteActionDetailEntity> list = new ArrayList<VoteActionDetailEntity>();
		for (VoteActionDetailEntity entity : voteActionDetailEntities) {
			if (entity.getQuestionid().equals(id)) {
				list.add(entity);
			}
		}
		return list;
	}

	/**
	 * 调研统计结果
	 * @author yangwenkui
	 * @time 2016年7月4日 下午11:21:44
	 * @param request
	 * @return
	 */
	@RequestMapping("exportsurveyresult")
	@ResponseBody
	public String exportSurveyResult(HttpServletRequest request) {
		String id = request.getParameter("id");
		String isPdf = request.getParameter("pdf");
		VoteActivityEntity voteActivityEntity = voteActivityService.get(id);
		if(voteActivityEntity == null){
			return "illegal";
		}
		List<VoteQuestionVO> questions = voteActivityService.getQuestionsWithStatistics(voteActivityEntity);
		if (CollectionUtils.isEmpty(questions)) {
			return "illegal";
		}

		String domain = LoginSessionHelper.getCurrentDomain(request);
		// 得到问答题
		List<VoteActionDetailEntity> voteActionDetailEntities = voteActionDetailService.listAskAndFillIn(id, domain);
		for (VoteQuestionVO questionVo : questions) {
			if (questionVo.getType() != 3 && questionVo.getType() != 6) {
				continue;
			}
			List<VoteActionDetailEntity> currentQAnswers = getCurrentQAnswers(questionVo.getId(),
					voteActionDetailEntities);
			if (CollectionUtils.isEmpty(currentQAnswers)) {
				continue;
			}
			if (questionVo.getType() == 3) {
				List<String> answers = new ArrayList<String>(currentQAnswers.size());
				for (VoteActionDetailEntity voteActionDetailEntity : currentQAnswers) {
					answers.add(voteActionDetailEntity.getOptionid());
				}
				questionVo.setAskAnswers(answers);
			}

			if (questionVo.getType() == 6) {
				List<List<String>> answers = new ArrayList<List<String>>(currentQAnswers.size());
				for (VoteActionDetailEntity voteActionDetailEntity : currentQAnswers) {
					List<String> answer = getFillInAnswer(voteActionDetailEntity);
					answers.add(answer);
				}
				questionVo.setFillInAnswers(answers);
			}
		}

		try {
			createResultFile(voteActivityEntity, questions, voteActionDetailEntities);
		} catch (Exception e) {
			logger.error(String.format("export survey result due to error,the vote activity id=%s", id), e);
			return "fail";
		}

		String path = String.format("%s/%s/%s_统计结果.xlsx", Constants.EXPORT_VOTE_RESULT_PATH, voteActivityEntity.getId(),
				voteActivityEntity.getTitle());
		
		if("true".equals(isPdf)){
			// TODO  excel to pdf(用于生成PDF)
			
			//path = pdf file path;
			String dir = String.format("%s%s%s", PathServlet.PATH, Constants.EXPORT_VOTE_RESULT_PATH, voteActivityEntity.getId());
			String excelAbsolute = String.format("%s/%s_统计结果.xlsx", dir, voteActivityEntity.getTitle());
			String pdfAbsolute = String.format("%s/%s_统计结果.pdf", dir, voteActivityEntity.getTitle());
			try {
				document2PDF.execute(new File(excelAbsolute), new File(pdfAbsolute));
				path = String.format("%s/%s/%s_统计结果.pdf", Constants.EXPORT_VOTE_RESULT_PATH, voteActivityEntity.getId(),
						voteActivityEntity.getTitle());
			} catch (Exception e) {
				logger.debug("create pdf is failed");
			}
		}
		
		return path;
	}

	/**
	 * 生成调研统计结果
	 * @author yangwenkui
	 * @time 2016年7月2日 下午6:02:21
	 * @param voteActivityEntity
	 * @param questions
	 * @param voteActionDetailEntities
	 * @throws IOException 
	 */
	private void createResultFile(VoteActivityEntity voteActivity, List<VoteQuestionVO> questions,
			List<VoteActionDetailEntity> voteActionDetailEntities) throws IOException {
		int maxLength = 4;
		// 创建Excel文档
		XSSFWorkbook hwb = new XSSFWorkbook();

		// sheet 对应一个工作页
		XSSFSheet sheet = hwb.createSheet(voteActivity.getTitle());
		sheet.setColumnWidth(1, 7500);
		sheet.setColumnWidth(2, 4000);
		sheet.setColumnWidth(3, 4000);
		XSSFRow row = sheet.createRow(0); // 下标为0的行开始

		XSSFCell[] cells = createCells(row, maxLength);
		cells[0].setCellValue(String.format("标题：%s", voteActivity.getTitle()));

		XSSFFont titleFont = getFontStyle(hwb);
		XSSFColor xssfColor = new XSSFColor(Color.blue);
		titleFont.setColor(xssfColor);
		XSSFFont baseFont = getFontStyle(hwb);

		XSSFCellStyle style = getOrdinaryCellStyle(hwb, baseFont);
		cells[0].setCellStyle(style);
		CellRangeAddress address = new CellRangeAddress(0, 0, 0, maxLength - 1);
		sheet.addMergedRegion(address);
		
		row = sheet.createRow(2);
		cells = createCells(row, maxLength);
		cells[0].setCellValue("标题");
		cells[1].setCellValue("选项");
		cells[2].setCellValue("选择人次");
		cells[3].setCellValue("选择比例");		//增加一列
		XSSFCellStyle titleStyle = getOrdinaryCellStyle(hwb, titleFont);
		cells[0].setCellStyle(titleStyle);
		cells[1].setCellStyle(titleStyle);
		cells[2].setCellStyle(titleStyle);
		cells[3].setCellStyle(titleStyle);

		int rowNum = 3;
		int index = 0;

		// 添加背景色
		XSSFCellStyle questionStyle = getOrdinaryCellStyle(hwb, baseFont);
		questionStyle.setFillForegroundColor(new XSSFColor(Color.YELLOW));
		questionStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
		questionStyle.setWrapText(true);

		for (VoteQuestionVO question : questions) {
			if (question.getType() == 5) {
				continue;
			}
			index++;
			row = sheet.createRow(rowNum);
			rowNum++;
			cells = createCells(row, maxLength);

			switch (question.getType()) {
			case 3:// 问答题
				// 显示题目
				cells[0].setCellValue(String.format("%s、（问答题）%s", index, question.getTitle()));
				cells[0].setCellStyle(questionStyle);

				address = new CellRangeAddress(rowNum - 1, rowNum - 1, 0, maxLength - 1);
				sheet.addMergedRegion(address);

				List<String> answers = question.getAskAnswers();
				if (CollectionUtils.isEmpty(answers)) {
					row = sheet.createRow(rowNum);
					cells = createCells(row, maxLength);
					rowNum++;

					cells[0].setCellValue("暂无回答");
					cells[0].setCellStyle(getOrdinaryCellStyle(hwb, baseFont));

					address = new CellRangeAddress(rowNum - 1, rowNum - 1, 0, maxLength - 1);
					sheet.addMergedRegion(address);
				} else {
					// 显示答案
					for (String answer : answers) {
						if (StringUtils.isBlank(answer)) {
							continue;
						}
						row = sheet.createRow(rowNum);
						cells = createCells(row, maxLength);
						rowNum++;

						cells[0].setCellValue(answer);
						cells[0].setCellStyle(getOrdinaryCellStyle(hwb, baseFont));

						address = new CellRangeAddress(rowNum - 1, rowNum - 1, 0, maxLength - 1);
						sheet.addMergedRegion(address);
					}
				}

				rowNum++;
				break;
			case 1:
			case 2:
			case 4:
				String questionType = "";
				if (question.getType() == 1) {
					questionType = "单选";
				} else if (question.getType() == 2) {
					questionType = "多选";
				} else if (question.getType() == 4) {
					questionType = "打分";
				}
				// 显示题目
				cells[0].setCellValue(String.format("%s、（%s）%s", index, questionType, question.getTitle()));
				cells[0].setCellStyle(questionStyle);
				address = new CellRangeAddress(rowNum - 1, rowNum - 1, 0, maxLength - 1);
				sheet.addMergedRegion(address);

				List<VoteOptionVO> options = question.getOptions();
				for (VoteOptionVO option : options) {
					if (StringUtils.isBlank(option.getTitle())) {
						continue;
					}
					row = sheet.createRow(rowNum);
					cells = createCells(row, maxLength);
					rowNum++;

					cells[1].setCellValue(option.getTitle());
					cells[1].setCellStyle(getOrdinaryCellStyle(hwb, baseFont));

					cells[2].setCellValue(option.getVoteNum() + "");
					cells[2].setCellStyle(getOrdinaryCellStyle(hwb, baseFont));
					
					int num = option.getVoteNum();
					if(question.getVoteNum() == 0) {
						num = 0;
					} else {
						num = option.getVoteNum() / question.getVoteNum() * 100;
					}
					
					cells[3].setCellValue(num + "%");
					cells[3].setCellStyle(getOrdinaryCellStyle(hwb, baseFont));

				}
				rowNum++;
				break;
			case 6:
				// 显示题目
				StringBuilder qtitle = new StringBuilder();
				qtitle.append(String.format("%s、（填空题）", index));
				for(VoteOptionVO optionVO : question.getOptions()){
					qtitle.append("\n");
					qtitle.append(optionVO.getTitle()+"( )");
				}
				cells[0].setCellValue(new XSSFRichTextString(qtitle.toString()));
				cells[0].setCellStyle(questionStyle);
				row.setHeightInPoints(sheet.getDefaultRowHeightInPoints()*(question.getOptions().size()+1)+10);

				address = new CellRangeAddress(rowNum - 1, rowNum - 1, 0, maxLength - 1);
				sheet.addMergedRegion(address);

				List<List<String>> fillInAnswers = question.getFillInAnswers();
				if (CollectionUtils.isEmpty(fillInAnswers)) {
					row = sheet.createRow(rowNum);
					cells = createCells(row, maxLength);
					rowNum++;

					cells[0].setCellValue("暂无回答");
					cells[0].setCellStyle(getOrdinaryCellStyle(hwb, baseFont));

					address = new CellRangeAddress(rowNum - 1, rowNum - 1, 0, maxLength - 1);
					sheet.addMergedRegion(address);
				} else {
					// 显示答案
					for (List<String> answer : fillInAnswers) {
						if (CollectionUtils.isEmpty(answer)) {
							continue;
						}
						row = sheet.createRow(rowNum);
						cells = createCells(row, maxLength);
						rowNum++;

						cells[0].setCellValue(Joiner.on(" | ").join(answer));
						cells[0].setCellStyle(getOrdinaryCellStyle(hwb, baseFont));

						address = new CellRangeAddress(rowNum - 1, rowNum - 1, 0, maxLength - 1);
						sheet.addMergedRegion(address);
					}
				}

				rowNum++;
				break;
			default:
				break;
			}
		}

		String path = String.format("%s%s%s", PathServlet.PATH, Constants.EXPORT_VOTE_RESULT_PATH, voteActivity.getId());
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		String absolutePath = String.format("%s/%s_统计结果.xlsx", path, voteActivity.getTitle());
		File file = new File(absolutePath);

		OutputStream out = null;
		try {
			out = new FileOutputStream(file);

			hwb.write(out);
		} catch (Exception e) {
			logger.error("export vote survey detail due to error,the message is %s", e);
			throw new RuntimeException(e);
		} finally {
			out.close();
		}

	}
	
	private XSSFCell[] createCells(XSSFRow row, int maxLength) {
		XSSFCell[] cells = new XSSFCell[maxLength];
		for(int i=0;i<maxLength;i++){
			cells[i] = row.createCell(i);
		}
		return cells;
	}
	
	private XSSFFont getFontStyle(XSSFWorkbook workbook){
		XSSFFont font = workbook.createFont();
		font.setFontName("微软雅黑");
		font.setFontHeightInPoints((short)12);
		return font;
	}
	
	private XSSFCellStyle getOrdinaryCellStyle(XSSFWorkbook hwb,XSSFFont font) {
		XSSFCellStyle style=hwb.createCellStyle();
		style.setFont(font);
		return style;
	}
	
	/**
	 * 导出调研详情
	 * @author yangwenkui
	 * @time 2016年7月4日 下午11:21:21
	 * @param request
	 * @return
	 */
	@RequestMapping(value="exportdetail",method=RequestMethod.POST)
	@ResponseBody
	public String exportdetail(HttpServletRequest request){
		String id = request.getParameter("id");
		VoteActivityEntity voteActivityEntity = voteActivityService.get(id);
		if(voteActivityEntity == null){
			return "illegal";
		}
		List<VoteQuestionVO> questions = voteActivityService.getQuestionsWithStatistics(voteActivityEntity);
		if (CollectionUtils.isEmpty(questions)) {
			return "illegal";
		}

		// 得到问答题
		List<VoteActionDetailEntity> voteActionDetailEntities = voteActionDetailService.listByActivityId(id);
		try {
			createResultFile1(voteActivityEntity,questions,voteActionDetailEntities);
		} catch (Exception e) {
			logger.error(String.format("export vote survey result due to error,the id=%s",voteActivityEntity.getId()),e);
			return "fail";
		}
		
		String path = String.format("%s/%s/%s_统计明细.xlsx", Constants.EXPORT_VOTE_RESULT_PATH,voteActivityEntity.getId(),voteActivityEntity.getTitle());
		logger.debug(String.format("export vote survey detail path: %s", path));
		
		return path;
	}
	
	
	/**
	 * 生成调研详情文件--所有选择内容一个文件形式
	 * @author yangwenkui
	 * @time 2016年7月2日 下午9:59:26
	 * @param voteActivityEntity
	 * @param questions
	 * @param voteActionDetailEntities
	 * @throws IOException 
	 */
	private void createResultFile1(VoteActivityEntity voteActivityEntity, List<VoteQuestionVO> questions,
			List<VoteActionDetailEntity> voteActionDetailEntities) throws IOException {
		int maxLength = 2;
		for(int i = 0;i<questions.size();i++){
			maxLength++;
		}
		
		// 创建Excel文档
		XSSFWorkbook hwb = new XSSFWorkbook();
		// sheet 对应一个工作页
		XSSFSheet sheet = hwb.createSheet(voteActivityEntity.getTitle());
		XSSFRow row = sheet.createRow(0); // 下标为0的行开始
		
		XSSFCell[] cells = createCells(row,maxLength);
		cells[0].setCellValue(String.format("标题：%s", voteActivityEntity.getTitle()));
		
		XSSFFont titleFont = getFontStyle(hwb);
		XSSFColor xssfColor = new XSSFColor(Color.blue);
		titleFont.setColor(xssfColor);
		XSSFFont baseFont = getFontStyle(hwb);
		
		XSSFCellStyle style = getOrdinaryCellStyle(hwb,baseFont);
		cells[0].setCellStyle(style);
		CellRangeAddress address = new CellRangeAddress(0, 0,0, maxLength-1);
		sheet.addMergedRegion(address);
		
		Map<String, String> answers = new HashMap<String, String>();
		Map<String, String> answersMap = new HashMap<String, String>();
		
		List<String> uids = new ArrayList<String>();
		for(VoteActionDetailEntity detail : voteActionDetailEntities){
			String answer = detail.getOptionid();
			if(StringUtils.isNotBlank(answer) && answer.contains(",#o#")){
				List<String> fillInAnswers = getFillInAnswer(detail);
				answer = Joiner.on(" | ").join(fillInAnswers);
			}
			answers.put(String.format("%s_%s", detail.getUid(),detail.getQuestionid()),answer);
			if(!uids.contains(detail.getUid())){
				uids.add(detail.getUid());
			}
		}
		
		//遍历调研题目
		for (int i = 0; i < questions.size(); i++) {
			VoteQuestionVO vo2 = questions.get(i);
			//单选，打分题,多选
			if (vo2.getType() == 1  || vo2.getType() == 4 || vo2.getType() == 2) {
				//遍历选项
				for (VoteOptionVO option : vo2.getOptions()) {
					//获取用户选择的选项名称
					for (String key : answers.keySet()) {
						String value = answers.get(key);
						if(value.contains(option.getId())){
							if (vo2.getType() == 2) {
								String val = StringUtils.isNotBlank(answersMap.get(key))?answersMap.get(key)+",#m#"+option.getTitle():option.getTitle();
								answersMap.put(key,val);
							}else{
								answersMap.put(key, option.getTitle());
							}
						}
					}

				}
			}
			
			
		}
		
		Map<String, String> userVoteMap = Maps.newHashMap();
		if(voteActivityEntity.getAllowAnonymous() == 1){
			List<UserVoteEntity> userVotes = userVoteService.listByActivityId(voteActivityEntity.getId());
			for (UserVoteEntity userVoteEntity : userVotes) {
				userVoteMap.put(userVoteEntity.getBase_uid(), String.valueOf(userVoteEntity.getIsAnonymous()));
			}
		}
		
		row = sheet.createRow(2);
		cells = createCells(row, maxLength);
		cells[0].setCellValue("用户名");
		XSSFCellStyle titleStyle = getOrdinaryCellStyle(hwb, titleFont);
		titleStyle.setWrapText(true);
		cells[0].setCellStyle(titleStyle);
		cells[1].setCellValue("姓名");
		cells[1].setCellStyle(titleStyle);
		int width = 7500;
		sheet.setColumnWidth(0, 5000);
		sheet.setColumnWidth(1, 5000);
		
		int index1 = 2;
		int num = 1;
		for (int i =0; i<questions.size() ; i++) {
			sheet.setColumnWidth(index1, width);
			VoteQuestionVO question = questions.get(i);
			if (question.getType()!=5) {
				String title = question.getTitle();
				if(question.getType() == 6){
					StringBuilder qtitle = new StringBuilder();
					qtitle.append("【填空题】");
					int curNum = 1;
					for(VoteOptionVO optionVO : question.getOptions()){
						qtitle.append("\n");
						qtitle.append(optionVO.getTitle()+"( )");
						curNum++;
					}
					if(num<curNum){
						num = curNum;
					}
					title = qtitle.toString();
				} else {
					title = String.format("%s%s",getQuestionType(question.getType()), title);
				}
				cells[index1].setCellValue(new XSSFRichTextString(title));
				cells[index1].setCellStyle(titleStyle);
				index1++;
			}
		}
		int rowNum = 3;
		row.setHeightInPoints(sheet.getDefaultRowHeightInPoints()*num+10);
		
		XSSFCellStyle cellStyle = getOrdinaryCellStyle(hwb,baseFont);
		cellStyle.setWrapText(true);
		
		for (String id : uids) {
			int index = 0;
			row = sheet.createRow(rowNum);
			cells = createCells(row, maxLength);
			
			if(id.startsWith("l_")){
				cells[index].setCellValue("不记名用户");
				cells[index].setCellStyle(cellStyle);
				index++;
				cells[index].setCellValue("不记名用户");
				cells[index].setCellStyle(cellStyle);
			} else {
				String IsAnonymous = userVoteMap.get(id);
				if(voteActivityEntity.getAllowAnonymous() == 1 && "1".equals(IsAnonymous)){
					cells[index].setCellValue("*****");
					cells[index].setCellStyle(cellStyle);
					index++;
					cells[index].setCellValue("*****");
					cells[index].setCellStyle(cellStyle);
				} else {
					cells[index].setCellValue(getUName(id));
					cells[index].setCellStyle(cellStyle);
					index++;
					cells[index].setCellValue(getName(id));
					cells[index].setCellStyle(cellStyle);
				}
			}
			index++;
			int multiSize = 1;
			for (int i =0; i<questions.size() ; i++) {
				VoteQuestionVO question = questions.get(i);
				if (question.getType()!=5) {
					String key = id+"_"+question.getId();
					if (questions.get(i).getType()==3 || questions.get(i).getType() == 6) {
						cells[index].setCellValue(answers.get(key));
					}else{
						String answer = answersMap.get(key);
						if(StringUtils.isNotBlank(answer) && question.getType() == 2){
							String[] arr = answer.split(",#m#");
							if(multiSize<arr.length){
								multiSize = arr.length;
							}
							answer = Joiner.on("\n").join(arr);
						}
						cells[index].setCellValue(new XSSFRichTextString(answer));
					}
					
					cells[index].setCellStyle(cellStyle);
					index++;
				}
			}
			row.setHeightInPoints(sheet.getDefaultRowHeightInPoints()*multiSize+10);
			rowNum++;
		}
		
		
		String path = String.format("%s%s%s", PathServlet.PATH,Constants.EXPORT_VOTE_RESULT_PATH,voteActivityEntity.getId());
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
		String absolutePath = String.format("%s/%s_统计明细.xlsx", path,voteActivityEntity.getTitle());
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

	/**
	 * 获取题型
	 * @author yangwenkui
	 * @time 2016年7月2日 下午10:24:00
	 * @param type
	 * @return
	 */
	private Object getQuestionType(int type) {
		if(type == 1){
			return "【单选题】";
		} else if(type == 2){
			return "【多选题】";
		} else if(type == 3){
			return "【问答题】";
		} else if(type == 4){
			return "【打分题】";
		}
		return "";
	}

	/**
	 * 导出调研详情--每人一个文件显示调研结果 ---暂未对外提供
	 * @author yangwenkui
	 * @time 2016年7月4日 下午11:18:05
	 * @param request
	 * @return
	 */
	@RequestMapping("exportsurveydetail")
	@ResponseBody
	public String exportSurveyDetail(HttpServletRequest request){
		String id = request.getParameter("id");
		VoteActivityEntity voteActivityEntity = voteActivityService.get(id);
		if(voteActivityEntity == null){
			return "illegal";
		}
		List<VoteQuestionVO> questions = voteActivityService.getQuestionsWithStatistics(voteActivityEntity);
		if (CollectionUtils.isEmpty(questions)) {
			return "illegal";
		}

		// 得到问答题
		List<VoteActionDetailEntity> voteActionDetailEntities = voteActionDetailService.listByActivityId(id);
		for (VoteQuestionVO questionVo : questions) {
			if (questionVo.getType() != 3 && questionVo.getType() != 6) {
				continue;
			}
			List<VoteActionDetailEntity> currentQAnswers = getCurrentQAnswers(questionVo.getId(),
					voteActionDetailEntities);
			if (CollectionUtils.isEmpty(currentQAnswers)) {
				continue;
			}
			if (questionVo.getType() == 3) {
				List<String> answers = new ArrayList<String>(currentQAnswers.size());
				for (VoteActionDetailEntity voteActionDetailEntity : currentQAnswers) {
					answers.add(voteActionDetailEntity.getOptionid());
				}
				questionVo.setAskAnswers(answers);
			}

			if (questionVo.getType() == 6) {
				List<List<String>> answers = new ArrayList<List<String>>(currentQAnswers.size());
				for (VoteActionDetailEntity voteActionDetailEntity : currentQAnswers) {
					List<String> answer = getFillInAnswer(voteActionDetailEntity);
					answers.add(answer);
				}
				questionVo.setFillInAnswers(answers);
			}
		}
		
		Map<String, String> answers = new HashMap<String, String>();
		List<String> uids = new ArrayList<String>();
		for(VoteActionDetailEntity detail : voteActionDetailEntities){
			answers.put(String.format("%s_%s", detail.getUid(),detail.getQuestionid()), detail.getOptionid());
			if(!uids.contains(detail.getUid())){
				uids.add(detail.getUid());
			}
		}
		
		int maxLength = getMaxLength(questions);
		
		for (String uid : uids) {
			try {
				createFile(voteActivityEntity,questions,uid,answers,maxLength,request);
			} catch (Exception e) {
				logger.error(String.format("export vote survey detail due to error,the uid=%s,vote activity id=%s",uid,voteActivityEntity.getId()),e);
				return "fail";
			}
		}
		
		String sourcePath = getDirectory(voteActivityEntity.getId());
		String zipPath = String.format("%s/%s/%s/", PathServlet.PATH,Constants.EXPORT_VOTE_ZIP_PATH,voteActivityEntity.getId());
		try {
			File zipFile = new File(zipPath);
			if(!zipFile.exists()){
				zipFile.mkdirs();
			}
			FileUtil.zip(sourcePath,String.format("%s%s.zip", zipPath,voteActivityEntity.getTitle()));
		} catch (IOException e) {
			logger.error(String.format("zip vote survey detail due to error,the vote'id=%s", voteActivityEntity.getId()),e);
			return "fail";
		}
		
		String zipRelationPath = String.format("%s/%s/%s.zip", Constants.EXPORT_VOTE_ZIP_PATH,voteActivityEntity.getId(),voteActivityEntity.getTitle());
		return zipRelationPath;
	}
	
	/**
	 * 生成调研统计文件--每个参与者一个文件的形式
	 * @author yangwenkui
	 * @time 2016年7月2日 下午9:28:59
	 * @param voteActivityEntity
	 * @param questions
	 * @param uid
	 * @param answers
	 * @param maxLength
	 * @param request
	 * @throws IOException 
	 */
	private void createFile(VoteActivityEntity voteActivityEntity, List<VoteQuestionVO> questions, String uid,
			Map<String, String> answers, int maxLength, HttpServletRequest request) throws IOException {
		String uname = getName(uid);
		String username = getUserName(uid);
		String orgName = getCompanyName(uid, request);
		String path = getDirectory(voteActivityEntity.getId());
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
		String filename = String.format("%s_%s_%s", voteActivityEntity.getTitle(),uid,uname);
		String absolutePath = String.format("%s/%s.xlsx", path,filename);
		File file = new File(absolutePath);
		if(file.exists()){
			return;
		}
	
		// 创建Excel文档
        XSSFWorkbook hwb = new XSSFWorkbook();
        
        // sheet 对应一个工作页
        XSSFSheet sheet = hwb.createSheet(voteActivityEntity.getTitle());
     
        XSSFRow row = sheet.createRow(0); // 下标为0的行开始
        XSSFRow row1 = sheet.createRow(1); // 下标为1的行开始
        XSSFRow row2 = sheet.createRow(2); // 下标为2的行开始
        
        XSSFCell[] cells = createCells(row,maxLength);
        XSSFCell[] cells1 = createCells(row1,maxLength);
        XSSFCell[] cells2 = createCells(row2,maxLength);
        
        cells[0].setCellValue(String.format("学员姓名：%s", uname));
        cells[1].setCellValue(String.format("调研标题：%s", voteActivityEntity.getTitle()));
       
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
        if(CollectionUtils.isNotEmpty(questions)){
        	short borderFormat = XSSFBorderFormatting.BORDER_MEDIUM;
        	boolean isFirst = true;
        	for(VoteQuestionVO question : questions){
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
		
		String orgName = "";
		if (StringUtils.isNotBlank(companyId)){
		    
		    Organization org =  organizationService.get(companyId);
		    
		    if(null!=org){
		        orgName=   org.getName();
		    }
		}
		
		
		return orgName;
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

	private int getMaxLength(List<VoteQuestionVO> questions) {
		int maxLength  = 0;
		for(VoteQuestionVO question : questions){
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

}
