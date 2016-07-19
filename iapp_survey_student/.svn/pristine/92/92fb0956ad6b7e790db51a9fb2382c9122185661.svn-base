/*
** SCORM Player API Implementation
** @zic
** @2009-05-18
** 2009-05-25
**		-- ADD Annotation for Everything
**		-- ADD LMSErrorManager.CheckErrorCode(code)
** ---------------------------------------------------------------------------
** 模块描述：
** 		该模块用来管理API Implementation抛出的异常/错误。
** 模块入口：
** 		LMSErrorManager.GetCurrentErrorCode(); - 获取当前错误代码
**		LMSErrorManager.SetCurrentErrorCode(code); - 设置当前错误代码 
**		LMSErrorManager.ClearCurrentErrorCode(); - 清除当前错误代码
**		LMSErrorManager.GetErrorDescription(code); - 提示错误描述
**		LMSErrorManager.GetErrorDiagnostic(code); - 提示错误诊断
** 输入：
**  	code - 错误代码
** 输出：
**		错误代码/错误描述/错误诊断信息
** ---------------------------------------------------------------------------
**
*/

/*
**	LMSErrorManager对象 - 申明所有错误管理函数，
**  与需要提供错误管理的js文件放在同一个页面内；
** 	LMSErrorManager.currentErrorCode属性 - 返回当前错误代码；
** 	LMSErrorManager.errors属性 - 枚举所有预设错误信息；
**  ---------------------------------------------------------------------------
*/
var LMSErrorManager = new Object();
LMSErrorManager.currentErrorCode = "0";
LMSErrorManager.errors = [
      ["0", "No Error",
         "The previous LMS API Function call completed successfully."],
      ["101", "General Exception", 
         "An unspecified, unexpected exception has occured"],
	  ["102", "Initialization again","The scorm has been initialized!"],
	  ["103", "Save Data failured","Check Servers "],
      ["201", "Invalid argument error", ""],
      ["202", "Element cannot have children", ""],
      ["203", "Element not an array - cannot have count", ""],
	  ["204", "the key is not defined", "check your input key"],
      ["301", "Not initialized", "The LMS is not initialized."],
      ["401", "Not implemented error",
         "The data model element in question was not implemented"],
      ["402", "Invalid set value, element is a keyword",
         "Trying to set a reserved keyword in the data model" +
         "Trying to set a keyword (_count, _children, or _version) " +
         "This is prohibited"],
      ["403", "Element is read only",
         "Data Element is Read Only (Not Writeable)"+
         "Cannot call LMSSetValue() for the element in question"],
      ["404", "Element is write only",
         "Data Element is Write Only (Not Readable)"+
         "Cannot call LMSGetValue() for the element in question"],
      ["405", "Incorrect Data Type",
         "Invalid Type being used for setting element"+
         "The type being used as the set value argument does not match" +
         " that of the element being set"]
   ];

/*
**	function Definition
** ------------------------------------------------------------------------------------
*/

/*
** LMSErrorManager.SetCurrentErrorCode(code) 
** --------------------------------------------------------------------------
** Descirption:
** 		Set Error Code;
** Input:
**		code - error code;
** Output:
** 		String index - input error code;
** 		String "OK" - set current error code successfully
** --------------------------------------------------------------------------
*/
LMSErrorManager.SetCurrentErrorCode = function(code){
	
	var index = LMSErrorManager.CheckErrorCode(code);
	if(typeof index == "string" ){
		return index;
	}else{
		LMSErrorManager.currentErrorCode = code;
		return "OK";
	}
}

/*
** LMSErrorManager.GetCurrentErrorCode()
** --------------------------------------------------------------------------
** Description:
** 		Get Current Error Code;
** Input:
**   	null;
** Output:
**		LMSErrorManager.currentErrorCode;
** --------------------------------------------------------------------------
**
*/
LMSErrorManager.GetCurrentErrorCode = function(){
	
	return 	LMSErrorManager.currentErrorCode;
}

/*
** LMSErrorManager.GetErrorDescription(code)
** --------------------------------------------------------------------------
** Description:
** 		Get Error description
** Input:
** 		String Code - error code
** Output:
** 		String - error description
** --------------------------------------------------------------------------
**
*/
LMSErrorManager.GetErrorDescription = function(code){
	
	var index = LMSErrorManager.CheckErrorCode(code);
	if(typeof index == "string" ){
		return index;
	}else{
		return LMSErrorManager.errors[index][1];
	}
}

/*
** LMSErrorManager.GetErrorDiagnostic(code)
** --------------------------------------------------------------------------
** Description:
** 		Get Error Diagnostic information
** Input:
** 		String Code - error code
** Output:
** 		String - diagnostric information
** --------------------------------------------------------------------------
**
*/
LMSErrorManager.GetErrorDiagnostic = function(code){

	var index = LMSErrorManager.CheckErrorCode(code);
	if(typeof index == "string" ){
		return index;
	}else{
		return LMSErrorManager.errors[index][2];
	}
}

/*
** LMSErrorManager.CheckErrorCode(code)
** --------------------------------------------------------------------------
** Description:
** 		Check Error Code whether effective or exit
** Input:
** 		String Code - error code
** Output:
** 		i - error code index;
**		"No Such Error Code" - wrong error code;
** 		"Input An Error Code" - input error code correspond to null or ""(空)
** --------------------------------------------------------------------------
**
*/
LMSErrorManager.CheckErrorCode = function(code){
	
	if(code != null && code != ""){
		var i = LMSErrorManager.errors.length-1;
		while(i>=0 && (LMSErrorManager.errors[i][0]!=code)){
			i = i - 1;
		}
		if ( i<0 ){
			return "No Such Error Code! \n- Error in LMSErrorManager.js";
		}else{
			return i;
		}
	}else{
		return "Input An Error Code! \n- Error in LMSErrorManager.js";
	}
}

/*
** LMSErrorManager.ClearCurrentErrorCode() 
** --------------------------------------------------------------------------
** Descirption:
** 		Clear Error Code;
** Input:
**		null;
** Output:
** 		boolean true - clear successfully;
** --------------------------------------------------------------------------
*/
LMSErrorManager.ClearCurrentErrorCode = function(){
		LMSErrorManager.currentErrorCode = "0";
		return "OK";
}