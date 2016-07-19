$(function(){
		
		
		//文档正在加载
		$("article.scroll").ready(function(){
			
			$("section.aLoading").fadeOut(500);
			
			}

		);
	
	  //设置input、textarea获得焦点时的z-index
	  $("input").focus(function(){
		  
		  $(this).css({"outline":"none","z-index":"0"});
		  
		  
		  
		  });
		  
	  //去除文本域，默认空格
	  $("textarea").ready(function(){
	  var _val=$(this).val();
	  var temp=_val.replace(/\s/img,"")
	  if(!!temp){
		  $(this).css({"outline":"none","z-index":"0"});				
		  
		  }else{
			  
			  $(this).css({"outline":"none","z-index":"0"}).val("");
			  }
  
	  });
	
	//照片编辑模块
//	$("section.infoEdit li:first-child img").click(function(){
//
//		var $choose=$('<div class="bigBox"><div class="popBg"></div><div class="picBox"><ul class="a"><li><a href="#">进入拍照</a></li><li><a href="#">从相册选择</a></li></ul><ul class="b"><li><a href="#">取消</a></li></ul></div></div>');
//		
//		$("body").append($choose);
//		$(".popBg").click(function(){
//			$(this).parents("div.bigBox").detach();
//			
//					
//			});
//			
//			$(".picBox ul.b a").click(function(){
//				
//				$(this).parents("div.bigBox").detach();
//
//				});
//				
//				$("header a.txt").click(function(){
//					
//					$("body div.bigBox").detach();
//					
//					
//					});
//	
//		});
	
//		//正在加载
//		$("section.more").click(function(){
//			
//						
//			$(this).replaceWith('<section class="loading"><i class="fa fa-spinner fa-spin"></i></section>');
//			
//			
//			});
		
		$("section.login a").click(function(){
			//提交表单
			/*$(this).parents("form").submit();*/
	
			showLoginError();
		
			});
			
//		$("section.password+a").click(function(){
//			
//			/*showInputError();*/
//			showEditError();
//		
//			});	
	});
	
	
	
//	//登陆错误
//	function showLoginError(){
//			
//			$("section.login a").prev().css("display","block");
			
		
//			}
	//密码输入错误
	function showInputError(){

			$("section.password  p:first").css("display","block");
			
			
			
			}
			
	//两次密码输入不一致		
	function showEditError(){
		
			$("section.password  :not(p:first)").css("display","block");
			
			
			
			}
	
	//默认提示色块
	function showTishi(_val){
		var val= _val;
		if(!!val){
			$("body").append('<span class="tishi">'+val+'</span>');
			
			}else{
				
			$("body").append('<span class="tishi">暂无数据</span>');	
				}
		
		$(".tishi").fadeOut(2000);

		}
			
	//定制提示色块
	function showMyTishi(_val,_color,_bg,_width){
		
		var val=_val.toString();
		var color=_color.toString();
		var bg=_bg.toString();
		var width=_width+"px";
		
		if(!!val){
			$("body").append('<span class="tishi">'+val+'</span>');
			
			}else{
				
			$("body").append('<span class="tishi">暂无数据</span>');	
				}

		if(!!color){
			$(".tishi").css({"color":color});
			
			}else{
				
				}
				
		if(!!bg){
			$(".tishi").css({"background":bg});
			
			}else{

				}
				
		if(!!width){
			$(".tishi").css({"width":width,"margin-left":(-(_width/2+20))+"px"});
			
			}else{

				}
				
		$(".tishi").fadeOut(2000);

		}
	
			
	Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
