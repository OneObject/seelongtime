var setting = {
			view: {
				showLine: false,
				fontCss: setFontCss
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			check: {
				enable: true,
				chkboxType:{
					"Y" : "ps", "N" : "ps"
				}
			}
		};
		var zNodes = [ {
						"checked" : true,
						"click" : true,
						"defaultchecked" : true,
						"id" : "402880c14202c4d4014202c575570000",
						"name" : "上海龙泰信息科技有限公司",
						"open" : true,
						"pId" : ""
					}, {
						"checked" : true,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276bb3610000",
						"name" : "技术部",
						"open" : true,
						"pId" : "402880c14202c4d4014202c575570000"
					}, {
						"checked" : true,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276c55800001",
						"name" : "运维组",
						"open" : true,
						"pId" : "402880bb42276ab60142276bb3610000"
					}, {
						"checked" : true,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276ce6750002",
						"name" : "前端组",
						"open" : false,
						"pId" : "402880bb42276ab60142276bb3610000"
					}, {
						"checked" : false,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276f46f4000b",
						"name" : "ios开发组",
						"open" : false,
						"pId" : "402880bb42276ab60142276bb3610000"
					}, {
						"checked" : false,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276f7320000c",
						"name" : "安卓开发组",
						"open" : false,
						"pId" : "402880bb42276ab60142276bb3610000"
					}, {
						"checked" : false,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276fe45b000d",
						"name" : "PHP开发组",
						"open" : false,
						"pId" : "402880bb42276ab60142276bb3610000"
					}, {
						"checked" : false,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276d4f580003",
						"name" : "市场部",
						"open" : false,
						"pId" : "402880c14202c4d4014202c575570000"
					}, {
						"checked" : false,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276d78810004",
						"name" : "销售组",
						"open" : false,
						"pId" : "402880bb42276ab60142276d4f580003"
					}, {
						"checked" : false,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276de5640005",
						"name" : "企划部",
						"open" : false,
						"pId" : "402880bb42276ab60142276d4f580003"
					}, {
						"checked" : false,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276e1db70006",
						"name" : "客户接待组",
						"open" : false,
						"pId" : "402880bb42276ab60142276d4f580003"
					}, {
						"checked" : false,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276e554b0007",
						"name" : "财务部",
						"open" : false,
						"pId" : "402880c14202c4d4014202c575570000"
					}, {
						"checked" : false,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276e9d330008",
						"name" : "人事部",
						"open" : false,
						"pId" : "402880c14202c4d4014202c575570000"
					}, {
						"checked" : false,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276ed1460009",
						"name" : "工资组",
						"open" : false,
						"pId" : "402880bb42276ab60142276e9d330008"
					}, {
						"checked" : false,
						"click" : false,
						"defaultchecked" : false,
						"id" : "402880bb42276ab60142276f08a8000a",
						"name" : "违纪组",
						"open" : false,
						"pId" : "402880bb42276ab60142276e9d330008"
					} ];
		 //设置字体样式
        function setFontCss() {
        	return {color:"#000000",size:"14px",height: "28px",family:"微软雅黑"};
        };
      /*
       * 人员授权
       * */  
        /*
         * 添加人员
         * */
        function add_person(){
        	var html = [];
        	html.push('<div style="width:500px;height:300px;overflow:hidden;display:block;">');
        	html.push('<div style="margin-bottom: 10px"><span style="margin-right: 20px;float: left;margin-top: 3px;">角色名称</span>');
        	html.push('<input type="text" style="width:400px;" name="name" id="insert_name" value=""></div>');
        	html.push('<div style="margin-bottom: 10px"><span style="margin-right: 22px;margin-left: 24px;float: left;margin-top: 3px;">备注</span>');
        	html.push('<textarea type="text" style="width:400px;height:120px;resize:none;" name="remark" id="insert_remark"></textarea></div>');
        	html.push('<div style="text-align: center;"><span class="btn btn-success" onclick="insert_role()" style="margin-right:10px">保存角色</span>');
        	html.push('<span class="btn default" onclick="easyDialog.close()">取消</span></div>');
        	html.push('<div>');
        	easyDialog.open({
        		  container : {
        		    header : '添加角色',
        		    content : html.join("")
        		  }
        		});
        }
        /*打开人员选择界面*/
        function openAdd(){
        	easyDialog.open({
        		  container : 'add_member_dialog',
        		  fixed : false
        		});

        }
        /**
         * 用户列表全部选中
         */
        var bool = true;//没有选中的情况下是true
        function checked_A(){
        	if(bool){
        		$("input[name='uids']").each(function(){
        			$(this).attr("checked","checked");
        			$(this).parent().addClass("checked");
        		});
        		bool = false;
        	}else{
        		$("input[name='uids']").each(function(){
        			$(this).removeAttr("checked");
        			$(this).parent().removeClass("checked");
        		});
        		bool = true;
        	}
        	
        }
        /**
         * 添加用户全部选中
         */
        var flag = true;//没有选中的情况下是true
        function checked_all(){
        	if(flag){
        		$("input[name='ids']").each(function(){
        			$(this).attr("checked","checked");
        			$(this).parent().addClass("checked");
        		});
        		flag = false;
        	}else{
        		$("input[name='ids']").each(function(){
        			$(this).removeAttr("checked");
        			$(this).parent().removeClass("checked");
        		});
        		flag = true;
        	}
        	
        }