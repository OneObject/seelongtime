/** 为空 */
function isBlank(str){
	if($.trim(str)==null || $.trim(str)==""){
		return true;
	}
	return false;
}
/** 数字验证 */
function numberCheck(value){
	var value = $.trim(value);
	if(isBlank(value)){
		return false;
	}
	var reg = /^[0-9]*$/;
	return reg.test(value);
}
var flag = 0;
$(function () {
    var $boxZan = $('#box-zan');
    var $num = $('#num');
    var $text = $("#text");
    var $btnSubmit = $('#btn-submit');

    $boxZan.bind('click', function () {
    	if(isChoseStart()){
    		lightBlock.show("评选活动未开始！");
    		return;
    	}
    	if(isChoseOver()){
    		lightBlock.show("评选活动已结束！");
    		return;
    	}
        var num = parseInt($num.html());
       
        var id = $("#id").val();
        var choseid = $("#choseid").val();
        
        if ($boxZan.is('.active')) {
            lightDialog.show('确定取消赞？', function () {
            	if(flag == 1){
            		return;
            	}
            	flag = 1;
            	$.ajax({
            		url : basepath+"/m/ext/unicom/chose/praise.json",
            		type : "POST",
            		data : {"id":id,"choseid":choseid},
            		success : function(data) {
            			flag = 0;
            			lightDialog.remove();
            			if(data == '-2'){
            				lightDialog.show({"btnModel":1,"contentText":"该评选选项已经不存在！","footerText":["确定"]}, function () {
            	                lightDialog.remove();
            	            });
            			} else if(data == '-1'){
            				lightDialog.show({"btnModel":1,"contentText":"您已经赞了6个选项，达到点赞上限，请先取消其它已赞选项！","footerText":["确定"]}, function () {
            	                lightDialog.remove();
            	            });
            			} else {
            				$boxZan.removeClass('active');
        	                $num.html(--num);
        	                $text.html('赞');
            			}
            		},
            		error : function() {
            			flag = 0;
            			lightBlock.show("系统忙，请重新尝试！");
            		}
            	});
            });
        } else {
            lightDialog.show('确定点赞？', function () {
            	if(flag == 1){
            		return;
            	}
            	flag = 1;
            	$.ajax({
            		url : basepath+"/m/ext/unicom/chose/praise.json",
            		type : "POST",
            		data : {"id":id,"choseid":choseid},
            		success : function(data) {
            			flag = 0;
            			lightDialog.remove();
            			if(data == '-2'){
            				lightDialog.show({"btnModel":1,"contentText":"该评选选项已经不存在！","footerText":["确定"]}, function () {
            	                lightDialog.remove();
            	            });
            			} else if(data == '-1'){
            				lightDialog.show({"btnModel":1,"contentText":"您已经赞了30个选项，请先取消其它已赞选项！","footerText":["确定"]}, function () {
            	                lightDialog.remove();
            	            });
            			}  else {
            				$boxZan.addClass('active');
	    	                $num.html(++num);
	    	                $text.html('已赞');
            			}
            		},
            		error : function() {
            			flag = 0;
            			lightBlock.show("系统忙，请重新尝试！");
            		}
            	});
            });
        }
    });

    $("textarea").bind("propertychange input", function(){
        this.style.height = this.scrollHeight + 'px';
    });

    $btnSubmit.bind('click', function () {
    	if(isChoseStart()){
    		lightBlock.show("评选活动未开始！");
    		return;
    	}
    	if(isChoseOver()){
    		lightBlock.show("评选活动已结束！");
    		return;
    	}
        var value = $("#value").val();
        var generalize = $("#generalize").val();
        var innovation = $("#innovation").val();
        var implement = $("#implement").val();
        var logic = $("#logic").val();
        var comment = $("#comment").val();
        var feedback = $("#feedback").val();
        var category = $("#category").val();
        
        if(category == 1){
        	if(!numberCheck(value) || value<1 || value>40){
            	$("#value").focus();
            	lightBlock.show("成果价值分数需要在1～40分之间！");
            	return;
            }
            
            if(!numberCheck(generalize) || generalize<1 || generalize>20){
            	$("#generalize").focus();
            	lightBlock.show("可推广性分数需要在1～20分之间！");
            	return;
            }
            
            if(!numberCheck(implement) || implement<1 || implement>20){
            	$("#generalize").focus();
            	lightBlock.show("落地实施分数需要在1～20分之间！");
            	return;
            }
            
            if(!numberCheck(innovation) || innovation<1 || innovation>10){
            	$("#innovation").focus();
            	lightBlock.show("变革创新分数需要在1～10分之间！");
            	return;
            }
            
            if(!numberCheck(logic) || logic<1 || logic>10){
            	$("#logic").focus();
            	lightBlock.show("逻辑描述分数需要在1～10分之间！");
            	return;
            }
            if(comment == "" || comment == null || comment.length<30){
            	$("#comment").focus();
            	lightBlock.show("综合评价字数不少于30字！");
            	return;
            }
        }else{
        	if(feedback == "" || feedback == null){
        		$("#feedback").focus();
        		lightBlock.show("意见反馈不能为空！");
        		return;
        	}
        }
        
        var itemid = $("#id").val();
        
        lightDialog.show('确定提交？', function () {
        	if(flag == 1){
        		return;
        	}
        	flag = 1;
        	$.ajax({
        		url : basepath+"/m/ext/unicom/chose/expertscore.json",
        		type : "POST",
        		data : {"itemid":itemid,"category":category,"value":value,"generalize":generalize,"implement":implement,"innovation":innovation,"logic":logic,"comment":comment,"feedback":feedback},
        		success : function(data) {
        			flag = 0;
        			lightDialog.remove();
					if(category == 1) {
						lightBlock.show("评分成功！");
					}else{
						lightBlock.show("提交成功！");
					}
        		},
        		error : function() {
        			flag = 0;
        			lightDialog.remove();
        			lightBlock.show("系统忙，请重新尝试！");
        		}
        	});
        });
    });
});

