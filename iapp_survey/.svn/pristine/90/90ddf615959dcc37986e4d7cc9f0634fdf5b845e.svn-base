var basepath = "/iapp";
UE.registerUI('dialog', function(editor, uiName) {
	// 创建dialog
	var dialog = new UE.ui.Dialog({
		// 指定弹出层中页面的路径
		iframeUrl : basepath + '/base/admin/ueditor/video.xhtml?currPage=1&pageSize=6', 
		// 需要指定当前的编辑器实例
		editor : editor,
		// 指定dialog的名字
		name : uiName,
		// dialog的标题
		title : "添加视频",
		// 指定dialog的外围样式
		cssRules : "width:610px;height:370px;",
		// 如果给出了buttons就代表dialog有确定和取消
		buttons : [ {
			className : 'edui-okbutton',
			label : '确定',
			onclick : function() {
				// 获取视频url
				var url = document.getElementById("videourl").value;//视频地址 
				// 设置视频url
				var insertTxt = "<iframe  src='" + url + "' frameborder=0 allowfullscreen height=200 width='100%'></iframe>&nbsp;</br>"
				//往编辑器中添加数据
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
		//title : 'dialogbutton' + uiName,
		title : '视频',
		// 需要添加的额外样式，指定icon图标，这里默认使用一个重复的icon
		cssRules : 'background-position:  -320px -20px;',
		onclick : function() {
			// 渲染dialog
			dialog.render();
			dialog.open();
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
 * index 指定添加到工具栏上的那个位置，默认时追加到最后,editorId
 * 指定这个UI是那个编辑器实例上的，默认是页面上所有的编辑器都会添加这个按钮
 */