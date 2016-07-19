/* 
 ** SCORM Player API Implementation
 ** @zic
 ** @2009-05-12
 ** @2009-05-25 Modified
 ** ----------------------------------------------------------------------------
 ** 模块描述:
 ** 		该模块用来实现SCORM v1.2规定的八个基本方法。
 ** 		需要调用XMLHttpRequest.js服务，
 **      需要调用LMSErrorManger.js服务。
 ** 模块入口:
 ** 		var api = API; - 使用时只需要new出一个API对象。
 ** 输入：
 ** 		String url - Server端处理请求的相对地址； 与web.xml中severlet配置相关。
 **		String StringDate - 需要传送String类型的数据。
 **		Boolean async - ture(异步)/false(同步)。
 ** 模块出口：
 ** 		function getResponse();
 ** 输出：
 ** 		ResponseDate - 服务器返回的数据。
 ** 重要：
 **		API.getSCOMagager() - 获取SCORM CAM对象
 **		API.getSCOString() - 获取Response 字符串
 ** ----------------------------------------------------------------------------
 */

/*
 ** 申明所有的API函数
 ** 在使用时只需要new出一个API对象。
 ** ----------------------------------------------------------------------------
 */
var API = new Object();
var api = API;
/*
 * * 申明API对象的一些属性 - 成员变量 * url - 服务器端处理该APIXMLHttpRequest的servlet相对(/绝对)地址 * isLMSInitialized - 初始化标志 *
 * ----------------------------------------------------------------------------
 */
// API.url - Server端处理请求的相对地址； 与web.xml中severlet配置相关！
// encodeURI - 将文本字符串编码为一个统一资源标识符 (URI),主要是针对一些特殊字符;
// API.url = encodeURI(window.location.pathname + "JSONHandle");
//API.url = encodeURI(getRootPath() + "/player/scorm/jsonHandler");
API.isLMSInitialized = false;
API._Debug = false;

API.cmiBooleanFalse = false;
API.cmiBooleanTrue = true;

/*
 * * Function Definition * ----------------------------------------------------------------------------
 */

/*
 * * API.CheckInitialization * ---------------------------------------------------------------------------- * 函数描述: *
 * 检查是否被初始化过。 * 输入: * 无。 * 输出： * Boolean isLMSInitialized - 初始化标志。 * 性质: * 辅助函数，被调用，提供服务 *
 * ----------------------------------------------------------------------------
 */
API.CheckInitialization = function() {
    if (API._Debug) {
        alert("API.isLMSInitialized =" + API.isLMSInitialized);
    }

    return API.isLMSInitialized;
}

/*
 * * API.LMSInitialize("") * ---------------------------------------------------------------------------- * 函数描述: *
 * 初始化当前用户的SCORM学习内容。 * 该函数必须在其他API function被调用前，被SCO调用。 * 输入: * ""; 或者 * null; * 输出： * String result - 是否初始化成功。 * true -
 * success * false - failure * 性质: * 应用API * 外部调用： * LMSErrorManager.SetCurrentErrorCode - LMSErrorManager.js *
 * XMLHttpSendRequest(API.url,"Initialization",false) - XMLHttpRequestHandleFunctions.js * cmi - ScormModel.js *
 * API.SCOString.parseJSON() - json.js * ----------------------------------------------------------------------------
 */
API.LMSInitialize = function(param) {
	//console.debug("LMSInitialize");

    if (API._Debug) {
        alert("In API::LMSInitialize");
    }
    // 假设初始化失败.
    var result = API.cmiBooleanFalse;

    // 检查传入的param，必须是null或者"".
    if (param.toString() != "null" && param.toString() != "") {
        LMSErrorManager.SetCurrentErrorCode("201");
        return result;
    }

    // 校验是否已经被初始化过...
    if (API.CheckInitialization() == true) {
        LMSErrorManager.SetCurrentErrorCode("102");
        return result;
    } else {

        // 首次初始化开始
        if (API._Debug) {
            alert("Now Initializing ... ! \n Trying to get SCO Data from Database...");
        }

        /*
         * // 向服务器发送"Initialization", 接收初始化数据 // 该XMLHttpRequest是已同步方式接受Response var SCOString =
         * XMLHttpSendRequest(API.url,"Initialization",false);
         * 
         * if(API._Debug){ alert("The Core Data for the current SCO contains the following: \n"+API.SCOString); } //
         * 将Response的JSONString存入SCOString中; // 而后转变成JSON对象 var SCOManager = API.SCOString.parseJSON();
         * 
         * cmi = SCOManager;
         */

        // 以上三句可以用下一句代替
        var rseult = XMLHttpSendRequest(API.url, "Initialization", false);
        if(API._Debug){ alert("The Core Data for the current SCO contains the following: \n"+rseult); } //
        cmi = $.parseJSON(rseult);
        API.isLMSInitialized = true;
        LMSErrorManager.ClearCurrentErrorCode();
        result = API.cmiBooleanTrue;
    }

    // 如果没有被初始化过，初始化开始
    if (API._Debug) {
        alert("Done Processing LMSInitialize");
    }
    // 返回标志位，判断是否初始化成功
    return result;
}

