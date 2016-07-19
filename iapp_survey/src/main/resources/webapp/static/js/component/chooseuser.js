var submit = 0;
/**弹出框选择用户*/
function chooseUser(){
	pageUser(1);
	easyDialog.open({
		  container : 'choose_user_dialog',
		  fixed : false
		});
}

/**
 * 用户列表：分页
 */
function pageUser(i, fieldId) {
	var divId = "table_list2";
	var max = $("#"+divId+" #page_max").val()
	var data = {"page":i, "max":max, "r":Math.random(), "username":$("#susername").val(),"name":$("#user_name").val(),
			"orgname":$("#orgname").val(), "userids":$("#userids").val()};
	var url = basepath+"/base/admin/comp/userlist.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		isUserAllCheck();
	});
}

//确认添加用户
function confirmChooseUser(){
    if(submit == 1){
	   return;
    }
    submit = 1;

	var userData = new Array();
	var users = $("#users").val().split(";");
	for(var i=0;i<users.length;i++){
		if(users[i] != ""){
			var user = users[i].split(",");
			if(user[0] != ""){
				var item = new Object();
				item.id=user[0];
				item.name = user[1];
			    userData.push(item);
			}
		}
	}
    afterComfirmChooseUser(userData);
    easyDialog.close();
    submit = 0;
}

function onSaveUser() {
    var items = document.getElementsByName("ids");
    var userids=$("#userids").val();
    var users = $("#users").val();
    for(var i=0;i <items.length;i++){
        if(items[i].checked==true){
            if(saveUserCheck(items[i].value)==false){
            	userids += items[i].value+",";
            	users = users + items[i].value+","+$(items[i]).data("name") + ";";
            }
        }
        else{
            if(saveUserCheck(items[i].value)==true){
               if(userids.indexOf(items[i].value) >= 0){
            	   userids = userids.replace(items[i].value+",", "");
            	   users = users.replace(items[i].value+","+$(items[i]).data("name") + ";","");
               }
            }
        } 
    }
    $("#userids").val(userids);
    $("#users").val(users);
}

function saveUserCheck(insertValue){
    var userids=$("#userids").val();
    var data = userids.split(",");
    for(var i=0;i<data.length;i++){
        if(data[i]==insertValue){
            return true;
        }
    }
    return false;
}

/**
 * 全部选中
 */
function checked_all(obj) {
	if ($(obj).attr("checked") == "checked") {
		$("input[name='ids']").each(function() {
			$(this).attr("checked", "checked");
			$(this).parent().addClass("checked");
		});
	} else {
		$("input[name='ids']").each(function() {
			$(this).removeAttr("checked");
			$(this).parent().removeClass("checked");
		});
	}
	onSaveUser();
}

function isUserAllCheck() {
	if ($("input[name='ids'][checked!='checked']").length == 0) {
		$("#checkall").attr("checked", "checked");
	}
}