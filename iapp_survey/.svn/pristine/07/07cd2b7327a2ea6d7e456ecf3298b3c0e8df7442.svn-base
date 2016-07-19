//显示所有一级高级功能
function showSets(_this,event){
	var $items=$(".item");
	for(var i=0;i<$items.length;i++){
		if($($items[i]).find(".set_box").css("display")=="block"){//设置总是显示
			$($items[i]).find(".control").show().end().find(".ud_arrow").show();			
			}else{
				$($items[i]).mouseover(function(){
				$(this).find(".control").show().end().find(".ud_arrow").show();
				});		 
				$($items[i]).mouseout(function(){
					if($($items[i]).find(".set_box").css("display")!="block"){
						$(this).find(".control").hide().end().find(".ud_arrow").hide();
						}
				
				});						
				}			
		}		
	}
	
	

//动态设置右侧模块高度
function checkHeight(){
	var h1=186;//左侧设置模块的高度
	var h2;
	var $items=$(".item");	
	for(var i=0;i<$items.length;i++){
		h2=$($items[i]).find(".rightcontainer").height();
		if(h2<h1){
			$($items[i]).find(".rightcontainer").css("height",h1);			
			}		
		}
	}