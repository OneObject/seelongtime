/**
 * lightDialog  可自定义的对话框
 */
var lightDialog = (function () {
    'use strict';
    var createHtml, showLightDialog;
    var handleClickSure, handleClickCancel;
    var actionSure, actionCancel;
    var remove;
    var configMap = {//可选配置参数
        isShowHeader: true,  //设置对话框是否包含标题
        headerText: '版本记录',  //设置标题内容
        btnModel: 1,  //设置对话框按钮的数目，可配置为1或2
        contentText: '暂无内容',  //设置对话框提示内容
        footerText: ['关闭'],  //设置按钮上文字
        width: 300  //设置对话框宽度
    };
    var myConfigMap;
    var domMap = {
        dialog: null
    };

    createHtml = function () {
        var html = [];
        var div = document.createElement('div');
        div.className = 'dialog-wrapper';
        div.id = 'dialog-wrapper';
        html.push('<div class="dialog-box" style="width:'+ myConfigMap.width +'px;">');
        if (myConfigMap.isShowHeader) {
            html.push('<div class="dialog-header set-color set-bd-color">'+ myConfigMap.headerText +'</div>');
        }
        html.push('<div class="dialog-content">'+ myConfigMap.contentText +'</div>');
        if (myConfigMap.btnModel === 2) {
            html.push('<div class="dialog-footer"><span class="set-color" id="dialog-cancel">'+ myConfigMap.footerText[0] +'</span><span  class="set-color" id="dialog-sure">'+ myConfigMap.footerText[1] +'</span></div>');
        } else if (myConfigMap.btnModel === 1) {
            html.push('<div class="dialog-footer cols-1"><span class="set-color"  id="dialog-sure">'+ myConfigMap.footerText[0] +'</span></div>');
        }
        html.push('</div>');
        div.innerHTML = html.join('');
        domMap.dialog = div;
        return div;
    };

    showLightDialog = function (initMap, sureCallBack, cancelCallBack) {//initMap：对话框的配置参数，sureCallBack:点击确认时的回调函数，cancelCallBack：点击取消时的回调函数
        if (!initMap) {
            myConfigMap = configMap;
        }
        if (typeof initMap === 'string') {
            configMap.contentText = initMap;
            myConfigMap = configMap;
        } else if (initMap && typeof initMap === 'object') {
            myConfigMap = $.extend(true, {}, configMap, initMap);  //这一行代码依赖了jQuery,可优化
        }
        if (sureCallBack && typeof sureCallBack === 'function') {
            actionSure = sureCallBack;
        } else {
            actionSure = remove;
        }
        if (cancelCallBack && typeof cancelCallBack === 'function') {
            actionCancel = cancelCallBack;
        } else {
            actionCancel = remove;
        }
        document.body.appendChild(createHtml());
        if (myConfigMap.btnModel === 2) {
            document.getElementById('dialog-sure').addEventListener('click', handleClickSure, false);
            document.getElementById('dialog-cancel').addEventListener('click', handleClickCancel, false);
        } else if (myConfigMap.btnModel === 1) {
            document.getElementById('dialog-sure').addEventListener('click', handleClickSure, false);
        }
    };

    handleClickSure = function (e) {
        actionSure();
    };

    handleClickCancel = function (e) {
        actionCancel();
    };

    remove = function () {
        document.body.removeChild(domMap.dialog);
    };

    return {//外部可调用的接口函数
        show: showLightDialog,  //弹出对话框
        remove: remove  //移除对话框
    };
}());
