/* 
** XMLHttpRequest Handle Function
** @zic
** @2009-05-11
** Modified @2009-05-15
** ----------------------------------------------------------------------------
** 模块描述:
** 		该模块用来处理AJAX XMLHttpRequest服务。
** 模块入口:
** 		function XMLHttpSendRequest(url,StringDate),async;
** 输入：
** 		String url - Server端处理请求的相对地址； 与web.xml中severlet配置相关。
**		String StringDate - 需要传送String类型的数据。
**		Boolean async - ture(异步)/false(同步)。
** 
** 输出：
** 		String ResponseDate - 服务器返回的数据。
** ----------------------------------------------------------------------------
*/

/* 
** XMLHttpSendRequest(url,StringDate,async)
** ----------------------------------------------------------------------------
** 函数描述:
** 		处理 XMLHttpRequest 服务
** 输入:
** 		String url - Server端处理请求的相对地址； 与web.xml中severlet配置相关。
**		String StringDate - 需要传送String类型的数据。
**		Boolean async - ture(异步)/false(同步)。
** 输出：
** 		无。	
** 性质：
** 		主函数，调用其他子函数，模块入口，
** ----------------------------------------------------------------------------
*/	
		function XMLHttpSendRequest(url,StringDate,async){
		
		/*
		** 申明全局标量
		** Boolean _Debug - 调试状态 
		**			true - 开启
		**			false - 关闭
		** String ResponseDate - 返回的字符串
		** ----------------------------------------------------------------------------
		*/
			var _Debug = false;
			var ResponseDate;
			
			
			//获得XMLHttpRequest对象
			var xmlHttp = createXMLHttpObject();
			
		/* 
		** getOS()
		** ----------------------------------------------------------------------------
		** 函数描述:
		** 		获取浏览器类型。
		** 输入:
		** 		无。
		** 输出：
		** 		String XXX - 浏览器名称。
		** 性质:		
		** 		辅助函数，被调用，提供服务
		** ----------------------------------------------------------------------------
		*/	
				function getOS(){
					
					if(navigator.userAgent.indexOf("MSIE")>0){
						
						return "MSIE";
					}
					if(isFirefox = navigator.userAgent.indexOf("Firefox")>0){
						
						return "Firefox";
					}
					if(isSafari = navigator.userAgent.indexOf("Safari")>0){
						return "Safari";
					}
					if(isMozilla = navigator.userAgent.indexOf("Camino")>0){
						return "Camino";
					}
				}
				
				
		/* 
		** init(), createXmlHttpObject()
		** ----------------------------------------------------------------------------
		** 函数描述：
		** 		新建 XMLHttpRequest 对象，处理XMLHttp请求。
		** 输入：
		** 		无。
		** 输出:
		** 		XMLHttpRequest 对象。
		** 性质:
		**		非主函数，被调用，提供服务。
		** 注意： 
		** 		两种方法任选其一，效果相同。
		** ----------------------------------------------------------------------------
		** 
		*/
		
				function init(){
					if(windows.XMLHttpRequest){
						return new XMLHttpRequest();
					}
					else if (window.ActionXObject){
						return new ActiveXObject("Microsoft.XMLHTTP");
					}
				}
				
				function createXMLHttpObject(){
					
					try{
						return new XMLHttpRequest();
					}catch(e){
						try{
							return new ActiveXObject("Msxml2.XMLHTTP");
						}catch(e){
							return new ActiveXObject("Microsoft.XMLHTTP");
						}
					}
					
				}		
		
		/* 
		** HandleStateChange(xmlHttp)
		** ----------------------------------------------------------------------------
		** 函数描述：
		** 		处理由readystatechange事件产生的readystate不同状态值。
		** 输入：
		**		XMLHttpRequest 对象。
		** 输出：
		** 		调用processResponse(xmlHttp)处理返回结果。
		** 性质：
		** 		非主函数，被动激发，提供中转。
		** 
		** ----------------------------------------------------------------------------
		*/	
				function HandleStateChange(xmlHttp){
					
					// "2" - 已经调用"send()"方法，还未接收到一个响应
					if (xmlHttp.readyState==2){
					//	alert("msg has been sent...");
					}
					
					// "3" - 已经接收到Http响应头部，但还未全部接收完
					if (xmlHttp.readyState==3){
					//	alert("Now, response is beening received...")
					}
					
					// "4" - 响应已完全被接收
					if (xmlHttp.readyState==4 && xmlHttp.status==200){
						
						/* 
						** 这里也可以调用一个函数来处理Response
						** processResponse(xmlHttp);
						*/
						
						ResponseDate = xmlHttp.responseText;
					
					if(_Debug){
							alert("Return Http ResponseDate =" + ResponseDate);	
						}
					}
			}	

		/* 
		** processResponse(xmlHttp)
		** ----------------------------------------------------------------------------
		** 函数描述：
		** 		接收服务器的相应。
		** 输入:
		** 		XMLHttpRequest 对象。
		** 输出：
		** 		无。
		** 性质:
		** 		非主函数，被调用，提供服务。
		** 注意:
		** 为了便于该模块的复用，建议在此模块中直接返回接收到的字符串
		** 让其他模块处理。
		**
		** ----------------------------------------------------------------------------
		**
		*/	
				function  processResponse(xmlHttp){
					
					// 接收XMLHttpRequest对象responseText属性中服务器返回的值
					ResponseDate = xmlHttp.responseText;
					
					alert(ResponseDate);
					/*
					** 注意：
					**  	在接收到服务器返回字符串中，末尾会带有回车换行字符。
					** 		在处理时可以选择清除，或者保留两种方法。
					** ------------------------------------------------------------
					** 以下为调试时的一个简单处理方法
					*/
					if(false){
						
						// 将接收到的字符串进行编码，
						// 可以看到，字符串末尾带有%0D%0A - 回车换行
						ResponseDate = escape(ResponseDate);
						
						if(false){
						// 这里依次显示接收到的字符串字符
						// 一般情况下不显示。
						alert(ResponseDate.length);
						for( var i=0;i< ResponseDate.length;i++)
							alert("i = " + i+"---------value = \'" + ResponseDate.substr(i,1)+ "\'");
						}
						
						// 以下为“保留”方法处理字符串。
						if(ResponseDate=="OK%0D%0A"){
							
							alert("OK");
							
						}else if(ResponseDate == "error%0D%0A"){
							
							alert("error");
						}
						else{
							ResponseDate = unescape(ResponseDate);
							ResponseDateObject = ResponseDate.parseJSON();
							// 显示JSON Object中一个属性
							alert("age =" + ResponseDateObject.age);
						}
					}
					
				
			}
			
/*	主程序入口	
**----------------------------------------------------------------------------------------------------		
*/
		//不支持则抛出错误的话
		if (xmlHttp == null) {
			alert ("Oop! Your Browser does not support HTTP Request.")
			return;
		}
		
		// readystate值发生改变，激发readystatechange事件，
		// onreadystatechange属性接收一个EventListener值，
		// 可以在function HandleStateChange(xmlHttp)中增加对readyState == 2/3/4时的不同处理方法，
		// 值得注意到是readyState == 0/1时的配置和发送方法不应添加到次方法中(值得商榷，与浏览器的处理方式有关)
		
		xmlHttp.onreadystatechange = function(){HandleStateChange(xmlHttp)};
			
	
		// "0" - XMLHttpRequest 对象已被创建，但未被初始化
		if (xmlHttp.readyState==0){
				
				// 配置xmlHttp发送方式,采用同步方式
				xmlHttp.open( "POST" , url,  async );
			}
		
		// "1" - 已经调用"open()"方法，准备发送信息
		if (xmlHttp.readyState==1){
			
			// 解决IE下的缓存问题
			xmlHttp.setRequestHeader("If-Modified-Since","0");
			xmlHttp.setRequestHeader("Content-Type","text/html");
			
			//xmlHttpReq.send("Do you receive my msg?");
			
			xmlHttp.send(StringDate);
			
			if(!async){	
			// 此处解决同步接收时，不同浏览器(FF/IE)产生的问题	
			xmlHttp.onreadystatechange = 
					(getOS()!="Firefox")?(function(){HandleStateChange(xmlHttp)}):(HandleStateChange(xmlHttp));
			}
		}
		
		if(_Debug){
			alert("XML Http Request Over...");	
		}
		
		// 返回Response Date
		return ResponseDate;
	}
	




	
	
	
		