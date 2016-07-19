package com.longtime.app.base.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.googlecode.genericdao.search.Filter;
import com.longtime.app.base.model.DailySign;
import com.longtime.app.base.service.SignService;
import com.longtime.app.util.Constants;
import com.longtime.common.PathServlet;
import com.longtime.common.utils.DateUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.QueryFilter;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;

/**
 * 签到查询
 * @author tangyunfei
 *
 */
@Controller
@RequestMapping("/base/admin/sign/")
public class SignController {
      
	@Resource
	private SignService signService;
	
	private static Logger logger = LoggerFactory.getLogger(SignController.class);
	

	
	
	/**
	 * 得到列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("signlist")
	public String feedlist(HttpServletRequest request, ModelMap model){
		String domain=LoginSessionHelper.getCurrentDomain(request);
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		Long start = null;
		Long end = null;
		if (StringUtils.isNotBlank(startTime)) {
			 start = DateUtils.parseStringToLong(startTime);
		}
		if (StringUtils.isNotBlank(endTime)){
			end = DateUtils.parseStringToLong(endTime);
		}
		int currPage=getCurrpage(request);
		
		Page page=new Page();
		page.setCurrent_page(currPage);
		page.setPage_size(10);
		
		QueryCondition queryCondition=new QueryCondition();
		queryCondition.addFilterEqual("domain",domain);
		if (start!=null) {
			queryCondition.addFilter(new QueryFilter("timestamp", start, Filter.OP_GREATER_OR_EQUAL));
		}
		if (end!=null) {
			queryCondition.addFilter(new QueryFilter("timestamp",end,Filter.OP_LESS_OR_EQUAL));
		}
		queryCondition.addSort(new Sort("timestamp",Sort.ORDER_DES));
		ResultSet<DailySign> rs=this.signService.list(queryCondition,page);
		if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
			model.put("list",rs.getItems());
			model.put("pager",rs.getPage());
		}else {
			model.put("list",Lists.newArrayList());
		}
		return "/base/admin/sign/signlist";
	}
	
	@RequestMapping("/export")
	@ResponseBody
	public String export(HttpServletRequest request,HttpServletResponse response){
		String domain=LoginSessionHelper.getCurrentDomain(request);
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		Long start = null;
		Long end = null;
		if (StringUtils.isNotBlank(startTime)) {
			 start = DateUtils.parseStringToLong(startTime);
		}
		if (StringUtils.isNotBlank(endTime)){
			end = DateUtils.parseStringToLong(endTime);
		}
		
		QueryCondition queryCondition=new QueryCondition();
		queryCondition.addFilterEqual("domain",domain);
		if (start!=null) {
			queryCondition.addFilter(new QueryFilter("timestamp", start, Filter.OP_GREATER_OR_EQUAL));
		}
		if (end!=null) {
			queryCondition.addFilter(new QueryFilter("timestamp",end,Filter.OP_LESS_OR_EQUAL));
		}
		queryCondition.addSort(new Sort("timestamp",Sort.ORDER_DES));
		
		ResultSet<DailySign> rs = this.signService.list(queryCondition,new Page(1, Integer.MAX_VALUE));
		if(rs == null || CollectionUtils.isEmpty(rs.getItems())){
			return "empty";
		}
		
		try {
			String path = createExcel(start,end,rs.getItems(),domain);
			return path;
		} catch (IOException e) {
			logger.error(String.format("export daily sign info due to error,the message is %s",e));
		}
		return "fail";
	}
	
	private String createExcel(Long start, Long end, List<DailySign> list,String domain) throws IOException {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("签到人员列表");
		HSSFRow row = sheet.createRow(0); // 下标为0的行开始
		short height = 30*20;
		row.setHeight(height);
		
		String startTime = "";
		String endTime = "";
		
		if(start != null){
			startTime = DateUtils.longToString(start, "yyyy-MM-dd HH:mm:ss");
		}
		if(end != null){
			endTime = DateUtils.longToString(end, "yyyy-MM-dd HH:mm:ss");
		}
        
		int maxLength = 5;
        HSSFCell[] cells = createCells(row,maxLength);
        String title = String.format("签到时间：%s－%s", startTime,endTime);
        if(StringUtils.isEmpty(startTime) && StringUtils.isEmpty(endTime)){
        	title = "签到时间：所有";
        }
        cells[0].setCellValue(title);
        
        HSSFFont titleFont = getFontStyle(workbook);
    	titleFont.setColor(HSSFColor.BLUE.index);
    	HSSFFont baseFont = getFontStyle(workbook);
        
        HSSFCellStyle style = getOrdinaryCellStyle(workbook,baseFont);
        cells[0].setCellStyle(style);
        CellRangeAddress address = new CellRangeAddress(0, 0,0, maxLength-1);
		sheet.addMergedRegion(address);
		
		row = sheet.createRow(1);
		cells = createCells(row, maxLength);
		cells[0].setCellValue("序号");
		cells[1].setCellValue("姓名");
		cells[2].setCellValue("签到时间");
		cells[3].setCellValue("签到内容");
		cells[4].setCellValue("奖励积分");
		
		cells[0].setCellStyle(style);
		cells[1].setCellStyle(style);
		cells[2].setCellStyle(style);
		cells[3].setCellStyle(style);
		cells[4].setCellStyle(style);
		
		sheet.setColumnWidth(2, 25*256);
		sheet.setColumnWidth(3, 25*256);
		
		int rowNum = 2;
		int index = 1;
		for(DailySign entity : list){
			row = sheet.createRow(rowNum);
			rowNum++;
			cells = createCells(row, maxLength);
			
			cells[0].setCellValue(index);
			cells[1].setCellValue(entity.getUname());
			cells[2].setCellValue(DateUtils.longToString(entity.getTimestamp(),"yyyy-MM-dd HH:mm:ss"));
			cells[3].setCellValue(entity.getContext());
			cells[4].setCellValue(entity.getCredit());
			
			cells[0].setCellStyle(style);
			cells[1].setCellStyle(style);
			cells[2].setCellStyle(style);
			cells[3].setCellStyle(style);
			cells[4].setCellStyle(style);
			
			index++;
		}
		
		String path = String.format("%s%s%s", PathServlet.PATH,Constants.EXPORT_DAILYSIGN_RESULT_PATH,domain);
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
		String absolutePath = String.format("%s/签到人员列表.xls", path);
		File file = new File(absolutePath);
		
		OutputStream out = null;
		try {
			out = new FileOutputStream(file);
			
			workbook.write(out);
		} catch (Exception e) {
			logger.error("export vote survey detail due to error,the message is %s",e);
			throw new RuntimeException(e);
		} finally{
			out.close();
		}
		return String.format("%s%s/%s", Constants.EXPORT_DAILYSIGN_RESULT_PATH,domain,"签到人员列表.xls");
	}
	
	private HSSFFont getFontStyle(HSSFWorkbook workbook){
		HSSFFont font = workbook.createFont();
		font.setFontName("微软雅黑");
		font.setFontHeightInPoints((short)12);
		return font;
	}
	
	private HSSFCellStyle getOrdinaryCellStyle(HSSFWorkbook hwb,HSSFFont font) {
		HSSFCellStyle style=hwb.createCellStyle();
		style.setFont(font);
		return style;
	}
	
	private HSSFCell[] createCells(HSSFRow row, int maxLength) {
		HSSFCell[] cells = new HSSFCell[maxLength];
		for(int i=0;i<maxLength;i++){
			cells[i] = row.createCell(i);
		}
		return cells;
	}

	private int getCurrpage(HttpServletRequest request) {
		String currpage = request.getParameter("currPage");
		
		return NumberUtils.toInt(currpage, 1);
		
	}
}
