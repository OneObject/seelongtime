/* 
** SCORM v1.2 CAM
** @zic
** 2009-05-25
** ---------------------------------------------------------------------------------
** Description:
** 		CAM Model v1.2
** 		在API.js中直接被引用。
** Input:
** 		null;
** Output: 
**  	null
** ----------------------------------------------------------------------------------
**
*/

var cmi = new Object();

cmi = {
    suspend_data : "",
    core : {
        _children : "lesson_status,lesson_mode,exit,session_time",
        student_id : "001",
        student_name : "",
        credit : "no-credit",
        entry : "ab-initio",
        lesson_location : "",     
        lesson_status : "not attempted",
        lesson_mode : "normal",
        lesson_progress : "0",
        exit : "suspend",  
        total_time : "0008:12:20.13",
        session_time : "01:10:00.25",
        score : {
            _children : "raw,min,max",
            raw : "",
            min : "",
            max : ""
        }   
    },
    score : {
        _children : "raw,min,max",
        raw : "",
        min : "",
        max : ""
    }, 
    success_status : "",
    completion_status : "",
    session_time : "00:00:00.00",
    total_time : "0000:00:00.00",
    credit : "no-credit",
    entry : "ab-initio",
    exit : "suspend",
    learner_id : "",
    learner_name : "",
    location : "",
    mode : "normal"

};




function initCmi(ncmi){
	cmi.learner_id = ncmi.core.student_id;
	cmi.learner_name = ncmi.core.student_name;
	cmi.credit = ncmi.core.credit;
	cmi.entry = ncmi.core.entry;
	cmi.location = ncmi.core.lesson_location;
	cmi.mode = ncmi.core.lesson_mode;
	cmi.session_time = ncmi.core.session_time;
	cmi.exit = ncmi.core.exit;
	cmi.total_time = ncmi.core.total_time;
	if(ncmi.core.lesson_status == 'failed' || ncmi.core.lesson_status == 'passed'){
		cmi.success_status = cmi.core.lesson_status;
	}
	if(ncmi.core.lesson_status == 'completed' || ncmi.core.lesson_status == 'incomplete'){
		cmi.completion_status = cmi.core.lesson_status;
	}
	var score = new Object();
	score.raw = ncmi.core.score.raw;
	score.min = ncmi.core.score.min;
	score.max = ncmi.core.score.max;
	cmi.score = score;
}

function getMap() {//初始化map_,给map_对象增加方法，使map_像Map    
    var map_ = new Object();    
    map_.put = function(key, value) {    
        map_[key+'_'] = value;    
    };    
    map_.get = function(key) {    
        return map_[key+'_'];    
    };    
    map_.remove = function(key) {    
        delete map_[key+'_'];    
    };    
    map_.keyset = function() {    
        var ret = "";    
        for(var p in map_) {    
            if(typeof p == 'string' && p.substring(p.length-1) == "_") {    
                ret += ",";    
                ret += p.substring(0,p.length-1);    
            }    
        }    
        if(ret == "") {    
            return ret.split(",");    
        } else {    
            return ret.substring(1).split(",");    
        }    
    };    
    return map_;    
}    
  
var map = getMap();  
map.put("cmi.learner_id","cmi.core.student_id"); 
map.put("cmi.learner_name", "cmi.core.student_name");
map.put("cmi.credit", "cmi.core.credit");
map.put("cmi.entry", "cmi.core.entry");
map.put("cmi.location", "cmi.core.lesson_location");
map.put("cmi.mode", "cmi.core.lesson_mode");
map.put("cmi.session_time", "cmi.core.session_time");
map.put("cmi.exit", "cmi.core.exit");
map.put("cmi.total_time", "cmi.core.total_time");
map.put("cmi.success_status", "cmi.core.lesson_status");
map.put("cmi.completion_status", "cmi.core.lesson_status");
map.put("cmi.score.raw", "cmi.core.score.raw");
map.put("cmi.score.min", "cmi.core.score.min");
map.put("cmi.score.max", "cmi.core.score.max");

/*
** function description
** ----------------------------------------------------------------------------------------------------
*/

