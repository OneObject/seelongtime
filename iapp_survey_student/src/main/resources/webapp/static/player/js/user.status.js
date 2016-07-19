function loginStatus(user_id, path) {
	var status;
	$.ajax({
		"url" : path,
		"async" : false,
		"cache" : false,
		"data" : {
			"user_id" : user_id
		},
		"success" : function(data, textStatus, jqXHR) {
			status = data;
		},
		"error" : function(event, jqXHR, ajaxSettings, thrownError) {
			status = false;
		}
	});
	return status
}