var defaultGid = 0;
var defaultIndex = 0;

	var imgDate = {};//二位数组，保持图片的组别，顺序和地址信息
var imgs = document.getElementsByTagName("img");
for ( var i = 0; i < imgs.length; i++) {
	var img = imgs[i];
	var index = img.getAttribute("data-index");//存放索引
	var gid = img.getAttribute("data-gid");//组号 data-gid 存放组号
	var dsrc = img.getAttribute("data-src");//地址 
	if (index && gid && dsrc) {
		imgDate[gid] = imgDate[gid] || []; //该组不存在则创建
		imgDate[gid][index] = dsrc;//按照索引设置地址
	}else{
		//默认的组
		
		dsrc = img.getAttribute("data-src");
		if(!dsrc){
			dsrc=img.getAttribute("src");
		}
		
		img.setAttribute("data-index",defaultIndex);
		
		imgDate[defaultGid]=imgDate[defaultGid]||[];
		imgDate[defaultGid][defaultIndex]= dsrc;
		img.onclick = function () {
			preViewImg4Doc(defaultGid, this.getAttribute("data-index"));
		};
		defaultIndex = defaultIndex+1;
	}
}
//点击图片时调用，groupid组号，index索引号
function preViewImg4Doc(groupid, index) {
	var wxJSbridge = window.WeixinJSBridge
			|| parent.window.WeixinJSBridge;
	if (typeof wxJSbridge != 'undefined') {
		wxJSbridge.invoke('imagePreview', {
			'current' : imgDate[groupid][index],//当前地址
			'urls' : imgDate[groupid] //组
		});
	} else {
		//alert("请在微信中查看", null, function(){});
		console.log(groupid + " " + index);
	}
}

function isChoseStart(){
	var start = parseInt($("#start").val());
	var date = new Date();
	var time = date.getTime();
	if(start != 0 && time<start){
		return true;
	}
	return false;
}

function isChoseOver(){
	var end = $("#end").val();
	var date = new Date();
	var time = date.getTime();
	
	if(end != 0 && time>end){
		return true;
	}
	return false;
}

function backIndex(choseid){
	window.location.href = basepath + "/m/ext/unicom/chose/index.xhtml?id="+choseid;
}
