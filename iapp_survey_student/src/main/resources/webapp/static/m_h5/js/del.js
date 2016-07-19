//意见反馈模块
$("section.msg p:first").click(function(){
		var $input=$(this);
		var $info=$("section.msg p:not(:first) span");
		var maxLength= 200;
		var val;
		var curLength;
		
		$(this).attr("contenteditable","true").focus();
		
		$input.bind("keyup change",function(){			
			val=$(this).text();			
			curLength=val.length;		
			if(parseInt(curLength)<=parseInt(maxLength)){

					$info.text(parseInt(maxLength)-parseInt(curLength));
	
					}else{
							$info.text("0");
							var temp=$input.text().substr(0,200);
							$input.text(temp)
							alert("输入已超出200字！");
														
							}
		
			});

		});
	
	$("section.msg+section p").click(function(){
		
		$(this).attr("contenteditable","true").focus();

		});
		
		
	
	
	
	//联系我们、意见反馈   焦点判断
	$("section.msg p:first").click(function(){
		var judgeTxt= "欢迎您提出使用平台或学习课程的感受和建议";
		var txt=$(this).text();
		
		if($.trim(txt)==judgeTxt){
			$(this).attr("contenteditable","true").focus().text("");			
			
			}else{
				
				$(this).attr("contenteditable","true").focus();				
							
				}
	
		});