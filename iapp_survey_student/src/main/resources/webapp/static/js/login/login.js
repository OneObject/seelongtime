 
function dl_yanzheng(){
    if($("#username").val() == "" || $("#password").val() == ""){
        $("#errormsg").html("用户名和密码不能为空");
        $("#errormsg").show();
    }else{
        //进一步验证或者登录进入
        $("#denglu").submit();
        
    }
 }

