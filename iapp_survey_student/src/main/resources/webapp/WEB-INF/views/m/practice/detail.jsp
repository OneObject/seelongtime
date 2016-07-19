<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>练习界面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,minimum-scale=1,user-scalable=no,maximum-scale=1,initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<link
	href="http://cdn.bootcss.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<style type="text/css">
html,body {
	margin: 0px;
	padding: 0px;
}

label {
	font-weight: normal;
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

.container {
	width: 100%;
	padding: 8px;
/**	max-width: 760px;*/
	padding-top: 50px;
	padding-bottom: 50px;
	margin-left: 0px;
}

header {
	position: fixed;
	z-index: 9999;
	background-color: #555555;
	color: #FFFFFF;
	height: 50px;
	line-height: 50px;
	width: 100%;
/**	max-width: 760px;*/
	font-size: 18px;
	top: 0px;
	left: 0px;
}

header>a {
	display: block;
	width: 60px;
	text-align: center;
	color: #FFFFFF;
	text-decoration: none;
	float: left;
	background-color: #666666;
}

footer {
	position: fixed;
	z-index: 9999;
	background-color: #555555;
	color: #FFFFFF;
	height: 50px;
	line-height: 50px;
	width: 100%;
/**	max-width: 760px;*/
	font-size: 18px;
	bottom: 0px;
	left: 0px;
}

footer>a {
	display: block;
	width: 50%;
	float: left;
	height: 50px;
	text-align: center;
	color: #FFFFFF;
	text-decoration: none;
}

.timushu {
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #529bea;
}

.leftmsg {
	display: block;
	float: left;
	width: 50%;
	color: #999999;
}

.leftmsg>.fa {
	color: #529bea;
}

.rightmsg {
	width: 50%;
	float: right;
	text-align: right;
	color: #999999;
}

.testitem {
	padding: 10px 0px;
}

.itemname {
	font-size: 24px;
	font-weight: bold;
	line-height: 40px;
}

.testitem label {
	display: block;
	overflow: hidden;
	line-height: 36px;
	font-size: 18px;
	border: 1px solid #eaeaea;
	margin-bottom: 10px;;
}

.testitem .rightanswer {
	color: #009C0C;
	border: 1px solid #009C0C;
}

.testitem .erroranswer {
	color: #e23d3a;
	border: 1px solid #e23d3a;
}

#jishi {
	position: absolute;
	z-index: 9999;
	left: 30%;
	display: block;
	width: 150px;
	background-color: #00E3E3;
	color: #FFFFFF;
	height: 50px;
	text-align: center;
	line-height: 50px;
	border-radius: 5px;
	bottom: 70px;
}
</style>
<script type="text/javascript">
var answerarray = new Array([${fn:length(questions)}]);//所有问题答案
var idarray = new Array([${fn:length(questions)}]); //所有问题id数组
var index = 1;//当前题号
</script>
</head>
<body>
		<header>
	<c:if test="${not empty courseid }">
			<a href="javascript:void(0)" onclick="returnCourse('${courseid}')"><i
				class="fa fa-angle-left"></i>&nbsp;返回</a>
	</c:if>
	${practice.name }
		</header>

	<div class="container">
		<div class="timushu">
			<span class="leftmsg"><i class="fa fa-file-o"></i>&nbsp;总共${fn:length(questions)}题</span>
			<span class="rightmsg">当前第<span id="index">1</span>题
			</span>
		</div>
		<c:forEach items="${questions }" var="question" varStatus="vs">
			<script type="text/javascript">
			  answerarray[${vs.index}] = "${question.answer}";
			  idarray[${vs.index}] = "${question._id}";
			</script>
			<div class="testitem" id="${question._id}"
				<c:if test="${vs.index ne 0 }">style="display: none"</c:if>>
				<span class="itemname"> ${vs.index + 1 }.${question.title } <c:if
						test="${ question.type eq 2}">(单选题)</c:if> <c:if
						test="${ question.type eq 3}">(多选题)</c:if>
				</span>
				<c:forEach items="${question.options }" var="option" varStatus="ovs">
					<label for="${question._id}radio${ovs.index }"> <c:if
							test="${question.type eq 2 }">
							<input type="radio" name="${question._id}"
								id="${question._id}radio${ovs.index }" value="${option.no }">${option.content }
					</c:if> <c:if test="${question.type eq 3 }">
							<input type="checkbox" id="${question._id}radio${ovs.index }"
								value="${option.no }">${option.content } 
					</c:if>
					</label>
				</c:forEach>
			</div>
		</c:forEach>
		<span id="jishi" style="display: none;">3S后将跳转下一题</span>
	</div>
	<footer>
		<a href="javascript:void(0);" id="pre" onclick="lasttimu() "><i
			class="fa fa-arrow-left"></i>&nbsp;上一题</a> <a href="javascript:void(0);"
			id="next" onclick="checkanswer()">下一题&nbsp; <i
			class="fa fa-arrow-right"></i></a>
	</footer>
	<script type="text/javascript"
		src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
