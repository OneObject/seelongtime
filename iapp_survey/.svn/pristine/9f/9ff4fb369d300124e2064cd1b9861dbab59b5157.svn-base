function time_To_hhmmss(seconds) {
		var hh;
		var mm;
		var ss;
		//传入的时间为空或小于0
		if (seconds == null || seconds < 0) {
			return;
		}
		//得到小时
		hh = seconds / 3600 | 0;
		seconds = parseInt(seconds) - hh * 3600;
		if (parseInt(hh) < 10) {
			hh = "0" + hh;
		}
		//得到分
		mm = seconds / 60 | 0;
		//得到秒
		ss = parseInt(seconds) - mm * 60;
		if (parseInt(mm) < 10) {
			mm = "0" + mm;
		}
		if (ss < 10) {
			ss = "0" + ss;
		}
		return hh + ":" + mm + ":" + ss;

	}
