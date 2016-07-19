var flag = 0;
/**
 * 分页+搜索
 */
function list(id,org,orderField) {
	$("#loading").show();  //正在加载
	var divId = "block-list";
	var id = $("#choseid").val();
	var org = $("#org").val();
	var orderField = $("#orderField").val();
	var data = {"id":id,"org":org,"orderField":orderField };
	var url = basepath+"/m/ext/unicom/chose/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		$("#loading").hide();  //正在加载
	});
}

$(function () {
    var dropDownWidth = (window.innerWidth - 24) / 2;
    var $btnDropDown1 = $('#btn-drop-down-1');
    var $btnDropDown2 = $('#btn-drop-down-2');
    var $dropDownSpanList = $('.box-drop-down span');

    $dropDownSpanList.width(dropDownWidth).bind('click', function (e) {
        var $temp = $(this);
        var text = $temp.html() + '<label></label>';
        $temp.addClass('active')
                .closest('.box-drop-down')
                .hide()
                .closest('li')
                .find('.btn-drop-down')
                .data('status', 'closed')
                .html(text)
                .end()
                .end()
                .end()
                .siblings('span')
                .removeClass('active');
        $("#tap-hover").remove();
        e.stopPropagation();
    });

    $btnDropDown1.bind('click', function () {
        var temp = $(this);
        var href = temp.data('href');
        var status = temp.data('status');
        if (status === 'closed') {
            temp.data('status', 'opened');
            $('body').append('<div id="tap-hover" class="tap-hover"></div>');
            $("#tap-hover").bind('touchstart', function () {
                temp.data('status', 'closed');
                $('#' + href).hide();
                $(this).remove();
                return false;
            });
            $('#' + href).show();
        } else if (status === 'opened') {
            temp.data('status', 'closed');
            $('#' + href).hide();
        }
    });

    $btnDropDown2.bind('click', function () {
        var temp = $(this);
        var href = temp.data('href');
        var status = temp.data('status');
        if (status === 'closed') {
            temp.data('status', 'opened');
            $('body').append('<div id="tap-hover" class="tap-hover"></div>');
            $("#tap-hover").bind('touchstart', function () {
                temp.data('status', 'closed');
                $('#' + href).hide();
                $(this).remove();
                return false;
            });
            $('#' + href).show();
        } else if (status === 'opened') {
            temp.data('status', 'closed');
            $('#' + href).hide();
        }
    });
    
    list();
});

function listByOrg(org){
	$("#org").val(org);
	list();
}

function sortList(orderField){
	$("#orderField").val(orderField);
	list();
}


function isChoseStart(){
	var start = parseInt($("#start").val());
	var date = new Date();
	var time = date.getTime();
	if(start != 0 && time<start){
		return true;
	}
	return false;
}

function isChoseOver(){
	var end = $("#end").val();
	var date = new Date();
	var time = date.getTime();
	
	if(end != 0 && time>end){
		return true;
	}
	return false;
}
