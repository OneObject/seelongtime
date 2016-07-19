
	var defaultGid = 0;
	var defaultIndex = 0;
	
 	var imgDate = {};//二位数组，保持图片的组别，顺序和地址信息
	var imgs = getWeixinImgs('.weixin-imgs-show');
	for ( var i = 0; i < imgs.length; i++) {
		var img = imgs[i];
		var index = img.getAttribute("data-index");//存放索引
		var gid = img.getAttribute("data-gid");//组号 data-gid 存放组号
		var dsrc = img.getAttribute("data-src");//地址 
		if (index && gid && dsrc) {
			imgDate[gid] = imgDate[gid] || []; //该组不存在则创建
			imgDate[gid][index] = dsrc;//按照索引设置地址
		}else{
			//默认的组
			
			dsrc = img.getAttribute("data-src");
			if(!dsrc){
				dsrc=img.getAttribute("src");
			}
			
			img.setAttribute("data-index",defaultIndex);
			
			imgDate[defaultGid]=imgDate[defaultGid]||[];
			imgDate[defaultGid][defaultIndex]= dsrc;
			img.onclick = function () {
				preViewImg4Doc(defaultGid, this.getAttribute("data-index"));
			};
			defaultIndex = defaultIndex+1;
		}
	}
	
	function getWeixinImgs(classStr) {
		return document.querySelectorAll(classStr + ' img');
	}
	
	//点击图片时调用，groupid组号，index索引号
	function preViewImg4Doc(groupid, index) {
		var wxJSbridge = window.WeixinJSBridge
				|| parent.window.WeixinJSBridge;
		if (typeof wxJSbridge != 'undefined') {
			wxJSbridge.invoke('imagePreview', {
				'current' : imgDate[groupid][index],//当前地址
				'urls' : imgDate[groupid] //组
			});
		} else {
			//alert("请在微信中查看", null, function(){});
			console.log(groupid + " " + index);
		}
	} 
