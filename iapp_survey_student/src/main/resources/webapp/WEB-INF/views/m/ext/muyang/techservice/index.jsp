<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<title>技术支持</title>
		<link type="text/css" rel="stylesheet" href="${basepath}/static/m/ext/muyang/css/techservice.css" />
	</head>
	<body>
        <section class="module-select">
            <div class="box-select">
                <div class="select-line" id="select-line-1" data-status="closed" data-href="box-options-1" data-id="s0">
                    <span>请选择</span>
                    <label></label>
                </div>
                <div class="box-options" id="box-options-1" style="display: none;">

                </div>
            </div>
            <div class="box-select">
                <div class="select-line"  id="select-line-2" data-status="closed" data-href="box-options-2"  data-id="g0">
                    <span>请选择</span>
                    <label class="arrow"></label>
                </div>
                <div class="box-options" id="box-options-2" style="display: none;">

                </div>
            </div>
        </section>
        <section class="module-group-show" id="module-group-show">
            <!--<div class="result-line">-->
                <!--<div class="base-info">-->
                    <!--<label class="arrow"></label>-->
                    <!--<div class="man-info">-->
                        <!--<span class="name">赵波</span>-->
                        <!--<span class="department">研究院</span>-->
                        <!--<span class="position">主管</span>-->
                    <!--</div>-->
                    <!--<div class="product-info">混合产品、喷涂、添加产品</div>-->
                <!--</div>-->
                <!--<div class="more-info">-->
                    <!--<label class="arrow"></label>-->
                    <!--<div class="series">-->
                        <!--混合产品、喷涂、添加产品-->
                    <!--</div>-->
                    <!--<div class="tel">139999999999</div>-->
                <!--</div>-->
            <!--</div>-->

        </section>
        <script type="text/javascript" src="${basepath}/static/m/ext/muyang/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" >
		
		/**
 * Created by Administrator on 2015/6/15.
 */

var sectionList = ${sectionList};
var groupList = ${groupList};
var manList = ${manList};

$(function () {
    var $boxOptions1 = $('#box-options-1');
    var $boxOptions2 = $('#box-options-2');
    var $selectLine1 = $('#select-line-1');
    var $selectLine2 = $('#select-line-2');
    var $moduleGroupShow = $('#module-group-show');
    var $selectLineList = $('.select-line');


    $boxOptions1.append(createSectionList());
    $boxOptions2.append(createGroupList('s0', 0));

    $moduleGroupShow.append(createAllResult());
    bindEvent();

    function createAllResult() {
        var totalStr = '';
		
        var sList = groupList;
        var temp1;
        var temp2;
        var name1;

        for (var i = 0; i < sList.length; i++) {
            temp1 = sList[i];
            for ( var tempName1 in temp1) {
                name1 = tempName1;
            }
            for (var j = 0; j < temp1[name1].length; j++) {
                temp2 = temp1[name1][j];
                for (var tempName2 in temp2) {
                    totalStr += createResult(name1, tempName2);
                }
            }
        }

        return totalStr;
    }

    function bindEvent() {
        $selectLineList.bind('click', function () {
            var temp = $(this);
            var href = temp.data('href');
            var status = temp.data('status');
            $boxOptions1.hide();
            $boxOptions2.hide();
            if (status === 'closed') {
                temp.data('status', 'opened');
                $('#' + href).show();
            } else if (status === 'opened') {
                temp.data('status', 'closed');
                $('#' + href).hide();
            }
            return false;
        });

        $('#box-options-1 span').bind('click', function (e) {
            var $temp = $(this);
            var id = $temp.data('id');
            var text = $temp.data('text');
            var i = id.slice(1);
            $temp.addClass('active').siblings().removeClass('active');
            $temp.closest('.box-options').hide().prev('.select-line').data('status', 'closed').data('id', id).find('span').html(text);
			$selectLine2.find('span').html(groupList[i][id][0].g0);
            $boxOptions2.html(createGroupList(id, i));
            $selectLine2.data('id', 'g0');
            bindBoxOptions2Event();
            getResult();
            e.stopPropagation();
        });

        bindBoxOptions2Event();
        bindBaseInfoEvent();
    }

    function bindBoxOptions2Event() {
        $('#box-options-2 span').bind('click', function (e) {
            var $temp = $(this);
            var id = $temp.data('id');
            var text = $temp.data('text');
            $temp.addClass('active').siblings().removeClass('active');
            $temp.closest('.box-options').hide().prev('.select-line').data('status', 'closed').data('id', id).find('span').html(text);
            getResult();
            e.stopPropagation();
        });
    }

    function bindBaseInfoEvent() {
        $('.base-info').bind('click', function (e) {
            var $temp = $(this);
            if ($temp.is('.opened')) {
                $temp.removeClass('opened').next('.more-info').hide();
            } else {
                $temp.addClass('opened').next('.more-info').show();
            }
            e.stopPropagation();
        });
    }

    function getResult() {
        var sid = $selectLine1.data('id');
        var gid = $selectLine2.data('id');
        $moduleGroupShow.html(createResult(sid, gid));
        bindBaseInfoEvent();
    }

    function createSectionList() {
        var htmlStr = '';
        var tempList = sectionList;
        for (var i = 0; i < tempList.length; i++) {
            htmlStr += '<span data-id="s'+ i +'" data-text="'+ tempList[i]['s' + i] +'">'+ tempList[i]['s' + i] +'</span>';
        }
        return htmlStr;
    }

    function createGroupList(sectionId, num) {
        var htmlStr = '';
        var tempList = groupList[num][sectionId];
        for (var i = 0; i < tempList.length; i++) {
            htmlStr += '<span data-id="g'+ i +'" data-text="'+ tempList[i]['g' + i] +'">'+ tempList[i]['g' + i] +'</span>';
        }
        return htmlStr;
    }

    function createResult(sectionId, groupId) {
        var htmlStr = '';
        var htmlArr;
        var dataList = manList[0][sectionId+'_'+groupId];
        var temp;
        if (typeof dataList === 'undefined') {
            //console.log('no data!');
            return;
        }
        for (var i = 0; i < dataList.length; i++) {
            temp = dataList[i];
            htmlArr = [];
            htmlArr.push('<div class="result-line">');
            htmlArr.push('<div class="base-info">');
            if (temp.series !== '' || temp.tel !== '') {
                htmlArr.push('<label class="arrow"></label>');
            }
            htmlArr.push('<div class="man-info">');
            if (temp.name !== '') {
                htmlArr.push('<span class="name">'+ temp.name +'</span>');
            }
            if (temp.department !== '') {
                htmlArr.push('<span class="department">'+ temp.department +'</span>');
            }
            if (temp.position !== '') {
                htmlArr.push('<span class="position">'+ temp.position +'</span>');
            }
            htmlArr.push('</div>');
            if (temp.products !== '') {
                htmlArr.push('<div class="product-info">'+ temp.products +'</div>');
            }
            htmlArr.push('</div>');
            if (temp.series !== '' || temp.tel !== '') {
                htmlArr.push('<div class="more-info" style="display: none;">');
                htmlArr.push('<label class="arrow"></label>');
                if (temp.series !== '') {
                    htmlArr.push('<div class="series">'+ temp.series +'</div>');
                }
                if (temp.tel !== '') {
                    htmlArr.push('<div class="tel"><a href="tel:'+ temp.tel +'">'+ temp.tel +'</a></div>');
                }
                htmlArr.push('</div>');
            }
            htmlArr.push('</div>');

            htmlStr += htmlArr.join('');
        }
        return htmlStr;
    }

});
		
		
		</script>

	</body>
</html>
