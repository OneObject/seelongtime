package com.longtime.app.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.util.CellRangeAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class ExcelOptionUtil {
	
	private static Logger logger = LoggerFactory.getLogger(ExcelOptionUtil.class);
	
	public static String getRealNum(double d) {
		DecimalFormat df = new DecimalFormat("########");
		return df.format(d);
	}
	
	public static String getRealDouble(double d) {
		DecimalFormat df = new DecimalFormat("########.###");
		return df.format(d);
	}

	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	static DecimalFormat df = new DecimalFormat("#");
	/**
	 * 获取单元格内的值，该方法内部判断单元格格式，采用相应的方法读取数据返回
	 * @param cell
	 * @return
	 */
	public static String getCellStringValue(HSSFCell cell) {
		String cellValue = "";
		if (cell == null)
			return cellValue;
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_STRING:
			cellValue = cell.getStringCellValue();
			if (cellValue.trim().equals("") || cellValue.trim().length() <= 0)
				cellValue = "";
			break;
		case HSSFCell.CELL_TYPE_NUMERIC:
		    if(HSSFDateUtil.isCellDateFormatted(cell)){
                cellValue= sdf.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue())).toString();//年月日
		    }else{
		        cellValue = df.format(cell.getNumericCellValue());//整型
		    }
			break;
		case HSSFCell.CELL_TYPE_FORMULA: //公式
		    FormulaEvaluator evaluator = cell.getSheet().getWorkbook().getCreationHelper().createFormulaEvaluator();