/*
 * * API.LMSCommit("") * ---------------------------------------------------------------------------- * 函数描述: * Save SCO
 * Data Model element on the server * 输入: * ""; 或者 * null; * 输出： * String result - 是否初始化成功。 * true - success * false -
 * failure * 性质: * 应用API * 外部调用： * LMSErrorManager.SetCurrentErrorCode - LMSErrorManager.js *
 * XMLHttpSendRequest(API.url,cmi.toJSONString(),false) - XMLHttpRequestHandleFunctions.js * cmi.toJSONString() -
 * ScormModel.js - json.js * ----------------------------------------------------------------------------
 */
API.LMSCommit = function(param) {
	
	//console.debug("LMSCommit="+ JSON.stringify(cmi));

    if (API._Debug) {
        alert("In API::LMSCommit");
    }

    // 假设发送失败
    var result = API.cmiBooleanFalse;

    if (param.toString() != "null" && param.toString() != "") {
        LMSErrorManager.SetCurrentErrorCode("201");
        return result;
    }

    // 校验是否已经被初始化过...
    if (API.CheckInitialization() != true) {
        LMSErrorManager.SetCurrentErrorCode("301");
        return result;
    } else {

        if (API._Debug) {
            alert("Sync Data with the Server... \n" + JSON.stringify(cmi));
        }
        // 向服务器发送cmi.toJSONString(), 接收初始化数据
        // 该XMLHttpRequest是已同步方式接受Response
        // 返回Response，判断是否成功;
        if (escape(XMLHttpSendRequest(API.url, JSON.stringify(cmi), false)) != "success") {
            // LMSErrorManager.SetCurrentErrorCode("103");
            if (API._Debug) {
                alert("Sync with the Server was NOT successfully!");
            }
        } else {

            LMSErrorManager.ClearCurrentErrorCode();
            result = API.cmiBooleanTrue;
            if (API._Debug) {
                alert("Sync with the Server succeedfully!");
            }
        }

    }
    if (API._Debug) {
        alert("Processing done for API::LMSCommit");
    }
    // 返回标志位，判断是否初始化成功
    return result;

}

/*
 * * API.LMSGetValue(key) * ---------------------------------------------------------------------------- * 函数描述: * Save
 * SCO Data Model element on the server * 输入: * key - 待查关键字 * 输出： * String value - key对应的Value * * 性质: * 应用API * 外部调用： *
 * LMSErrorManager.SetCurrentErrorCode - LMSErrorManager.js * CMIgetValue - ScormModel.js *
 * ----------------------------------------------------------------------------
 */
API.LMSGetValue = function(key) {

    if (API._Debug) {
        alert("In API::LMSGetValue");
    }

    // 校验是否已经被初始化过...
    if (API.CheckInitialization() != true) {
        // 如果未被初始化，返回一个空字符串
        LMSErrorManager.SetCurrentErrorCode("301");
        return "";
    } else {

        if (API._Debug) {
            alert("Request being processed: LMSGetValue(" + key + ")");
        }

        LMSErrorManager.ClearCurrentErrorCode();

        var value = CMIgetValue(key);

    }
    if (API._Debug) {
        alert("Processing done for API::LMSGetValue");
    }
    return value;
}

/*
 * * API.LMSSetValue(key,value) * ---------------------------------------------------------------------------- * 函数描述: *
 * Save SCO Data Model element on the server * 输入: * key - 待查关键字 * value - 数据 * 输出： * String value - 是否设置成功。 * true -
 * success * false - failure * 性质: * 应用API * 外部调用： * LMSErrorManager.SetCurrentErrorCode - LMSErrorManager.js *
 * CMIgetValue - ScormModel.js * ----------------------------------------------------------------------------
 */
