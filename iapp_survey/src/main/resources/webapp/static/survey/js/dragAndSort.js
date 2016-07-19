$(function(){
			$( ".navitem" ).draggable({ 
					connectToSortable: ".sortBox",
					helper: "clone",
					appendTo: 'body',
					start:	function(event, ui) {
						var id = ui.helper.attr('name');												
						var html = [];
						html = creatHtml(this);
						ui.helper.html("").css({'border': 'none',"text-align":"left"}).append(html.join(""));						
					},
					stop: function(event, ui){					
						var html=[];
						var temp = $(".sortBox>span.navitem");
						var previd = temp.prev(".item").attr("data");
						var prev_qid = temp.prevAll(".item:not('.page'):eq(0)").attr("data");
//						alert("上一条问题的ID---->" + previd);
						var nextAllid = temp.nextAll(".item");
						var page = temp.nextAll("div.page:eq(0)").find(".a").html();
						var num1 = parseInt($(".item").length);
						var num2;
						html = creatHtml(this);	
						temp.replaceWith(html.join(""));
						num2 = parseInt($(".item").length);
						$(".item").bind("mouseover mouseout",function(){
								checkShow(this);		
							});				
						$(".question-title").click(function(event){		
								clickQTitle(this,event);		
						});	
						$(".doitem").click(function(event){
								clickOption(this,event)		
							});
						$("td.ed1").click(function(event){
								clickTdEdit1(this,event)		
							});	
						$("td.ed2").click(function(event){
								clickTdEdit2(this,event)		
							});
						$("td.ed").click(function(event){
								clickTdEdit(this,event)		
							});		
						sortQ();
						setPageNum();
							if(num2-num1==1){
								var qtype = $(this).attr("qtype");
								
								if(typeof(page)=='undefined'){
									page = $("#endpage").html();
									if(qtype=="fenye"){
										page = page-1;
									}
								}
								var nextAllIds = '';
								var nextid =$(nextAllid[0]).attr("data");
								if(typeof(nextid)=='undefined'){
									nextid = 'last';
								}
								if(typeof(previd)=='undefined'){
									previd = 'first';
								}
								for(var i = 0;i<nextAllid.length;i++){
									nextAllIds = nextAllIds+','+$(nextAllid[i]).attr("data");
								}
								
							
//								alert('页码  '+page+'  上一个ID  '+previd + '  后面的id  '+nextAllIds +'  diy '+ surveyId+' ty  '+qtype + "598" +nextid );
								//拖拽添加
								$.ajax({
									type:"POST",
									url:basepath+"/mgr/survey/question/add.json",
									data:{"id":surveyId,"page_num":page,"type":qtype,"before_ID":previd,"nextid":nextid,"drag":"drag","nextAllIds":nextAllIds,"prev_qid":prev_qid},
									success:function(data){
										if (data.result) {
											console.log("success");
											var _id = "#question"+data.titlenum;
											$(_id).attr({"data":data.id});
											
											if (qtype=='danxuan'||qtype=='duoxuan') {
												var doitem = $(_id).find(".doitem");
												$(doitem[0]).attr("data",data.option1);
												$(doitem[1]).attr("data",data.option2);
											}else if(qtype=='dafen'){
												var q_iterm = $(_id).find("tr");
												$(q_iterm[1]).attr("data",data.option1);
												$(q_iterm[2]).attr("data",data.option2);
											}else if(qtype=='jzdanxuan'||qtype=="jzduoxuan"){
												var q_Column = $(_id).find(".ed1");
												var q_Row = $(_id).find(".ed2");
												$(q_Column[0]).attr("data",data.option1);
												$(q_Column[1]).attr("data",data.option2);
												$(q_Row[0]).attr("data",data.matrixoption1);
												$(q_Row[1]).attr("data",data.matrixoption2);
											}
											
										}else{
											console.log('拖拽添加失败');
										}
									},error:function(data){
										console.log('拖拽添加失败');
									}
								});
							}
							//题目编辑完毕失去焦点时
							$(".question-title").blur(function(){
								var _id = $(this).closest(".item").attr("data");
								var title =  $(this).html();
								if(typeof(_id)=="undefined"){
									return;
								}
								updateQuestionTitleToDb(_id,title);
							});
						},
					revert: "invalid"
					});						
			$(".sortBox").sortable({ 
					placeholder:"sortable-placeholder",				
					delay:200,
					opacity:0.9,
					scrollSensitivity:160,
					tolerance:'pointer',
					handle:'.question-title,.pageDrag',
					cancel:'.editable',
					cursor:'move',
					revert:0,
					stop:function(event, ui){
						var temp = $(ui.item);
						var prev = temp.prev(".item").attr("data");
						var next = temp.next(".item").attr("data");
						
						var curr = $(ui.item).attr("data");
						if(typeof(prev)=='undefined'){
							prev = "first";
						}
						if(typeof(next)=='undefined'){
							next="last";
						}
						sortQ();
						setPageNum();
						
						if(temp.is(".item")){
							if(prev!='first'||next!='last'){
								$.ajax({
									type:"POST",
									async:false,
									url:basepath+"/mgr/survey/question/order/drag.xhtml",
									data:{"survey_id":surveyId,"currentId":curr,"toPreviId":prev,"toNextId":next},
									success:function(data){
										if(data){
											console.log('拖拽排序成功！');
										}else{
											console.log('拖拽排序失败');
										}
									},error:function(data){
										console.log('拖拽排序失败');
									}
								});
							}
							
							var arr=$("body div.item:not('.page')");
							var len=arr.length;
							var temp;
							var ids = "";
							var title_nums="";
							for(var i=0;i<len;i++){
								var index = i+1;
								var id = $(arr[i]).attr("data");
								var qNum = $(arr[i]).attr("qNum");
								if (typeof(id)!='undefined') {
									ids += id+"_";
									title_nums += qNum+'_'; 
								}
							}
							
							$.ajax({
								type:"POST",
								url:basepath+"/mgr/survey/question/batchupdate/title_num.json",
								data:{"ids":ids,"title_nums":title_nums},
								success:function(data){
									if(data){
										console.log("问题更改序号成功！");
									}else{
										console.log("问题更改序号失败！");
									}
								},error:function(data){
									console.log("问题更改序号失败！");
								}
							});
							
						}
						
						}			
					});		
			});