//		    cell.getCellFormula();
//			cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
//			cellValue = String.valueOf(cell.getNumericCellValue());
		    cellValue =String.valueOf(evaluator.evaluate(cell).getNumberValue());
			break;
		case HSSFCell.CELL_TYPE_BLANK:
			cellValue = "";
			break;
		case HSSFCell.CELL_TYPE_BOOLEAN:
		    cellValue = cell.getBooleanCellValue() + "";
			break;
		case HSSFCell.CELL_TYPE_ERROR:
		    cellValue =  cell.getErrorCellValue() + "";
			break;
		default:
			break;
		}
		return cellValue;
	}
	
	
	public static HSSFFont getFont(HSSFWorkbook workbook){
		HSSFFont font = workbook.createFont();
		return font;
	}
	
	/**
	 * 获取字体格式
	 * @param workbook 
	 * @param fontName  字体名称 如：微软雅黑，宋体等
	 * @param fontSize  字体大小－像素 如：12
	 * @return
	 */
	public static HSSFFont getFont(HSSFWorkbook workbook,String fontName,short fontSize){
		HSSFFont font = workbook.createFont();
		font.setFontName(fontName);
		font.setFontHeightInPoints(fontSize);
		return font;
	}
	
	/**
	 * 获取字体格式
	 * @param workbook 
	 * @param fontName  字体名称 如：微软雅黑，宋体等
	 * @param fontSize  字体大小－像素 如：12
	 * @param color     字体颜色 HSSFColor内的静态变量
	 * @return
	 */
	public static HSSFFont getFont(HSSFWorkbook workbook,String fontName,short fontSize,short color){
		HSSFFont font = workbook.createFont();
		font.setFontName(fontName);
		font.setFontHeightInPoints(fontSize);
		font.setColor(color);
		return font;
	}
	
	/**
	 * 获取字体格式
	 * @param workbook 
	 * @param fontName  字体名称 如：微软雅黑，宋体等
	 * @param fontSize  字体大小－像素 如：12
	 * @param color     字体颜色 HSSFColor内的静态变量
	 * @param weight    字体是否加粗 HSSFFont内的静态变量
	 * @return
	 */
	public static HSSFFont getFont(HSSFWorkbook workbook,String fontName,short fontSize,short color,short weight){
		HSSFFont font = workbook.createFont();
		font.setFontName(fontName);
		font.setFontHeightInPoints(fontSize);
		font.setColor(color);
		font.setBoldweight(weight);
		return font;
	}
	

	public static HSSFCellStyle getCellStyle(HSSFWorkbook workbook){
		HSSFFont font = workbook.createFont();
		font.setFontName("微软雅黑");
		font.setFontHeightInPoints((short)12);
		
		HSSFCellStyle style = workbook.createCellStyle();
		style.setFont(font);
		style.setWrapText(true);
		return style;
	}
	
	public static HSSFCellStyle getBorderCell(HSSFCellStyle style,short borderFormat){
		style.setBorderTop(borderFormat);
		style.setBorderRight(borderFormat);
		style.setBorderBottom(borderFormat);
		style.setBorderLeft(borderFormat);
		return style;
	}
	
	/**
	 * 合并单元格
	 * @param sheet
	 * @param firstRow  要合并的起始行
	 * @param lastRow   要合并的最后行
	 * @param firstCell 要合并的第一个单元格
	 * @param lastCell  要合并的最后一个单元格
	 */
	public static void mergeCells(HSSFSheet sheet,int firstRow,int lastRow,int firstCell,int lastCell){
		CellRangeAddress address = new CellRangeAddress(firstRow, lastRow,firstCell, lastCell);
		sheet.addMergedRegion(address);
	}
	
	/**
	 * 设置单元格背景色
	 * @param style
	 * @param color  HSSFCellStyle内的静态变量 如：HSSFColor.SKY_BLUE.index
	 * @return
	 */
	public static HSSFCellStyle getBackgroundColorStyle(HSSFCellStyle style,short color){
		style.setFillForegroundColor(color);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		return style;
	}
	
	public static HSSFCellStyle getBaseStyle(HSSFWorkbook workbook){
		HSSFCellStyle style = workbook.createCellStyle();
		style.setFont(getFont(workbook, "微软雅黑", (short)10));
		style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		return style;
	}
	
	/**
	 * 设置excel文件内容和格式(仅能设置一个sheet)
	 * @param sheetName sheet名称
	 * @param description 该excel文件的描述
	 * @param filters     过滤条件列表
	 * @param titles      excel内每列内容标题
	 * @param data        excel内容
	 * @return HSSFWorkbook
	 */
	public static HSSFWorkbook createExcel(String sheetName,String description,List<FilterOption> filters,String[] titles,List<Object[]> data){
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet(sheetName);
		boolean isSuccess = createExcel(workbook,sheet, description, filters, titles, data);
		if(isSuccess){
			return workbook;
		}
		return null;
	}
	
	/**
	 * 设置excel文件内容和格式(可设置多个sheet)
	 * @param workbook 
	 * @param sheet 
	 * @param description 该excel文件的描述
	 * @param filters     过滤条件列表
	 * @param titles      excel内每列内容标题
	 * @param data        excel内容
	 * @return 操作成功或失败
	 * @return
	 */
	public static boolean createExcel(HSSFWorkbook workbook,HSSFSheet sheet,String description,List<FilterOption> filters,String[] titles,List<Object[]> data){
		int columnNum = getColumnNum(filters,titles,data);
		createDescription(sheet,description,columnNum);
		createFilter(sheet,filters,columnNum);
		createTitles(sheet,titles,columnNum);
		createResult(sheet,data,columnNum);
		setcolumnWidth(sheet,data,columnNum);
		setCellStyle(workbook,sheet);
		return true;
	}
	
	/**
	 * 设置某一行的行高
	 * @param sheet
	 * @param rowIndex 行下标，从0开始
	 * @param times 几倍行距
	 * @return
	 */
	public static boolean setRowHeight(HSSFWorkbook workbook,int rowIndex,int times){
		HSSFSheet sheet = workbook.getSheetAt(0);
		HSSFRow row = sheet.getRow(rowIndex);
		if(row == null){
			return false;
		}
		short height = (short) (row.getHeight()*times);
		row.setHeight(height);
		return true;
	}
	
	/**
	 * 设置某一行的行高
	 * @param sheet
	 * @param rowIndex 行下标，从0开始
	 * @param times 几倍行距
	 * @return
	 */
	public static boolean setRowHeight(HSSFSheet sheet,int rowIndex,int times){
		HSSFRow row = sheet.getRow(rowIndex);
		if(row == null){
			return false;
		}
		short height = (short) (row.getHeight()*times);
		row.setHeight(height);
		return true;
	}
	
	/**
	 * 根据下标获取sheet
	 * @param workbook
	 * @param index
	 * @return
	 */
	public static HSSFSheet getHSSFSheet(HSSFWorkbook workbook,int index){
		HSSFSheet sheet = workbook.getSheetAt(index);
		return sheet;
	}
	
	/**
	 * 根据下标获取sheet
	 * @param workbook
	 * @param index
	 * @return
	 */
	public static HSSFSheet getHSSFSheet(HSSFWorkbook workbook,String name){
		HSSFSheet sheet = workbook.getSheet(name);
		return sheet;
	}
	
	/**
	 * 根据下标获取sheet
	 * @param workbook
	 * @param index
	 * @return
	 */
	public static HSSFRow getHSSFRow(HSSFWorkbook workbook,int index){
		HSSFSheet sheet = workbook.getSheetAt(0);
		if(sheet == null){
			return null;
		}
		HSSFRow row = sheet.getRow(index);
		return row;
	}
	
	/**
	 * 生成excel文件
	 * @param workbook
	 * @param path 存放文件的路径
	 * @param filename 生成的文件的名称
	 */
	public static void createFile(HSSFWorkbook workbook, String path,String filename) {
		if(workbook == null || StringUtils.isBlank(path) || StringUtils.isBlank(filename)){
			throw new IllegalArgumentException("the arguments workbook,path,filename must not be null..");
		}
		
		File dir = new File(path);
		if(!dir.isDirectory()){
			throw new IllegalArgumentException(String.format("the path=[%s] is not a directory.",path));
		}
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		File file = new File(String.format("%s/%s", path,filename));
		OutputStream out = null;
		try {
			out = new FileOutputStream(file);
			
			workbook.write(out);
		} catch (Exception e) {
			logger.error("ecreateFile due to error,the message is %s",e);
			throw new RuntimeException(e);
		} finally{
			try {
				out.close();
			} catch (IOException e) {
				logger.error("ecreateFile due to error,the message is %s",e);
				throw new RuntimeException(e);
			}
		}
		
	}
	
	private static void setCellStyle(HSSFWorkbook workbook, HSSFSheet sheet) {
		int rowNum = sheet.getLastRowNum();
		HSSFCellStyle style = getCellStyle(workbook);
		for(int rowIndex = 0;rowIndex<=rowNum;rowIndex++){
			HSSFRow row = sheet.getRow(rowIndex);
			if(row == null){
				continue;
			}
			int columnNum = row.getLastCellNum();
			for(int cellIndex=0;cellIndex<columnNum;cellIndex++){
				HSSFCell cell = row.getCell(cellIndex);
				if(cell == null){
					continue;
				}
				cell.setCellStyle(style);
			}
		}
	}
	
	private static int MIN_LENGTH = 10;
	
	private static int MAX_LENGTH = 80;

	private static void setcolumnWidth(HSSFSheet sheet, List<Object[]> data,int columnNum) {
		for(int num=0;num<columnNum;num++){
			int width = getColumnWidth(num,data);
			sheet.setColumnWidth(num, width);
		}
		
	}

	private static int getColumnWidth(int num, List<Object[]> data) {
		int width = MIN_LENGTH;
		for(Object[] items : data){
			Object value = items[num];
			if(value != null && String.valueOf(value).length()>width){
				width = String.valueOf(value).length();
			}
		}
		
		if(width > MAX_LENGTH){
			width = MAX_LENGTH;
		}
		width = width+5;
		return width*256;
	}


	/**
	 * 生成结果部分内容
	 */
	private static void createResult(HSSFSheet sheet, List<Object[]> data,int columnNum) {
		if(CollectionUtils.isEmpty(data)){
			return;
		}
		int rownum = sheet.getLastRowNum()+1;
		for(Object[] items : data){
			HSSFRow row = sheet.createRow(rownum); 
			HSSFCell[] cells = createCells(row,columnNum);
			
			for(int i=0;i<items.length;i++){
				if(items[i] != null){
					String value = String.valueOf(items[i]);
					cells[i].setCellValue(value);
				}
			}
			
			rownum++;
		}
	}

	/**
	 * 生成标题
	 */
	private static void createTitles(HSSFSheet sheet, String[] titles,int columnNum) {
		if(titles == null){
			return ;
		}
		int rownum = sheet.getLastRowNum()+2;
		HSSFRow row = sheet.createRow(rownum); 
		HSSFCell[] cells = createCells(row,columnNum);
		for(int i=0;i<titles.length;i++){
			if(StringUtils.isNotBlank(titles[i])){
				cells[i].setCellValue(titles[i]);
			}
			rownum++;
		}
	}

	/**
	 * 生成过滤条件
	 */
	private static void createFilter(HSSFSheet sheet, List<FilterOption> filters,int columnNum) {
		if(CollectionUtils.isEmpty(filters)){
			return;
		}
		int rownum = sheet.getLastRowNum()+1;
		for(FilterOption filter : filters){
			HSSFRow row = sheet.createRow(rownum); 
			HSSFCell[] cells = createCells(row,columnNum);
			
			if(StringUtils.isNotBlank(filter.getName())){
				cells[0].setCellValue(filter.getName());
			}
			
			if(StringUtils.isNotBlank(filter.getValue())){
				cells[1].setCellValue(filter.getValue());
			}
			
			CellRangeAddress address = new CellRangeAddress(rownum, rownum,1, columnNum-1);
			sheet.addMergedRegion(address);
			
			rownum++;
		}
	}

	/**
	 * 生成描述信息
	 */
	private static void createDescription(HSSFSheet sheet, String description,int columnNum) {
		if(StringUtils.isBlank(description)){
			return;
		}
		int rownum = 0;
		HSSFRow row = sheet.createRow(rownum); 
		HSSFCell[] cells = createCells(row,columnNum);
		cells[0].setCellValue(description);
		
		CellRangeAddress address = new CellRangeAddress(0, 0,0, columnNum-1);
		sheet.addMergedRegion(address);
	}

	/**
	 * 生成单元格
	 */
	private static HSSFCell[] createCells(HSSFRow row, int columnNum) {
		HSSFCell[] cells = new HSSFCell[columnNum];
		for(int i=0;i<columnNum;i++){
			cells[i] = row.createCell(i);
		}
		return cells;
	}
	
	/**
	 * 获得最大列宽
	 */
	private static int getColumnNum(List<FilterOption> filters, String[] titles,List<Object[]> data) {
		int columnNum = 1;
		if(CollectionUtils.isNotEmpty(filters)){
			columnNum = 2;
		}
		
		if(titles != null && titles.length>columnNum){
			columnNum = titles.length;
		}
		
		if(CollectionUtils.isNotEmpty(data) && data.get(0).length>columnNum){
			columnNum = data.get(0).length;
		}
		return columnNum;
	}
}
