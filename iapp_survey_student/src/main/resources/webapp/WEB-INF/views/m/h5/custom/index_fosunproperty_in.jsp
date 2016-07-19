<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<body>

<script type="text/javascript" src="https://g.alicdn.com/ilw/ding/0.3.9/scripts/dingtalk.js"></script>
<script type="text/javascript" >

	dd.ready(function () {
        dd.biz.util.openLink({
            url:"http://www.aijiayou.com/student/m/site/index/ff808081511a2b3301517f483fa67c66.xhtml?fdomain=fosunproperty",
            showMenuBar: true, //是否显示右上角按钮，默认true 显示 0.0.2
            credible: true, //是否可信的url，即白名单机制，可信的url支持调用jsapi，默认true 0.0.2
            enableShare: true, //是否启用默认分享(服务端抓取内容)，如果为false，则分享组件只有刷新动作; 默认true
            onSuccess: function () {
            },
            onFail: function (err) {
            }
        })
    });

</script>

</body>
</html>