function goto(url){
    window.location.href=url;
}
function gotoOpen(url){
    window.open(url);
}



function validataEmpty(name){
    if(name == undefined || name == null || $.trim(name) == "" ){
      return true;
    }else{
      return false;
    }
}

function gotoback(){
    window.history.go(-1);
}
function getQueryStringValue(str,name) {
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var r = str.match(reg);
    if (r != null) {
        return unescape(r[2]);
    }
    return null;
}