/* 
** CMIgetValue(key)
** ----------------------------------------------------------------------------------------------------
** Description:
** 		Get Key - value
** Input:
** 		String key - element
** Output:
** 		String value - value
** -----------------------------------------------------------------------------------------------------
**
*/
	function CMIgetValue(key) {

    // 数据缓存,
    // 前后加括号，防止“Error: Invalid Label”

    var value = eval("(" + key + ")");

    /*
     * * 数据校验 Data Validation A 
     * * mandatoryString中的元素为scorm v1.2中必须实现的元素 
     * * 如果没有该元素，则报“401”error code 
     * * 有 - 该元素就返回值 
     * * 无 - 返回空，并置错
     */
    var mandatoryString =
                          [ "_children", "student_id", "student_name", "lesson_location", "credit", "lesson_status",
                           "entry", "raw", "total_time", "lesson_mode", "exit", "session_time" ];
    var i = mandatoryString.length;
    while (i > 0) {
        i--;
        if (key.match(mandatoryString[i]) == mandatoryString[i]) {

            if (value == undefined) {
                LMSErrorManager.SetCurrentErrorCode("401");
                return "null";
            }
        }
    }

    /*
     * * Data Validation B * WriteOnlyString中的元素只能写，不能读。
     */
    var WriteOnlyString = [ "exit" ];
    var j = WriteOnlyString.length;
    while (j > 0) {
        j--;
        if (key.match(WriteOnlyString[j]) == WriteOnlyString[j]) {
            LMSErrorManager.SetCurrentErrorCode("404");
            return "null";
        }
    }

    /*
     * * 错误检测 * object - 其下有子节点,返回._children值 * undefined - 没有该对象，报错，返回
     */
    if (typeof value == "object") {
        return eval("(" + key + "._children )");
        ;
    }
    if (typeof value == "undefined") {

        LMSErrorManager.SetCurrentErrorCode("204");
        return "null";
    }

    return value;

}
	
/* 
** CMIsetValue(key,value)
** ----------------------------------------------------------------------------------------------------
** Description:
** 		Get Key - value
** Input:
** 		String key - element
** 		String value - value
** Output:
** 		Boolean true - success
** 		Boolean false - failure
** -----------------------------------------------------------------------------------------------------
**
*/	

function CMIsetValue(key, value) {

    //alert("SetValue: key="+key+"--value="+value);
    var ReadOnlyString = [ "_children", "student_id", "student_name", "credit", "entry", "total_time", "lesson_mode" ];
    var i = ReadOnlyString.length;
    while (i > 0) {
        i--;

        if (key.match(ReadOnlyString[i]) == (ReadOnlyString[i])) {

            LMSErrorManager.SetCurrentErrorCode("402");
            return false;
        }
    }

    if (CMIgetValue(key) != undefined) {
        /*
         * NOTE: * 此处是个关键点
         */
        eval(key + "= value");

        return true;

    } else {

        return false;

    }
}

	
function CMIgetValue2004(_key) {

    // 数据缓存,
    // 前后加括号，防止“Error: Invalid Label”
	var key = map.get(_key);
    var value = eval("(" + key + ")");

    /*
     * * 数据校验 Data Validation A 
     * * mandatoryString中的元素为scorm v1.2中必须实现的元素 
     * * 如果没有该元素，则报“401”error code 
     * * 有 - 该元素就返回值 
     * * 无 - 返回空，并置错
     */
    var mandatoryString =
                          [ "_children", "learner_id", "learner_name", "location", "credit", "success_status","completion_status",
                           "entry", "raw", "total_time", "mode", "exit", "session_time" ];
    var i = mandatoryString.length;
    while (i > 0) {
        i--;
        if (key.match(mandatoryString[i]) == mandatoryString[i]) {

            if (value == undefined) {
                LMSErrorManager.SetCurrentErrorCode("401");
                return "null";
            }
        }
    }

    /*
     * * Data Validation B * WriteOnlyString中的元素只能写，不能读。
     */
    var WriteOnlyString = [ "exit" ];
    var j = WriteOnlyString.length;
    while (j > 0) {
        j--;
        if (key.match(WriteOnlyString[j]) == WriteOnlyString[j]) {
            LMSErrorManager.SetCurrentErrorCode("404");
            return "null";
        }
    }

    /*
     * * 错误检测 * object - 其下有子节点,返回._children值 * undefined - 没有该对象，报错，返回
     */
    if (typeof value == "object") {
        return eval("(" + key + "._children )");
        ;
    }
    if (typeof value == "undefined") {

        LMSErrorManager.SetCurrentErrorCode("204");
        return "null";
    }

    return value;

}
	
/* 
** CMIsetValue(key,value)
** ----------------------------------------------------------------------------------------------------
** Description:
** 		Get Key - value
** Input:
** 		String key - element
** 		String value - value
** Output:
** 		Boolean true - success
** 		Boolean false - failure
** -----------------------------------------------------------------------------------------------------
**
*/	

