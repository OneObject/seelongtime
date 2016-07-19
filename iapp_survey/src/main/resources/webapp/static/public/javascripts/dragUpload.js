$(function(){
	
	var dropbox = $('#dropbox'),
		message = $('.message', dropbox),
		preview_box = $("#preview_box");
	
	dropbox.filedrop({
		// The name of the $_FILES entry:
		paramname:'*',//文件类型
		
		maxfiles: 5,//文件数量限制
    	maxfilesize: 1024,//文件size限制
		url: 'post_file.php',//文件上传处理的
		
		uploadFinished:function(i,file,response){
			$.data(file).addClass('done');
			// response is the JSON object that post_file.php returns
			//alert(response);
			var last=JSON.stringify(response); 
			alert(last);
		},
		
    	error: function(err, file) {
			switch(err) {
				case 'BrowserNotSupported':
					showMessage('您的浏览器不支持html5拖拽上传，请双击拖拽区域，打开传统方式上传。');
					break;
				case 'TooManyFiles':
					alert('选择问价过多，最多限制为5个文件。');
					break;
				case 'FileTooLarge':
					alert(file.name+' 文件太大');
					break;
				default:
					break;
			}
		},
		
		// Called before each upload is started
		beforeEach: function(file){
			var filetype = file.name.substring(file.name.lastIndexOf('.') + 1).toUpperCase();;
			if(filetype == "ZIP" || filetype== "RAR"){
				return true;
			}else{
				return false;
			}
		},
		
		uploadStarted:function(i, file, len){
			createFile(file);
		},
		
		progressUpdated: function(i, file, progress) {
			$.data(file).find('.progress').width(progress);
		}
    	 
	});
	
	var template = '<div class="preview">'+
						'<span class="imageHolder">'+
							'<img />'+
							'<span class="uploaded"></span>'+
						'</span>'+
						'<div class="progressHolder">'+
							'<div class="progress"></div>'+
						'</div>'+
					'</div>'; 
	
	
	function createFile(file){

		var preview = $(template), 
			image = $('img', preview);
			
		var reader = new FileReader();
		
		image.width = 100;
		image.height = 100;
		
		reader.onload = function(e){
			
			// e.target.result holds the DataURL which
			// can be used as a source of the image:
			image.attr("style","width:100px;height:100px;");
			image.attr('src',"http://img01.taobaocdn.com/imgextra/i1/679214160/T2ApJ6XqdXXXXXXXXX-679214160.png");
		};
		
		// Reading the file as a DataURL. When finished,
		// this will trigger the onload function above:
		reader.readAsDataURL(file);
		
		message.hide();
		preview.appendTo(preview_box);
		
		// Associating a preview container
		// with the file, using jQuery's $.data():
		
		$.data(file,preview);
	}

	function showMessage(msg){
		message.html(msg);
	}

});