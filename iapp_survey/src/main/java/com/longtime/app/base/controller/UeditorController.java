package com.longtime.app.base.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.longtime.app.config.Constants;
import com.longtime.app.ixin.mgr.model.DocumentEntity;
import com.longtime.app.ixin.mgr.service.DocumentService;
import com.longtime.common.utils.LoginSessionHelper;

/**
 * 编辑器添加视频,文档相关
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/base/admin/ueditor")
public class UeditorController {

	@Resource(name = "documentService")
	private DocumentService documentService;

	/**
	 * 编辑器页面(测试页面)
	 * 
	 * @param mode
	 * @return
	 */
	@RequestMapping("/page")
	public String toEdit(ModelMap mode) {
		return "ueditor_ext/editpage";
	}

	/**
	 * 添加文档弹出框
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/document")
	public String getDocument(HttpServletRequest request, ModelMap model) {
		com.longtime.common.utils.Page page = new com.longtime.common.utils.Page();
		Integer pageNum = getCurrpageI(request, "currPage");// 获取请求页参数
		Integer pageSize = getCurrpageI(request, "pageSize");// 获取请求页面大小参数 
		page.setCurrent_page(pageNum);//页号
		page.setPage_size(pageSize);//页面大小
		List<DocumentEntity> list = getDocumentList(request, page);
 
		for (DocumentEntity doc : list) {
			String path = String
					.format("%s/resource/document/%s/%s/pic/",
							Constants.DOC_SERVER, getSliceDir(doc.getId()),
							doc.getId());
			doc.setPath(path);
		} 

		model.put("pager", page);
		model.put("docs", list);
		return "ueditor_ext/adddocumentdialog";
	}

	private String getSliceDir(String id) {
		int hash = id.hashCode();
		int mod = hash % 100;
		if (mod < 0) {
			mod = -mod;
		}
		return String.valueOf(mod);
	}

	/**
	 * 获取请求页参数
	 * 
	 * @param request
	 * @return
	 */
	private Long getCurrpage(HttpServletRequest request, String param) {
		String currpage = request.getParameter(param);
		return NumberUtils.toLong(currpage);
	}

	/**
	 * 获取请求页参数
	 * 
	 * @param request
	 * @return
	 */
	private Integer getCurrpageI(HttpServletRequest request, String param) {
		String currpage = request.getParameter(param);
		return NumberUtils.toInt(currpage);
	}

	/**
	 * 获取转换成功的文档列表
	 * 
	 * @param request
	 * @param page
	 * @return 文档列表
	 */
	private List<DocumentEntity> getDocumentList(HttpServletRequest request,
			com.longtime.common.utils.Page page) {
		String domain = LoginSessionHelper.getCurrentDomain(request);//域
		com.longtime.common.utils.ResultSet<DocumentEntity> rs = this.documentService
				.queryConvertSuccesslist(domain, page);// 查询转换成功的文档列表
		if (rs != null && rs.getItems() != null && rs.getItems().size() > 0) {
			return rs.getItems();
		} else {
			return new ArrayList<DocumentEntity>();
		}
	}

}
