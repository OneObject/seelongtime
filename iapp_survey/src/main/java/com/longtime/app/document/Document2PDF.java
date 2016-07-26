package com.longtime.app.document;

import java.io.File;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;

@Component("document2PDF")
public class Document2PDF {

	@Resource
	private OpenOfficeProxy openOfficeProxy;

	/**
	 * 文件转为PDF
	 * @param srcFile word，ppt，excel等文件
	 * @param destFile PDF文件
	 * @throws Exception
	 */
	public void execute(File srcFile,File destFile) throws Exception {
		if(srcFile == null || destFile == null || !srcFile.isFile()){
			return;
		}

        /* 如果源文件就是pdf那么直接复制即可 */
		if ("pdf".equals(FilenameUtils.getExtension(srcFile.getName()).toLowerCase())) {
			
		} else {
			openOfficeProxy.convert(srcFile, destFile);
		}
	}
	

}
