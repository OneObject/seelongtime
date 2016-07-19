<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page contentType="text/html; charset=utf-8"%>

<ltacl:res resourceId="500" ctl="false">
	<ltacl:checkAcl resourceId="500">
		<li path="ext" class="${ext}">
			<a href="javascript:;"><i class="glyphicon glyphicon-hdd"></i> <span class="title">扩展功能</span><span class="arrow ${ext_open}"></span> ${ext_select}</a>
			<ul class="sub-menu">
				<ltacl:res resourceId="510" ctl="true">
					<ltacl:checkAcl resourceId="510">
						<li id="ext_resource" class="${ext_resource}"><a
							href="javascript:void(0);" onclick="tourl('resource/resource');">资料库</a>
						</li>
					</ltacl:checkAcl>
				</ltacl:res>
				
				<ltacl:res resourceId="510" ctl="true">
					<ltacl:checkAcl resourceId="510">
						<li id="login_ip" class="${login_ip}"><a
							href="javascript:void(0);" onclick="tourl('mercer/loginip/index');">登录IP详情</a>
						</li>
					</ltacl:checkAcl>
				</ltacl:res>

				<ltacl:res resourceId="520" ctl="false">
					<ltacl:checkAcl resourceId="520">
						<li id="ext_index" class="${ext_index}"><a
							href="javascript:void(0);" onclick="tourl('diyindex/index');">自定义站点</a>
					</ltacl:checkAcl>
				</ltacl:res>
				
				<ltacl:res resourceId="530" ctl="true">
					<ltacl:checkAcl resourceId="530">
						<li id="ext_innovationchose" class="${ext_innovationchose}"><a
							href="javascript:void(0);" onclick="tourl('innovationchose/index');">评选管理</a>
						</li>
					</ltacl:checkAcl>
				</ltacl:res>
					

			</ul>
		</li>
	</ltacl:checkAcl>
</ltacl:res>
<ltacl:res resourceId="900" ctl="true">
	<ltacl:checkAcl resourceId="900">
		<li path="product" class=" ${product}">
			<a href="javascript:;"><i class="glyphicon glyphicon-briefcase"></i> <span class="title">产品管理</span><span class="arrow ${product_open}"></span> ${product_select}</a>
			<ul class="sub-menu">
						<ltacl:res resourceId="910" ctl="true">
						<ltacl:checkAcl resourceId="910">
						<li id="product_index" class="${category}"><a
							href="javascript:void(0);" onclick="tourl('productcategory/index');">产品分类</a>
						</li>
						</ltacl:checkAcl>
						</ltacl:res>
						<ltacl:res resourceId="920" ctl="true">
						<ltacl:checkAcl resourceId="920">
						<li id="product_resource" class="${index}"><a
							href="javascript:void(0);" onclick="tourl('product/index');">产品管理</a>
						</li>
						</ltacl:checkAcl>
						</ltacl:res>
						<ltacl:res resourceId="920" ctl="true">
						<ltacl:checkAcl resourceId="920">
						<li id="product_resource" class="${orgindex}"><a
							href="javascript:void(0);" onclick="tourl('productorg/index');">产品组织控制</a>
						</li>
						</ltacl:checkAcl>
						</ltacl:res>
						
						<ltacl:res resourceId="920" ctl="true">
						<ltacl:checkAcl resourceId="920">
						<li id="product_show" class="${show}"><a
							href="javascript:void(0);" onclick="tourl('productshow/index');">首页最新产品</a>
						</li>
						</ltacl:checkAcl>
						</ltacl:res>

						<ltacl:res resourceId="920" ctl="true">
						<ltacl:checkAcl resourceId="920">
						<li id="product_model" class="${muyang_product_model}"><a
							href="javascript:void(0);" onclick="tourl('muyang/export/index.xhtml');">技术支持</a>
						</li>
						</ltacl:checkAcl>
						
						</ltacl:res>
						<ltacl:res resourceId="920" ctl="true">
					<ltacl:checkAcl resourceId="920">
						<li id="product_information" class="${information}"><a
							href="javascript:void(0);" onclick="tourl('information/index');">产品研发资讯</a>
						</li>
					</ltacl:checkAcl>
										
				 <ltacl:checkAcl resourceId="920">
						<li id="product_information" class="${muyangreport}"><a
							href="javascript:void(0);" onclick="tourl('muyang/report/index');">报表</a>
						</li>
					</ltacl:checkAcl> 
				</ltacl:res> 
						
			</ul>
		</li>
