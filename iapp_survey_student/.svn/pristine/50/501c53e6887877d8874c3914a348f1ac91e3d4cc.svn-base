<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
	<title>辅导任务</title>
	<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/xw/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/xw/css/style.css">
</head>
<body class="gray pt">
	<header>
		<div class="back" onclick="gotoback();">
			<i class="fa icon-angle-left"></i>
		</div>
		<p>实践任务</p>
		<div class="save">
			保存
		</div>
	</header>
	<div class="task-intro-wrap">
		<h2>任务标题</h2>
		<p>${vo.tname }</p>
	</div>
	<div class="task-intro-wrap">
		<h2>任务描述</h2>
		<p><pre>${vo.tdescript }</pre></p>
	</div>

<c:forEach var="step" items="${vo.steps }">
	<section class="slide-wrap">
		<div class="slide-wrap clear">
			<p class="title fl">
				步骤${step.no} &nbsp; ${step.step }
			</p>
			<span class="fr">
				<i class="fa icon-double-angle-up"></i>
			</span>
		</div>
		<div class="slide-content" style="display:none;">
			<div class="content">
				<div class="tip">操作标准</div>
				<p><pre>${step.standard }</pre></p>
			</div>
			<div class="slide-active clear">
				<div class="tip">是否按照标准完成</div>
				<div class="activty fl">
					<span class="num">第一次</span>
					<span class="zt stepStatus" data-id="${step.tdid}_one" data-status="${step.one }">${step.oneName }</span>
				</div>
				<div class="fr">
					<i class="fa icon-angle-down"></i>
				</div>
			</div>
			<div class="slide-active clear">
				<div class="activty fl">
					<span class="num">第二次</span>
					<span class="zt stepStatus" data-id="${step.tdid}_two" data-status="${step.two }">${step.twoName }</span>
				</div>
				<div class="fr">
					<i class="fa icon-angle-down"></i>
				</div>
			</div>
			<div class="slide-active clear">
				<div class="activty fl">
					<span class="num">第三次</span>
					<span class="zt stepStatus" data-id="${step.tdid}_three" data-status="${step.three }">${step.threeName }</span>
				</div>
				<div class="fr">
					<i class="fa icon-angle-down"></i>
				</div>
			</div>
		</div>
	</section>
</c:forEach>
	

	<section class="textarea-show-box">
		<div class="tip">综合反馈</div>
		<div class="textarea-text">
			<textarea name="tudescript" id='tudescript'>${vo.tudescript }</textarea>
		</div>
	</section>


	<div class="dialog-selector-wrapper" id="dialog-selector-wrapper" style="display: none;">
	    <div class="dialog-selector-box-text" id="dialog-selector-box-text">
	        <ul>
	            <li data-text="完成" data-status='2'>完成</li>
	            <li data-text="未完成" data-status='1'>未完成</li>
	            <li data-text="请选择" data-status='0'>请选择</li>
	        </ul>
	    </div>
	</div>


	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/common.js"></script>
	<script type="text/javascript">
		$(function (){
			var slideActive = $('.slide-active');
			var $dialogSelectorWrapper = $('#dialog-selector-wrapper');
			var $dialogSelectorBoxText = $('#dialog-selector-box-text');
			var $selectorList = $('#dialog-selector-box-text li');

			var _this,htmlText;

			$("div.slide-wrap").click(function (){
				if($(this).find('.fa').hasClass('icon-double-angle-up')) {
					$(this).find('.fa').removeClass('icon-double-angle-up').addClass('icon-double-angle-down');
				} else {
					$(this).find('.fa').removeClass('icon-double-angle-down').addClass('icon-double-angle-up');
				}

				$(this).siblings('.slide-content').slideToggle(300);
			})

			$("textarea").bind("propertychange input",function(){
                this.style.height = this.scrollHeight + 'px';
            });

			slideActive.bind('click',function (){
				$dialogSelectorWrapper.show();
				_this = $(this);
				htmlText = _this.find('.zt');
			})

			$dialogSelectorWrapper.bind('click', function (){
                $dialogSelectorWrapper.hide();
            });

            $dialogSelectorBoxText.bind('click', function (e){
                e.stopPropagation();
            });

            $selectorList.bind('click', function (){
                var $temp = $(this);
                var text = $temp.data('text');
                var status = $temp.data('status');
                htmlText.html(text);
               
                htmlText.data('status',status);
                //alert(htmlText.data('status'));
                setTimeout(function (){
                    $dialogSelectorWrapper.hide();
                }, 300);
            });


            $('header .save').bind('click',function (){
            	
            	if($('#tudescript').val() == null||$('#tudescript').val().length == 0){
            		dialogHide('请填写综合反馈',2000);
            	}else{
            		var param= {};
                	param['tuid'] = '${vo.tuid}';
                	var stepStatus = $('.stepStatus');
                	
                	stepStatus.each(function(){
                		var id = $(this).data('id');
                		var status = $(this).data('status');
                		param[id]=status;
                	});
                	
                	param['tudescript'] = $('#tudescript').val();
                	
                	//alert(JSON.stringify(param) );
                	
                	
                	$.ajax({
                        type : "POST",
                        url : "${basepath}/m/ext/enn/xw/taskupdate.json",
                        cache : true,
                        data : param,
                        success : function(data) {
                            if(data){
                            	dialogHide('保存成功',2000);
                            }else{
                            	dialogHide('保存失败',2000);
                            }
                        },
                        error : function() {
                        }
                    });
            	}
            	
            	
            	
            })

			function dialogHide(text,time){
				var html = '<section class="dialog-none" id="dialog_none"><div class="com-drag"></div><div class="tip-dialog">'+text+'</div></section>';
				
				$('body').append(html);

				$('.tip-dialog').text(text);

				setInterval(function (){
					$('#dialog_none').remove();
				},time)
			}
		})
	</script>
</body>
</html>