API.LMSSetValue = function(key, value) {

    if (API._Debug) {
        alert("In API::LMSSetValue");
    }

    var result = API.cmiBooleanFalse
    // 校验是否已经被初始化过...
    if (API.CheckInitialization() != true) {
        LMSErrorManager.SetCurrentErrorCode("301");
        return result;
    } else {

        LMSErrorManager.ClearCurrentErrorCode();

        result = CMIsetValue(key, value);
    }
    if (API._Debug) {
        alert("Processing done for API::LMSSetValue");
    }
    return result;
}

/*
 * * API.LMSFinish("") * ---------------------------------------------------------------------------- * 函数描述: *
 * 完成整个SCO学习过程 * 输入: * ""; 或者 * null; * 输出： * String XXX - 浏览器名称。 * 性质: * 辅助函数，被调用，模提供服务。 *
 * ----------------------------------------------------------------------------
 */
API.LMSFinish = function(param) {
	//console.debug("LMSFinish="+ JSON.stringify(cmi));

    if (API._Debug) {
        alert("In API::LMSFinish");
    }
    // 默认初始化失败.
    var result = API.cmiBooleanFalse;

    // 检查传入的param，必须是null或者"".
    if (param.toString() != "null" && param.toString() != "") {
        LMSErrorManager.SetCurrentErrorCode("201");
        return result;
    }

    // 校验是否已经被初始化过...
    if (API.CheckInitialization() != true) {
        LMSErrorManager.SetCurrentErrorCode("301");
        return result;
    } else {

        /*
         * 计算总的学习时间 
         * * 注意：由于session_time是write_only 
         * * total_time是read_only 
         * * 所以这里用了特殊的方法处理取值和置值。
         */

        if (API._Debug) {
            alert("Before this session, you have learned :" + cmi.core.total_time);
            alert("This session has proceed :" + cmi.core.session_time);
        }

        var totalsecond = StringToSeconds(cmi.core.total_time) + StringToSeconds(cmi.core.session_time);
        cmi.core.total_time = SecondsToString(totalsecond);
        if (API._Debug) {
            alert("Now, you have learned :" + cmi.core.total_time);
        }

        /*
         * * 设置下次访问方式 * 这里也采取强行输入的置值方式
         */
        if (cmi.core.exit == "suspend") {
            cmi.core.entry = "resume";
        } else {
            cmi.core.entry = "";
        }

        if (CMIgetValue("cmi.core.lesson_status") == "not attempted") {
            CMIsetValue("cmi.core.lesson_status", "incomplete");
        }

        // result = API.LMSCommit(param);
        result = true;

    }
    // 判断是否提交数据成功
    if (!result) {
        alert("LMSCommit failed causing LMSFinish to fail.");
    } else {
        result = API.cmiBooleanTrue;
        API.isLMSInitialized = false;
        return result;
    }
}
/*
 * * API.LMSGetLastError() * API.LMSGetErrorString(errorCode) * API.LMSGetDiagnostic(errorCode) *
 * -------------------------------------------------------------------- * Description: * Provide get error code function *
 * Input: * String errorCode - error code * Output: * String - reference information * call LMSErrorManager functions *
 * --------------------------------------------------------------------- *
 */
API.LMSGetLastError = function() {
    if (API._Debug) {
        alert("In API::LMSGetLastError()");
    }
    return LMSErrorManager.GetCurrentErrorCode();
}

API.LMSGetErrorString = function(errorCode) {
    if (API._Debug) {
        alert("In API::LMSGetErrorString()");
    }
    return LMSErrorManager.GetErrorDescription(errorCode);
}

API.LMSGetDiagnostic = function(errorCode) {
    if (API._Debug) {
        alert("In API::LMSGetDiagnostic()");
    }
    return LMSErrorManager.GetErrorDiagnostic(errorCode);
}

API.setSCOID = function(scoid) {
    //alert(scoid);
    cmi.chapterId = scoid;
    cmi.core.lesson_location = scoid;
    var user_id = $.cookie("ctu.player.user");
    var resource_id = $.cookie("ctu.player.resource_id");
    var scoid_key = user_id + '_' + resource_id + '_chapter_id';
    $.cookie(scoid_key, scoid, {'expires':30, 'path':'/'});
    $.cookie('chapter_id', scoid, {'expires':30, 'path':'/'});
}

API.getSCOID = function(){
    var user_id = $.cookie("ctu.player.user");
    var resource_id = $.cookie("ctu.player.resource_id");
    var scoid_key = user_id + '_' + resource_id + '_chapter_id';
    return $.cookie(scoid_key);
}

// add by songsp 2012-8-1 19:28
API.setChapterId = function(chapterId) {
    API.setSCOID(chapterId);
}