</ltacl:checkAcl>
</ltacl:res>
<ltacl:res resourceId="600" ctl="true">
	<ltacl:checkAcl resourceId="600">
		<li path="bigdata" class='${bigdata}'>
			<a href="javascript:;"><i class="glyphicon glyphicon-signal"></i> <span class="title">大数据</span><span class="arrow ${bigdata_open}"></span>${bigdata_select}</a>
			<ul class="sub-menu">

				<ltacl:res resourceId="610" ctl="true">
					<ltacl:checkAcl resourceId="610">
						<li id="datadetail" class="${detail}"><a
							href="javascript:void(0);"
							onclick="javascript:tourl('/report/appoint/detail/index');">访问明细</a>
						</li>
					</ltacl:checkAcl>
				</ltacl:res>

				<ltacl:res resourceId="620" ctl="true">
					<ltacl:checkAcl resourceId="620">
						<li id="traffic" class="${traffic}"><a
							href="javascript:void(0);"
							onclick="javascript:tourl('/report/appoint/traffic/index');">访问量统计【新奥】</a>
						</li>
					</ltacl:checkAcl>
				</ltacl:res>

				<ltacl:res resourceId="630" ctl="true">
					<ltacl:checkAcl resourceId="630">
						<li id="comment" class="${comment}"><a
							href="javascript:void(0);"
							onclick="javascript:tourl('/report/appoint/comment/index');">课程评论导出</a>
						</li>
					</ltacl:checkAcl>
				</ltacl:res>
				
				<ltacl:res resourceId="640" ctl="true">
					<ltacl:checkAcl resourceId="640">
						<li id="study" class="${study}"><a
							href="javascript:void(0);"
							onclick="javascript:tourl('/report/appoint/study/index');">学习成绩导出</a>
						</li>
					</ltacl:checkAcl>
				</ltacl:res>
				
				<!-- 报表统计 -->
				<ltacl:res resourceId="650" ctl="true">
					<ltacl:checkAcl resourceId="650">
						<li id=searchperson class="${searchperson}"><a
							href="${basepath}/report/system/searchperson.xhtml">人员报表</a>
						</li>
					</ltacl:checkAcl>
				</ltacl:res>
				
				<ltacl:res resourceId="660" ctl="true">
					<ltacl:checkAcl resourceId="660">
						<li id="searchcredit" class="${searchcredit}"><a
							href="${basepath}/report/system/searchcredit.xhtml">积分报表</a>
						</li>
					</ltacl:checkAcl>
				</ltacl:res>
				
				<ltacl:res resourceId="670" ctl="true">
					<ltacl:checkAcl resourceId="670">
						<li id="studysituation" class="${studysituation}"><a
							href="javascript:void(0);"
							onclick="javascript:tourl('/report/appoint/studysituation/index');">学习情况</a>
						</li>
					</ltacl:checkAcl>
				</ltacl:res>
				
				<%--
				<ltacl:res resourceId="620" ctl="true">
					<ltacl:checkAcl resourceId="620">
						<li id="iCoach" class="${iCoach}"><a
							href="javascript:void(0);"
							onclick="javascript:tourl('enn/index');">入职助手</a>
						</li>
					</ltacl:checkAcl>
				</ltacl:res>
				--%>

			</ul>
		</li>
	</ltacl:checkAcl>
</ltacl:res>




