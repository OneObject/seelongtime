// QQ表情插件
(function($){
	$.fn.qqFace = function(options){
		var defaults = {
			id : 'facebox',
			path : 'face/',
			assign : 'content',
			tip : 'em_'
		};
		var option = $.extend(defaults, options);
		var assign = $('#'+option.assign);
		var id = option.id;
		var path = option.path;
		var tip = option.tip;

		if(assign.length<=0){
			alert('缺少表情赋值对象。');
			return false;
		}

		$(this).click(function(e){
			var strFace, labFace;
            //获取浏览器的宽度，计算能放的个数
            var kywidth = document.body.clientWidth;
            var kyheight = window.screen.availHeight ;
            //通过浏览器的高度和宽度计算放置表情的盒子
            var count = parseInt((kywidth-32)/35);
            //行数
            var linecount = parseInt(51/count);

			if($('#'+id).length<=0){
				strFace = '<div id="'+id+'" style="position: absolute;z-index: 10000;display:none;padding:10px;border:1px solid #dadada;background-color:#fff;" class="qqFace">' +
							  '<table border="0" cellspacing="0" cellpadding="0"><tr>';
				for(var i=1; i<=51; i++){
					labFace = '['+tip+i+']';
					strFace += '<td><img src="'+path+i+'.gif" onclick="inputem(\''+option.assign+'\',\''+labFace+'\');" style="width:35px;height:35px;"/></td>';
					if( i % count == 0 ) strFace += '</tr><tr>';
				}
				strFace += '</tr></table></div>';
			}
			$(this).parent().append(strFace);
			var offset = $(this).position();
            var top = offset.top+28;
			$('#'+id).css('top',160);
            $('#'+id).css('left',-6);
			$('#'+id).show();
			$("#file_upload_1-button").css("width",0);
			$("#file_upload_1-button").css("height",0);
			e.stopPropagation();
		});

		$(document).click(function(){
			$('#'+id).hide();
			$('#'+id).remove();
			setTimeout(function(){
				$("#file_upload_1-button").css("width",80);
				$("#file_upload_1-button").css("height",80);	
			},300);
			
		});
	};

})(Zepto);
	function insertAtCaret(assign,textFeildValue){
        var tex = $("#"+assign).val();
        return textFeildValue =tex +textFeildValue;
	}
function inputem(assign,labFace){
    $("#"+assign).focus().val(insertAtCaret( assign,labFace));
}