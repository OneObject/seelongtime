var studyTime_interval;
var study_hour = 0;
var study_minute = 0;
var study_second = 0;

function Timing() {
    if (study_second > 0 && (study_second % 60) == 0) {
        study_minute += 1;
        study_second = 0;
    }
    if (study_minute > 0 && (study_minute % 60) == 0) {
        study_hour += 1;
        study_minute = 0;
    }
    var s_text = study_second < 10 ? ("0" + study_second) : study_second;
    var m_text = study_minute < 10 ? ("0" + study_minute) : study_minute;
    var h_text = study_hour < 10 ? ("0" + study_hour) : study_hour;
    $("#study_time").text(h_text + ":" + m_text + ":" + s_text);
   //Cufon.replace("#study_time");
    study_second += 1;
}

function startclock() {
    studyTime_interval = setInterval("Timing()", 1000);
}

function pauseclock() {
    clearInterval(studyTime_interval);
}
var StudyTimeTracker = function(_trace_url, domain, user_id, resource_id, resource_type) {

    /* statistics */
    var trace_id;
    /* callback */
    var callback_interval = 1000 * 60 * 5;
    var callback;
    /* monitor */
    var start_active = new Date().getTime();
    var last_active = new Date().getTime();
    var pause_time = 1000 * 60 * 60 * 24;
    var check_interval = 1000 * 10;
    var watch_dog;
    
    var isstop = false;

    function trace(type) {
        $.ajax({
            "url" : _trace_url,
            "async" : false,
            "cache" : false,
            "dataType" : "json",
            "data" : {
                "type" : type,
                "trace_id" : trace_id,
                "domain" : domain,
                "user_id" : user_id,
                "resource_id" : resource_id,
                "resource_type" : resource_type
            },
            "beforeSend" : function(jqXHR, settings) {
                // alert(11);
            },
            "success" : function(data, textStatus, jqXHR) {
                trace_id = data["trace_id"];
            },
            "error" : function(XMLHttpRequest, textStatus, errorThrown) {
                if(XMLHttpRequest.status==401){
                	callback.stop();
                	if(!isstop){
                		isstop = true;
                		alert("请重新登录.");
                		//location.reload();
                		window.opener=null;
                		window.close();
                	}
                    
                }
            }
        });
    }

    return {
        "init" : function() {
            $(document)
                    .bind(
                        "focusin focusout keyup keydown keypress click dblclick mouseup mousedown mousemove mouseout mouseover",
                        function(event) {
                            last_active = new Date().getTime();
                        });

            /* 离开页面回调 */
            $(window).bind('beforeunload', function(e) {
                if (trace_id){
                    trace("end");
                }
            });
        },

        "start" : function() {
            startclock();
            /* 初始化播放回调 */
            trace("start");
            
            /* 每隔一段时间,回调播放跟踪记录 */
            callback = $.timer(function() {
                if (trace_id) {
                    trace("trace");
                }
            }, callback_interval, true);
            
            /* 11s 之后执行一次*/
            setTimeout(function(){
            	if(trace_id){
            		trace("trace");
            	}
            	
            },11000);
            

            /* 检查用户是否长时间未操作 */
            watch_dog = $.timer(function() {
                var current_time = new Date().getTime();
                // $("#study_time").text(h_text+":"+m_text+":"+s_text);
                if ((current_time - last_active) > pause_time) {
                    callback.pause();
                    watch_dog.pause();
                    trace("pause");
                    pauseclock();
                    $("#pause-confirm").dialog({
                        resizable : false,
                        width : 450,
                        height : 220,
                        modal : true,
                        position : "center",
                        zIndex : 1,
                        buttons : {
                            "继续播放" : function() {
                                startclock();
                                callback.play(true);
                                watch_dog.play(true);
                                $(this).dialog("close");
                                trace("trace");
                            }
                        }
                    });
                }
            }, check_interval, true);
            
        }

    }

}