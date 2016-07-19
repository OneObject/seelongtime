<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>创建调查页面</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet"
	href="${basepath }/static/survey/plugins/font-awesome-4.1.0/css/font-awesome.min.css">
<link
	href="${basepath }/static/survey/plugins/easydialog-v2.0/easydialog.css"
	rel="stylesheet">
<link
	href="${basepath }/static/survey/plugins/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="${basepath }/static/survey/css/frame.css" rel="stylesheet">
<link href="${basepath }/static/survey/plugins/uploadify/uploadify.css"
	rel="stylesheet" type="text/css" />
<link href="${basepath }/static/survey/css/metallic.css"
	rel="stylesheet">

</head>
<body>

	<div class="container">
		<div class="header">
			<span class="headerleft"><i class="fa fa-deviantart"></i>&nbsp;<label>创建调研</label></span>
			<span class="headerright" title="退出"><i class="fa fa-sign-out"></i></span>
		</div>
		<div class="conainerbox">
			<div class="leftnav">
				<!--左边选择题目类型区域 start-->
				<div class="leftnavheader">
					<i class="fa fa-plus"></i>&nbsp;添加题目
				</div>
				<div class="leftnavitems">
					<span class="navitem" qType="danxuan"><i
						class="fa fa-dot-circle-o"></i>&nbsp;单选题</span> <span class="navitem"
						qType="duoxuan"><i class="fa fa-check-square-o"></i>&nbsp;多选题</span>
					<span class="navitem" qType="wenda"><i class="fa fa-edit"></i>&nbsp;问答题</span>
					<span class="navitem" qType="dafen"><i
						class="fa fa-th-large"></i>&nbsp;打分题</span> <span class="navitem"
						qType="jzdanxuan"><i class="fa fa-columns"></i>&nbsp;矩阵单选</span> <span
						class="navitem" qType="jzduoxuan"><i class="fa fa-table"></i>&nbsp;矩阵多选</span>
					<span class="navitem" qType="duanluo"><i
						class="fa fa-paragraph"></i>&nbsp;段落</span> <span class="navitem"
						qType="fenye"><i class="fa fa-files-o"></i>&nbsp;分页</span>
				</div>
			</div>

			<div class="mainbox">
				<!--题目创建区域 start-->
				<div class="mainheader">
					<!--<span class="mainheaderitem"><i class="fa fa-tachometer"></i>&nbsp;外观设置</span>-->
					<span class="mainheaderitem" id="globalSet1"><i
						class="fa fa-chain"></i>&nbsp;逻辑设置
						<div class="menuBox1" style="display: none;">
							<div class="ttl">
								<span>逻辑设置</span> <i class="fa fa-times"
									onClick="hideMenuBox(this,event);"></i>
							</div>

							<div class="menuLogic">
								<span>已设置跳转条件（<label id="alllogic_num"></label>）
								</span>
								<ul>

								</ul>
							</div>
							<div class="addL" style="display: none">
								<i class="fa fa-plus-square" title="增加一条"
									onClick="addMenuLog(this,event);"></i>
							</div>
							<div class="subBtn" id="logicSet"
								onclick="hideMenuBox(this,event);">
								<span>保存</span>
							</div>

						</div> </span> <span class="mainheaderitem" id="globalSet"><i
						class="fa fa-toggle-down"></i>&nbsp;收集设置
						<div class="menuBox" style="display: none;">
							<div class="ttl">
								<span>收集设置</span> <i class="fa fa-times"
									onClick="hideMenuBox(this,event);"></i>
							</div>
							<div>
								<ul>
									<li class="cur" setType="set1">回答设置</li>
									<li setType="set2">何时结束  </li>
								</ul>
								<div class="clr"></div>
								<c:if test="${show_person_result==1}">
									<c:set var="_show_person_result">checked</c:set>
								</c:if>
								<c:if test="${weixinonly==1}">
									<c:set var="_weixinonly">checked</c:set>
								</c:if>
								<c:if test="${saveuserinfo==1}">
									<c:set var="_saveuserinfo">checked</c:set>
								</c:if>
								<c:if test="${use_collect==1}">
									<c:set var="_use_collect">checked</c:set>
								</c:if>
								<c:if test="${use_date==1}">
									<c:set var="_use_date">checked</c:set>
								</c:if>

								<div>
									<div class="set1" style="display: block;">
										<span> <c:if test="${survey.once_only==1}">
												<input type="checkbox" checked="checked" id="once_only" />
											</c:if> <c:if test="${survey.once_only!=1}">
												<input type="checkbox" id="once_only" />
											</c:if> 每台电脑或手机只能答一次
										</span> <span> <c:if test="${survey.ip_oncepnly==1}">
												<input type="checkbox" checked="checked" id="ip_oncepnly" />
											</c:if> <c:if test="${survey.ip_oncepnly!=1}">
												<input type="checkbox" id="ip_oncepnly" />
											</c:if> 每个IP只能答一次
										</span> <span> <c:if test="${survey.use_pwd==1}">
												<input type="checkbox" checked="checked" id="use_pwd" />
											</c:if> <c:if test="${survey.use_pwd!=1}">
												<input type="checkbox" id="use_pwd" />
											</c:if> 启用访问密码 <c:if test="${ not empty survey.pwd}">
												<input type="text" id="pwd" value="${survey.pwd }"
													style="width: 80px;" />
											</c:if> <c:if test="${empty survey.pwd}">
												<input type="text" id="pwd"
													style="display: none; width: 80px;" />
											</c:if></span> <span id="warn" style="display: none;"><label
											style="font-size: 12px; display: inline-block; padding-left: 35px; color: #D60A17; font-weight: normal;">密码只能为4位英文字母或数字</label></span>

										<span> <c:if test="${survey.show_person_result==1}">
												<input type="checkbox" checked="checked"
													id="show_person_result" />
											</c:if> <c:if test="${survey.show_person_result!=1}">
												<input type="checkbox" id="show_person_result" />
											</c:if> 允许受访人答完问卷后查看结果
										</span> <span> <c:if test="${survey.weixinonly==1}">
												<input type="checkbox" checked="checked" id="weixinonly" />
											</c:if> <c:if test="${survey.weixinonly!=1}">
												<input type="checkbox" id="weixinonly" />
											</c:if> 只能通过微信回答
										</span> <span> <c:if test="${saveuserinfo==1}">
												<input type="checkbox" checked="checked" id="saveuserinfo" />
											</c:if> <c:if test="${saveuserinfo!=1}">
												<input type="checkbox" id="saveuserinfo" />
											</c:if> 记录微信用户个人信息
										</span>
									</div>
									<div class="set2" style="display: none;">
										<span> <c:if test="${use_collect==1}">
												<input type="checkbox" checked="checked" id="use_collect" />
											</c:if> <c:if test="${use_collect!=1}">
												<input type="checkbox" id="use_collect" />
											</c:if> 收集 <input type="text" value="${survey.collect_num}" id="collect_num" />份数据时结束
										</span> <span style="margin-top: 20px;"> <c:if
												test="${use_date==1}">
												<input type="checkbox" checked="checked" id="use_date" />
											</c:if> <c:if test="${use_date!=1}">
												<input type="checkbox" id="use_date" />
											</c:if> 到&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${ltfun:dateLongToStringFormat(survey.end_time,'yyyy-MM-dd') }" id="datePicker" />日结束
										</span>
									</div>
								</div>
								<div class="subBtn" onclick="subBtn(this);">
									<span>保存</span>
								</div>
							</div>
						</div> </span> <span class="mainheaderitem"><i class="fa fa-eye"></i>&nbsp;预览问卷</span>
					<span class="mainheaderitem" onclick="Release()"><i class="fa fa-cloud-upload" ></i>&nbsp;发布问卷</span>
				</div>
				<div class="mainboxbody">
					<div class="cover">
						<div class="leftcontrol">名称</div>
						<div class="rightcontainer">
							<div class="superdo" style="display: none"
								onclick="showdialogedit(this)">
								<i class="fa fa-pencil" title="高级编辑"></i>
							</div>
							<div class="question-title" id="survey_title" style="margin-bottom:0px;">${survey.title
								}</div>
						</div>
					</div>
					<div class="cover">
						<div class="leftcontrol">封面</div>
						<div class="rightcontainer">
							<div id="image_cover">
								<c:if test="${survey.cover ne ''}">
									<img
										src="${result.qiniuImageBasePath}${survey.cover}${result.coverSuffix}"
										class="poster">
								</c:if>
								<c:if test="${empty survey ||survey.cover eq ''}">
									<img src="${basepath }/static/survey/img/poster.jpg"
										class="poster">
								</c:if>
							</div>
							<ul class="postercontrol control" style="display: none;">
								<li title="放大" onclick="magnify(this)"><i
									class="fa fa-search-plus"></i></li>
								<li title="更换" onclick="changeposter(this)"><i
									class="fa fa-exchange"></i></li>
							</ul>
						</div>
					</div>

					<div class="cover judge">
						<div class="leftcontrol">说明</div>

						<div class="rightcontainer">
							<div class="superdo" style="display: none"
								onclick="showdialogedit(this)">
								<i class="fa fa-pencil" title="高级编辑"></i>
							</div>
							<div class="question-title" id="survey_remark"  style="margin-bottom:0px;">${survey.remark
								eq "" ?" ":survey.remark}</div>
						</div>
					</div>
					<div class="sortBox" style="float: left; width: 100%;">

						<c:forEach items="${list}" var="question" varStatus="vs">
							<c:if test="${question.type==1 }">
								<%--单选 --%>
								<div class="item" qType="danxuan" qNum="${question.title_num }"
									data="${question.id }">
									<div class="leftcontrol">
										<label>Q:<c:if test="${question.title_num <10}">00${question.title_num}</c:if>
											<c:if test="${question.title_num >=10}">0${question.title_num}</c:if>
										</label>
										<ul class="gearslist control">
											<li title="题目设置"><i class="fa fa-gears pos"
												onClick="showQSet(this,event);"> </i></li>
											<li title="逻辑设置"><i class="fa fa-link pos"
												onClick="showQSet(this,event);"> </i></li>
											<li title="删除"><i class="fa fa-times"
												onclick="delItem(this,event);"></i></li>
										</ul>
									</div>
									<div class="rightcontainer">
										<div class="superdo" style="display: none;"
											onclick="showdialogedit(this)">
											<i class="fa fa-pencil" title="高级编辑"></i>
										</div>
										<div class="question-title">${question.title}</div>

										<c:forEach var="option" items="${question.options }"
											varStatus="vs">
											<span class="radioitem doitem" data="${option.id }"> <input
												type="radio" hIndex="${vs.index+1 }" /> <span>${option.content
													}</span>
											</span>
										</c:forEach>
										<label class="radioitem control" style="display: none;">
											<i class="fa fa-plus-square" title="增加一行"
											onClick="addOption(this,event);"></i>&nbsp;
										</label>
									</div>
									<ul class="ud_arrow">
										<li><i class="fa fa-angle-up" title="上一题"
											onClick="upItem(this,event);"></i></li>
										<li><i class="fa fa-angle-down" title="下一题"
											onClick="downItem(this,event);"></i></li>

									</ul>
									<c:choose>
										<c:when test="${logicnum[question.id]>0}">
											<div class="logicNum" style="display: block">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>${logicnum[question.id]}</label></span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="logicNum">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>0</label></span>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>
							<c:if test="${question.type==2 }">
								<%--多选  --%>
								<div class="item" qType="duoxuan" qNum="${question.title_num }"
									data="${question.id }">
									<div class="leftcontrol">
										<label>Q:<c:if test="${question.title_num <10}">00${question.title_num}</c:if>
											<c:if test="${question.title_num >=10}">0${question.title_num}</c:if>
										</label>
										<ul class="gearslist control" style="display: none;">
											<li title="题目设置"><i class="fa fa-gears pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="逻辑设置"><i class="fa fa-link pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="删除"><i class="fa fa-times"
												onclick="delItem(this,event);"></i></li>
										</ul>
									</div>
									<div class="rightcontainer">
										<div class="superdo" style="display: none"
											onclick="showdialogedit(this)">
											<i class="fa fa-pencil" title="高级编辑"></i>
										</div>
										<div class="question-title">${question.title }</div>
										<c:forEach items="${question.options}" var="option"
											varStatus="vs">
											<span class="radioitem doitem" data="${option.id }"> <input
												type="checkbox" hIndex="${vs.index+1 }" /> <span>${option.content
													}</span>
											</span>
										</c:forEach>

										<label class="radioitem control" style="display: none;">
											<i class="fa fa-plus-square" title="增加一行"
											onClick="addOption(this,event);"></i>&nbsp;
										</label>
									</div>
									<ul class="ud_arrow">
										<li><i class="fa fa-angle-up" title="上一题"
											onClick="upItem(this,event);"></i></li>
										<li><i class="fa fa-angle-down" title="下一题"
											onClick="downItem(this,event);"></i></li>
									</ul>
									<c:choose>
										<c:when test="${logicnum[question.id]>0}">
											<div class="logicNum" style="display: block">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>${logicnum[question.id]}</label></span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="logicNum">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>0</label></span>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>
							<c:if test="${question.type==4 }">
								<%--打分 --%>
								<div class="item" qType="dafen" qNum="4" data="${question.id }">
									<div class="leftcontrol">
										<label>Q:<c:if test="${question.title_num <10}">00${question.title_num}</c:if>
											<c:if test="${question.title_num >=10}">0${question.title_num}</c:if>
										</label>
										<ul class="gearslist control" style="display: none;">
											<li title="题目设置"><i class="fa fa-gears pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="逻辑设置"><i class="fa fa-link pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="删除"><i class="fa fa-times"
												onclick="delItem(this,event);"></i></li>
										</ul>
									</div>
									<div class="rightcontainer">
										<div class="superdo" style="display: none"
											onclick="showdialogedit(this)">
											<i class="fa fa-pencil" title="高级编辑"></i>
										</div>
										<div class="question-title">${question.title}</div>
										<div class="dafen2">
											<table>
												<tr class="fir">
													<td></td>
													<td class="label3"><label class="a">${question.left_tip
															}</label><label class="b">${question.middle_tip }</label><label
														class="c">${question.right_tip }</label></td>
													<td></td>
												</tr>
												<c:forEach items="${question.options }" var="option"
													varStatus="vs">
													<tr data="${option.id }">
														<td class="ed" hIndex="${vs.index+1 }"><span>${option.content}</span></td>
														<td class="fen"><ul>
																<c:forEach begin="${question.min_score}"
																	end="${question.max_score }" var="i">
																	<c:set var="w"
																		value="${(420-(420%(question.max_score-question.min_score+1)))/(question.max_score-question.min_score+1)}">
																		</c:set>
																	<li style="width: ${w}px">${i}</li>
																</c:forEach>
															</ul></td>
														<td>分</td>
													</tr>
												</c:forEach>
											</table>
										</div>
										<label class="radioitem control" style="display: none;">
											<i class="fa fa-plus-square" title="增加一行"
											onClick="addOption(this,event);"></i>&nbsp;
										</label>
									</div>
									<ul class="ud_arrow">
										<li><i class="fa fa-angle-up" title="上一题"
											onClick="upItem(this,event);"></i></li>
										<li><i class="fa fa-angle-down" title="下一题"
											onClick="downItem(this,event);"></i></li>
									</ul>
									<c:choose>
										<c:when test="${logicnum[question.id]>0}">
											<div class="logicNum" style="display: block">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>${logicnum[question.id]}</label></span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="logicNum">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>0</label></span>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>
							<c:if test="${question.type==3 }">
								<%--问答 --%>
								<div class="item" qType="wenda" qNum="${question.title_num }"
									data="${question.id }">
									<div class="leftcontrol">
										<label>Q:<c:if test="${question.title_num <10}">00${question.title_num}</c:if>
											<c:if test="${question.title_num >=10}">0${question.title_num}</c:if>
										</label>
										<ul class="gearslist control" style="display: none;">
											<li title="题目设置"><i class="fa fa-gears pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="逻辑设置"><i class="fa fa-link pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="删除"><i class="fa fa-times"
												onclick="delItem(this,event);"></i></li>
										</ul>
									</div>
									<div class="rightcontainer">
										<div class="superdo" style="display: none"
											onclick="showdialogedit(this)">
											<i class="fa fa-pencil" title="高级编辑"></i>
										</div>
										<div class="question-title">${question.title}</div>
										<span class="radioitem"> <input type="text"
											class="form-control" />
										</span>
									</div>

									<ul class="ud_arrow">
										<li><i class="fa fa-angle-up" title="上一题"
											onClick="upItem(this,event);"></i></li>
										<li><i class="fa fa-angle-down" title="下一题"
											onClick="downItem(this,event);"></i></li>

									</ul>
									<c:choose>
										<c:when test="${logicnum[question.id]>0}">
											<div class="logicNum" style="display: block">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>${logicnum[question.id]}</label></span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="logicNum">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>0</label></span>
											</div>
										</c:otherwise>
									</c:choose>

								</div>
							</c:if>
							<c:if test="${question.type==5 }">
								<%--矩阵单选题 --%>
								<div class="item" qType="jzdanxuan"
									qNum="${question.title_num }" data="${question.id }">
									<div class="leftcontrol">
										<label>Q:<c:if test="${question.title_num <10}">00${question.title_num}</c:if>
											<c:if test="${question.title_num >=10}">0${question.title_num}</c:if>
										</label>
										<ul class="gearslist control" style="display: none;">
											<li title="题目设置"><i class="fa fa-gears pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="逻辑设置"><i class="fa fa-link pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="删除"><i class="fa fa-times"
												onClick="delItem(this,event);"></i></li>
										</ul>
									</div>
									<div class="rightcontainer">
										<div class="superdo" style="display: none"
											onclick="showdialogedit(this)">
											<i class="fa fa-pencil" title="高级编辑"></i>
										</div>
										<div class="question-title">${question.title }</div>
										<div class="addli control" style="display: none;">
											<i class="fa fa-plus-circle" title="增加一列"
												onClick="addColumn(this,event);"></i>
										</div>
										<div class="tableBox">
											<table class="table table-bordered table-responsive mytable">
												<tr>
													<td><span>&nbsp;</span></td>
													<c:forEach var="option" items="${question.options }"
														varStatus="vs">
														<td class="ed1" lIndex="${vs.index+1 }"
															data="${option.id }"><span>${option.content }</span></td>
													</c:forEach>
												</tr>
												<c:forEach var="matix_option"
													items="${question.matrix_options }" varStatus="vs">
													<tr>
														<td class="ed2" hIndex="${vs.index+1}"
															data="${matix_option.id }"><span>${matix_option.content}</span></td>
														<c:forEach var="option" items="${question.options }"
															varStatus="vs">
															<td><input type="radio"></td>
														</c:forEach>
													</tr>
												</c:forEach>
											</table>
										</div>
										<label class="radioitem control" style="display: none;">
											<i class="fa fa-plus-square" title="增加一行"
											onClick="addOption(this,event);"></i>&nbsp;
										</label>
									</div>

									<ul class="ud_arrow">
										<li><i class="fa fa-angle-up" title="上一题"
											onClick="upItem(this,event);"></i></li>
										<li><i class="fa fa-angle-down" title="下一题"
											onClick="downItem(this,event);"></i></li>

									</ul>

									<c:choose>
										<c:when test="${logicnum[question.id]>0}">
											<div class="logicNum" style="display: block">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>${logicnum[question.id]}</label></span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="logicNum">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>0</label></span>
											</div>
										</c:otherwise>
									</c:choose>

								</div>
							</c:if>
							<c:if test="${question.type==6 }">
								<%--矩阵多选题 --%>
								<div class="item" qType="jzduoxuan"
									qNum="${question.title_num }" data="${question.id }">
									<div class="leftcontrol">
										<label>Q:<c:if test="${question.title_num <10}">00${question.title_num}</c:if>
											<c:if test="${question.title_num >=10}">0${question.title_num}</c:if>
										</label>
										<ul class="gearslist control" style="display: none;">
											<li title="题目设置"><i class="fa fa-gears pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="逻辑设置"><i class="fa fa-link pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="删除"><i class="fa fa-times"
												onclick="delItem(this,event);"></i></li>
										</ul>
									</div>
									<div class="rightcontainer">
										<div class="superdo" style="display: none"
											onclick="showdialogedit(this)">
											<i class="fa fa-pencil" title="高级编辑"></i>
										</div>
										<div class="question-title">${question.title }</div>
										<div class="addli control" style="display: none;">
											<i class="fa fa-plus-circle" title="增加一列"
												onClick="addColumn(this,event);"></i>
										</div>
										<div class="tableBox">
											<table class="table table-bordered table-responsive mytable">
												<tr>
													<td><span>&nbsp;</span></td>
													<c:forEach varStatus="vs" var="option"
														items="${question.options }">
														<td class="ed1" lIndex="${vs.index+1 }"
															data="${option.id }"><span>${option.content }</span></td>
													</c:forEach>
												</tr>
												<c:forEach varStatus="vs" var="matrix_option"
													items="${question.matrix_options }">
													<tr>
														<td class="ed2" hIndex="${vs.index+1 }"
															data="${matrix_option.id}"><span>${matrix_option.content
																}</span></td>
														<c:forEach varStatus="vs" var="option"
															items="${question.options }">
															<td><input type="checkbox"></td>
														</c:forEach>
													</tr>
												</c:forEach>

											</table>
										</div>
										<label class="radioitem control" style="display: none;">
											<i class="fa fa-plus-square" title="增加一行"
											onClick="addOption(this,event);"></i>&nbsp;
										</label>
									</div>

									<ul class="ud_arrow">
										<li><i class="fa fa-angle-up" title="上一题"
											onClick="upItem(this,event);"></i></li>
										<li><i class="fa fa-angle-down" title="下一题"
											onClick="downItem(this,event);"></i></li>
									</ul>

									<c:choose>
										<c:when test="${logicnum[question.id]>0}">
											<div class="logicNum" style="display: block">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>${logicnum[question.id]}</label></span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="logicNum">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>0</label></span>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>
							<c:if test="${question.type==7 }">
								<%--矩阵打分题  暂时不支持 --%>

							</c:if>
							<c:if test="${question.type==8 }">
								<%--8 段落说明 --%>
								<div class="item" qNum="${question.title_num }" qType="duanluo"
									data="${question.id }">
									<div class="leftcontrol">
										<label>Q:<c:if test="${question.title_num <10}">00${question.title_num}</c:if>
											<c:if test="${question.title_num >=10}">0${question.title_num}</c:if>
										</label>
										<ul class="gearslist control" style="display: none;">
											<li title="题目设置"><i class="fa fa-gears pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="逻辑设置"><i class="fa fa-link pos"
												onClick="showQSet(this,event);"></i></li>
											<li title="删除"><i class="fa fa-times"
												onclick="delItem(this,event);"></i></li>
										</ul>
									</div>
									<div class="rightcontainer">
										<div class="superdo" style="display: none"
											onclick="showdialogedit(this)">
											<i class="fa fa-pencil" title="高级编辑"></i>
										</div>
										<div class="question-title">${question.title }</div>
									</div>
									<ul class="ud_arrow">
										<li><i class="fa fa-angle-up" title="上一题"
											onClick="upItem(this,event);"></i></li>
										<li><i class="fa fa-angle-down" title="下一题"
											onClick="downItem(this,event);"></i></li>
									</ul>
									<c:choose>
										<c:when test="${logicnum[question.id]>0}">
											<div class="logicNum" style="display: block">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>${logicnum[question.id]}</label></span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="logicNum">
												<span class="i"><i class="fa fa-link"></i></span><span
													class="n"><label>0</label></span>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>
							<c:if test="${question.type==9 }">
								<%--分页 --%>
								<div class="item page" qType="fenye" data="${question.id}">
									<div class="leftcontrol">
										<ul class="gearslist control">
											<li title="删除"><i class="fa fa-times"
												onclick="delItem(this,${survey.page_num});"></i></li>
										</ul>
									</div>
									<div class="pageDrag">
										<span>页码:&nbsp;&nbsp;<label class="a">${question.page_num}</label>/<label
											class="b">${survey.page_num }</label></span>
									</div>
									<ul class="ud_arrow">
										<li><i class="fa fa-angle-up" title="上一题"
											onClick="upItem(this,event);"></i></li>
										<li><i class="fa fa-angle-down" title="下一题"
											onClick="downItem(this,event);"></i></li>
									</ul>
								</div>
							</c:if>

						</c:forEach>

					</div>
					<div class="item page" qType="fenye">
						<div class="leftcontrol">
							<ul class="gearslist control">
							</ul>
						</div>
						<div class="pageDrag">
							<span>页码:&nbsp;&nbsp;<label class="a" id="endpage">${survey.page_num
									}</label>/<label class="b">${survey.page_num }</label></span>
						</div>
					</div>
				</div>
				<!--题目创建区域 end-->


			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${basepath }/static/survey/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/survey/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/survey/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/survey/plugins/easydialog-v2.0/easydialog.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/survey/plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/survey/plugins/ueditor/ueditor.all.js"></script>
	<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${basepath }/static/survey/js/creatpaper.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/survey/js/dragAndSort.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/survey/js/zebra_datepicker.js"></script>
	<script type="text/javascript">
		var token = "${result.uploadToken}";
		var surveyId = "${survey.id}"
		var qiniuImageBasePath="${result.qiniuImageBasePath}";
		var coverSuffix="${result.coverSuffix}";
	</script>
</body>
</html>
