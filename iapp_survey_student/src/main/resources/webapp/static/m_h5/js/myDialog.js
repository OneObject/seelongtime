//_txt:自定义提示内容，默认是 确定提交？	
//_type:自定义对话类型，共三种类型值	 1、"yes"(取消确认，默认值)	  2、"save"(取消保存)  3、"ok"(知道了)	 
//_width：自定义对话框宽度，默认值280px  不支持百分比设置，一般无需设置
function showMyDialog(_txt,_type,_width){
	var html=[];
	var txt=_txt;
	var type=_type;
	var width=_width;
	html.push('<div class="dialogBg"></div>');
	html.push('<div class="dialogBox">');
	html.push('<div class="dialogHeader">提示</div>');
	if(!!txt){
		html.push('<div class="dialogContent"><span>'+txt.toString()+'</span></div>');		
		}else{
			html.push('<div class="dialogContent"><span>确认提交？</span></div>');
			}
	if(!!type){
		if(type.toString()==="save"){
			html.push('<div class="dialogFooter"><span class="a">取消</span><span class="b">保存</span></div>');
			}else if(type.toString()==="ok"){
				html.push('<div class="dialogFooter"><span class="c">知道了</span></div>');				
				}else if(type.toString()==="autoSubmit"){
						html.push('<div class="dialogFooter"><span class="d" style="width: 50%;">取消</span><span class="b">保存</span></div>');
					}else{
						html.push('<div class="dialogFooter"><span class="a">取消</span><span class="b">确认</span></div>');
					}
		}else{
			html.push('<div class="dialogFooter"><span class="a">取消</span><span class="b">确认</span></div>');
		}	
	html.push('</div>');
	$("body").prepend(html.join(""));
	if(!!width){
		//重定义对话框宽度
		resizeMydialog(width);		
		}
	//点击了，取消
	$(".dialogBox span.a").bind("click",function(){
		clickNo();
		});
	$(".dialogBox span.d").bind("click",function(){
		window.location.href=$("#url").val();
		});
	//点击了，确定	
	$(".dialogBox span.b").bind("click",function(){
		clickYes();
		});
	//点击了，知道了
	$(".dialogBox span.c").bind("click",function(){
		clickOk();
		});

	}
//重定义对话框宽度
function resizeMydialog(_width){
	var w=parseInt(_width);
	if(!!w){
		$("body .dialogBox").css({
		"width":w,
		"margin-left":-(w/2+1)+"px"
		});		
		}else{
			return;
			}	
	}
function clickNo(){
	$("body .dialogBg").remove();
	$("body .dialogBox").remove();
	
	}

//点击确定后的处理逻辑函数
function clickYes(){
	var html='<i id="dialogloading" class="fa fa-spinner fa-spin" style="font-size:45px;display:inline-block;color:#ccc;position:absolute;left:50%;top:50%;margin-left:-21px;margin-top:-21px;width:42px;height:42px;z-index:10005;"></i>';
	$("body .dialogBox").remove();
	$("body").prepend(html);
	//处理程序
	handleSub();
	}
function clickOk(){
	$("body .dialogBg").remove();
	$("body .dialogBox").remove();
	}
//处理程序
/*
function clickYes(){
	var html='<i class="fa fa-spinner fa-spin" style="font-size:45px;display:inline-block;color:#ccc;position:absolute;left:50%;top:50%;margin-left:-21px;margin-top:-21px;width:42px;height:42px;z-index:10005;"></i>';
	$("body .dialogBox").remove();
	$("body").prepend(html);
	
	//处理程序
	//handleSub();
	}
 

function handleSub(){
	showMyDialog("处理程序处理答案!","ok");	
	}

 */