<ltacl:res resourceId="1000" ctl="true">
	<ltacl:checkAcl resourceId="1000">
		<li path="icoach" class=" ${icoach}">
			<a href="javascript:;"><i class="glyphicon glyphicon-hdd"></i> <span class="title">iCoach管理</span><span class="arrow ${icoach_open}"></span> ${icoach_select}</a>
			<ul class="sub-menu">
			
			            <ltacl:res resourceId="1010" ctl="true">
								<ltacl:checkAcl resourceId="1010">
			
									<li id="icoachad" class="${icoachad}"><a href="${basepath}/base/admin/enn/ad/index.xhtml">问答页广告位</a>
									</li>
								</ltacl:checkAcl>
						</ltacl:res>
						<ltacl:res resourceId="1010" ctl="true">
								<ltacl:checkAcl resourceId="1010">
			
									<li id="icoachquestion" class="${icoachquestion}"><a href="${basepath}/base/admin/enn/ask/index.xhtml">问答管理</a>
									</li>
								</ltacl:checkAcl>
						</ltacl:res>
						
						<ltacl:res resourceId="1020" ctl="true">
								<ltacl:checkAcl resourceId="1020">
									<li id="icoachtask" class="${icoachtask}"><a href="${basepath}/base/admin/enn/task/index.xhtml">每日任务</a>
									</li>
								</ltacl:checkAcl>
						</ltacl:res>
						
						<ltacl:res resourceId="1030" ctl="true">
								<ltacl:checkAcl resourceId="1030">
									<li id="icoachrelation" class="${icoachrelation}"><a href="${basepath}/base/admin/enn/coach/index.xhtml" >辅导关系</a>
									</li>
								</ltacl:checkAcl>
						</ltacl:res>
						
						<ltacl:res resourceId="1040" ctl="true">
								<ltacl:checkAcl resourceId="1040">
									<li id="icoachplan" class="${icoachplan}"><a  href="${basepath}/base/admin/enn/coachplan/index.xhtml">辅导计划</a>
									</li>
								</ltacl:checkAcl>
						</ltacl:res>
						
						<ltacl:res resourceId="1070" ctl="true">
								<ltacl:checkAcl resourceId="1070">
									<li id="coach" class="${coach}"><a  href="${basepath}/base/admin/enn/coachplan/coach.xhtml">辅导纪录</a>
									</li>
								</ltacl:checkAcl>
						</ltacl:res>	
						
						<ltacl:res resourceId="1090" ctl="true">
								<ltacl:checkAcl resourceId="1090">
						<li id="record" class="${record}"><a  href="${basepath}/base/admin/enn/practice/record.xhtml">实习纪录</a>
									</li>
						</ltacl:checkAcl>
						</ltacl:res>
						
						<ltacl:res resourceId="1100" ctl="true">
								<ltacl:checkAcl resourceId="1100">
						<li id="survey" class="${survey}"><a  href="${basepath}/base/admin/enn/survey/index.xhtml">观察评估</a>
									</li>
						</ltacl:checkAcl>
						</ltacl:res>
					
						<ltacl:res resourceId="1110" ctl="true">
								<ltacl:checkAcl resourceId="1110">
						<li id="surveytea" class="${surveytea}"><a  href="${basepath}/base/admin/enn/survey/indextea.xhtml">对指导人的评价</a>
									</li>
						</ltacl:checkAcl>
						</ltacl:res>
						
						<ltacl:res resourceId="1050" ctl="true">
								<ltacl:checkAcl resourceId="1050">
									<li id="icoachreport" class="${icoachreport}"><a  href="${basepath}/base/admin/enn/report/index.xhtml">报表</a>
									</li>
								</ltacl:checkAcl>
						</ltacl:res>
						
						<ltacl:res resourceId="1060" ctl="true">
								<ltacl:checkAcl resourceId="1060">
									<li id="icoachhr" class="${icoachhr}"><a  href="${basepath}/base/admin/enn/hr/index.xhtml">HR报表</a>
									</li>
								</ltacl:checkAcl>
						</ltacl:res>
						
						<ltacl:res resourceId="1080" ctl="true">
								<ltacl:checkAcl resourceId="1080">
									<li id="appointment" class="${appointment}"><a  href="${basepath}/base/admin/enn/appointment/index.xhtml">预约报表</a>
									</li>
									</ltacl:checkAcl>
						</ltacl:res>
						
			</ul>
		</li>
</ltacl:checkAcl>
</ltacl:res>