var indextag = $("#index");//
var flag = false;//标记是否已点击过一次
var wronginfo = new Array([${fn:length(questions)}]); //所有问题id数组
var iswrong = false;
function checkanswer() {//下一题
	var useanswers = $("#"+idarray[index-1]).find("input:checked");//用户选择的答案
	if(useanswers.length == 0){
		alert("请选择答案")
		return;
	}
	if(flag){
		if(index == idarray.length){ //最后一题，下面不需要执行
			alert("当前题为最后一题!");
		}
		return;
	}
	var all = $("#"+idarray[index-1]).find("input");//所有的答案
	for(var i = 0; i < all.length; i++){	// 显示正确的答案 
		if(answerarray[index-1].indexOf(all[i].value) >= 0){//显示正确的答案
			$(all[i]).parent().addClass("rightanswer").append('<i class="fa fa-check"></i>');
		}
	}

	//提示错误答案
	for(var i = 0; i < useanswers.length; i++){	//  提示错误答案
		if(answerarray[index-1].indexOf(useanswers[i].value) == -1){//显示错误提示
			iswrong = true;
			$(useanswers[i]).parent().addClass("erroranswer").append( '<i class="fa fa-times"></i>');
		}
	} 
	//统计用户答题正确,错误信息
	if(iswrong)//错误
		wronginfo[index-1]=1;
	else//正确
		wronginfo[index-1]=0;
	iswrong = false;
	flag = true;
	if(index == idarray.length){ //最后一题，下面不需要执行
		$("#jishi").html("3S后将跳转结果页面");
		//$("#jishi").show(function() {
			var jishi = setInterval(function() {
				var time = $("#jishi").html().split("S");
				var i = parseInt(time[0]) - 1;
				console.log(i);
				if (i <= 0) { 
					clearInterval(jishi); 
					window.location.href="${basepath}/m/practice/result.xhtml?pid=${practiceid}&answer=" +wronginfo + "&courseid=${courseid}";					
				}
				$("#jishi").html(i + "S后将跳转结果页面");
			}, 1000);
		//});
		
	}else{
		$("#jishi").html("3S后将跳转下一题");
		//$("#jishi").show(function() {
			var jishi = setInterval(function() {
				var time = $("#jishi").html().split("S");
				var i = parseInt(time[0]) - 1;
				console.log(i);
				if (i <= 0) {
					clearInterval(jishi);
				//	$("#jishi").hide();//alert(index-1);
					//$("#"+idarray[index-1]).hide();//本题隐藏
					$("#"+idarray[index-1]).css('display','none');
					index++;//题号加一
					indextag.html(index);
					//$("#"+idarray[index-1]).show();//显示后一题
					$("#"+idarray[index-1]).css('display','block');
					flag = false;
				//	alert(index-1);
				}
				$("#jishi").html(i + "S后将跳转下一题");
			}, 1000);
		//});
	}
}

function lasttimu() {//上一题
	 if(flag){
	 	return;
	 }
	if(index == idarray.length){ //最后一题
		var preOption = $("#"+idarray[index-1]).find("input");//所有的答案
		preOption.removeAttr("checked");//清除选择信息
		for(var i = 0; i < preOption.length; i++){//清除正确答案，与错误答案提示
			var optionlabel =  $(preOption[i]).parent() 
			optionlabel.removeClass("rightanswer");
			optionlabel.removeClass("erroranswer"); 
			optionlabel.find("i").remove();
		}
		flag = false;
	}
	if(index == 1){
		alert("当前为第一道题");
		return;
	}
	$("#"+idarray[index-1]).css('display','none');
//	$("#"+idarray[index-1]).hide();//本题隐藏
	index--;//题号减一
	indextag.html(index);
	//清空上一题作答信息
	var preOption = $("#"+idarray[index-1]).find("input");//所有的答案
	preOption.removeAttr("checked");//清除选择信息
	for(var i = 0; i < preOption.length; i++){//清除正确答案，与错误答案提示
		var optionlabel =  $(preOption[i]).parent() 
		optionlabel.removeClass("rightanswer");
		optionlabel.removeClass("erroranswer"); 
		optionlabel.find("i").remove();
	}
	$("#"+idarray[index-1]).css('display','block');
//	$("#"+idarray[index-1]).show();//显示前一题
}

//返回课程页面
function returnCourse(courseid){
	window.location.href="${basepath}/m/study/detail/"+courseid+".xhtml";
}

</script>
</body>
</html>
