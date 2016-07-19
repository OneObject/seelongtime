var basepath = "/iapp";
//basepath = pa;
UE.registerUI('dialog2', function(editor, uiName) {
	// 创建dialog
	var dialog = new UE.ui.Dialog({
		// 指定弹出层中页面的路径
		iframeUrl : basepath + '/base/admin/ueditor/document.xhtml?currPage=1&pageSize=6',
		// 需要指定当前的编辑器实例 
		editor : editor,
		// 指定dialog的名字
		name : uiName,
		// dialog的标题
		title : "添加文档",
		// 指定dialog的外围样式
		cssRules : "width:650px;height:400px;",
		// 如果给出了buttons就代表dialog有确定和取消
		buttons : [ {
			className : 'edui-okbutton',
			label : '确定',
			onclick : function() { 			 
				var pagenum = document.getElementById("pagenum").value;// 页数
				var url = document.getElementById("docpath").value;// 文档路径
				pagenum = parseInt(pagenum);   //
				var imgtype = document.getElementById("imgtype").value;// 文档显示类型，平铺（文档内的所有图片全部展开，点击放大－微信功能），图集（展示一张图片，点击展示图集－微信功能）
				var time = new Date().getTime();// 当前时间毫秒数作为data-gid，不会重复
				
				var insertTxt ="";  
				if(imgtype == 1){// 图集
					insertTxt =  "<img " +
							"style='border:1px solid #eee;padding:2px;display:block;' width='100%' src='" + url + "page_1.png' data-src='" + url + "page_1.png' data-gid='" + time + "' onclick='preViewImg4Doc(" + time + ",  0);' data-index='0' />" +
							" <span style='display:block;font-size:12px;height:24px;line-height:24px;text-align:right;background-color: rgba(0, 0, 0, 0.6) !important;color:#fff;margin-top:-24px;right:16px;position:absolute;'>点击图片查看(1/" + pagenum + ")</span></br>";// 第一页，显示
					var j = 1;
					for(var i = 2 ; i <= pagenum; i++){// 后面的都隐藏
						insertTxt += "</br><img src='" + url + "page_1.png' data-src='" + url + "page_" + i + ".png' data-gid='" + time + "'  hidden='hidden' onclick='preViewImg4Doc(" + time + "," + j + ");' data-index='" + j + "' /> ";
						j++;
					}
				}else if(imgtype == 2){// 平铺
					var j = 0;
					for(var i = 1 ; i <= pagenum; i++){
						insertTxt +=  "<img style='border:1px solid #eee;padding:2px;' width='100%' src='" + url + "page_" + i +".png' data-src='" + url + "page_" + i + ".png'  data-gid='" + time + "'  onclick='preViewImg4Doc(" + time + ","  + j + ");'  data-index='" + j + "' /> </br>";	
						j++;
					}
					insertTxt += "&nbsp;";
				}   
				insertTxt && editor.execCommand("inserthtml", insertTxt);
				dialog.close(true);
			}
		}, {
			className : 'edui-cancelbutton',
			label : '取消',
			onclick : function() {
				dialog.close(false);
			}
		} ]
	})

	// 参考addCustomizeButton.js
	var btn = new UE.ui.Button({
		name : 'dialogbutton' + uiName, 
		title : "文档",
		// 需要添加的额外样式，指定icon图标，这里默认使用一个重复的icon
		cssRules : 'background-position:-660px -40px;',
		onclick : function() {
			// 渲染dialog
			dialog.render();
			dialog.open();
		//	dialog.onok=function(){ 
		//		vardgSelf=this;
			//	currentEditor = this.editor;
			//	var ids = this.id+'_iframe';
		//		dialogWin = document.getElementById(this.id+'_iframe'); 
		//		alert(dialogWin.contentDocument);
			//}
		}
	});
	
	  //当点到编辑内容上时，按钮要做的状态反射
    editor.addListener('selectionchange', function () {
        var state = editor.queryCommandState(uiName);
        if (state == -1) {
            btn.setDisabled(true);
            btn.setChecked(false);
        } else {
            btn.setDisabled(false);
            btn.setChecked(state);
        }
    });
	return btn;
});
/*
 * index 指定添加到工具栏上的那个位置，默认时追加到最后,editorId 指定这个UI是那个编辑器实例上的，默认是页面上所有的编辑器都会添加这个按钮
 */