function CMIsetValue2004(key, value) {

    //alert("SetValue: key="+key+"--value="+value);
    var ReadOnlyString = [ "_children", "learner_id", "learner_name", "credit", "entry", "total_time", "mode" ];
    var i = ReadOnlyString.length;
    while (i > 0) {
        i--;

        if (key.match(ReadOnlyString[i]) == (ReadOnlyString[i])) {

            LMSErrorManager.SetCurrentErrorCode("402");
            return false;
        }
    }

    if (CMIgetValue2004(key) != undefined) {
        /*
         * NOTE: * 此处是个关键点
         */
    	if(key == "cmi.session_time"){
    		value = parseSessionTime(value);
    	}
        eval(key + "= value");
        var _key = map.get(key);
        eval(_key + "= value");

        return true;

    } else {

        return false;

    }
}

function parseSessionTime(_value){
	var h = "0000";
	var m = "00";
	var s = "00.00";
	if (_value.indexOf("H") != -1) {
        h = _value.substring(2, _value.indexOf("H"));
        m = _value.substring((_value.indexOf("H")+1), _value.indexOf("M"));
        s = _value.substring((_value.indexOf("M")+1), _value.indexOf("S"));
    } else {
    	if (_value.indexOf("M") != -1) {
            m = _value.substring(2, _value.indexOf("M"));
            s = _value.substring((_value.indexOf("M")+1), _value.indexOf("S"));
        } else {
        	 s = _value.substring(2, _value.indexOf("S"));
        }
    }
	return h+":"+m+":"+s;
}

		
/*
** additional functions
** StringToSeconds(value) - 将字符串转为second时间;
** SecondsToString(ts) - 将second时间转为字符串
** ----------------------------------------------------------------------------------------
*/
		// 将字符串转为second时间
function StringToSeconds(value) {
    //alert(value)
    if (value==null){
        return 1;
    }
    // 注意：
    // parseInt只能正确解析两位字符串（0008 -- 0； 0018 -- 1）
    // parseFlaot 才能正确解析多为字符串。
    var stringtmp = value.split(":");
    var hour = parseFloat(stringtmp[0]);
    var minute = parseFloat(stringtmp[1]);
    var second = parseFloat(stringtmp[2]);
    //alert(hour+":"+minute+":"+second);

    var totalsecond = hour * 3600 + minute * 60 + second;
    //alert(totalsecond);
    return totalsecond;
}

// 将second时间转为字符串
function SecondsToString(ts) {
    // 获得秒数		
    var sec = (ts % 60);

    ts -= sec;
    // 获得分钟的秒数
    var tmp = (ts % 3600); //# of seconds in the total # of minutes
    // 获得小时的秒数
    ts -= tmp; //# of seconds in the total # of hours

    // convert seconds to conform to CMITimespan type (e.g. SS.00)
    // 四舍五入取整
    sec = Math.round(sec * 100) / 100;

    var strSec = new String(sec);
    var strWholeSec = strSec;
    var strFractionSec = "";

    // 如果有小数点		
    if (strSec.indexOf(".") != -1) {
        strWholeSec = strSec.substring(0, strSec.indexOf("."));
        strFractionSec = strSec.substring(strSec.indexOf(".") + 1, strSec.length);
    }

    // 如果秒数是个位的
    if (strWholeSec.length < 2) {
        strWholeSec = "0" + strWholeSec;
    }
    strSec = strWholeSec;

    // 小数位处理
    if (strFractionSec.length) {
        strSec = strSec + "." + strFractionSec;
    } else {
        strSec = strSec + ".00";
    }

    // 处理分钟显示			
    if ((tmp % 60) != 0)
        var min = 0;
    else
        var min = (tmp / 60);
    if ((new String(min)).length < 2)
        min = "0" + min;

    // 处理小时显示
    //alert(ts / 3600);
    if ((ts % 3600) != 0)
        var hour = 0;
    else
        var hour = (ts / 3600);

    if ((new String(hour)).length < 4)
        hour = "0" + hour;
    if ((new String(hour)).length < 3)
        hour = "00" + hour;
    if ((new String(hour)).length < 2)
        hour = "000" + hour;

    if ((new String(hour)).length > 4) {
        hour = "0000";
        min = "00";
        strSec = "00.00";
        //  alert("The totaltime is too long \n It will be recalced");
    }
    var rtnVal = hour + ":" + min + ":" + strSec;

    return rtnVal;
}
