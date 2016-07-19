 var setting = {
            view: {
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                selectedMulti: false,
                showLine: false,
                fontCss: setFontCss
            },
            edit: {
                enable: false,//将树本身设置成了不可编辑的状态
                editNameSelectAll: true,
                showRemoveBtn: showRemoveBtn,
                showRenameBtn: showRenameBtn
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                beforeDrag: beforeDrag,
                beforeEditName: beforeEditName,
                beforeRemove: beforeRemove,
                beforeRename: beforeRename,
                onRemove: onRemove,
                onRename: onRename,
                onClick: onClick//一个节点被点击后触发的事件
            }
        };

        var zNodes =[
            { id:1, pId:0, name:"企业管理", open:true},
            { id:11, pId:1, name:"行政管理"},
            { id:12, pId:1, name:"市场管理"},
            { id:13, pId:1, name:"企划管理"},
            { id:14, pId:1, name:"员工培训"},
            { id:2, pId:0, name:"市场营销", open:true},
            { id:21, pId:2, name:"客户关系维护"},
            { id:22, pId:2, name:"市场拓展技巧"},
            { id:3, pId:0, name:"开发技术", open:true},
            { id:31, pId:3, name:"html技术"},
            { id:32, pId:3, name:"java技术"},
            { id:33, pId:3, name:"php技术"},
            { id:34, pId:3, name:"android技术"},
            { id:35, pId:3, name:"ios技术"}
        ];
        var log, className = "dark";
        function beforeDrag(treeId, treeNodes) {
            return false;
        }
        function beforeEditName(treeId, treeNode) {
            className = (className === "dark" ? "":"dark");
            showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.selectNode(treeNode);
            return confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
        }
        function beforeRemove(treeId, treeNode) {
            className = (className === "dark" ? "":"dark");
            showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.selectNode(treeNode);
            return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
        }
        function onRemove(e, treeId, treeNode) {
            showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
        }
        function beforeRename(treeId, treeNode, newName, isCancel) {
            className = (className === "dark" ? "":"dark");
            showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
            if (newName.length == 0) {
                alert("节点名称不能为空.");
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                setTimeout(function(){zTree.editName(treeNode)}, 10);
                return false;
            }
            return true;
        }
        function onRename(e, treeId, treeNode, isCancel) {
            showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
        }
        function showRemoveBtn(treeId, treeNode) {
        	//第一个节点是否可以删除
            //return !treeNode.isFirstNode;
        	return true;
        }
        function showRenameBtn(treeId, treeNode) {
        //最后一个节点是否可以改名字
            //return !treeNode.isLastNode;
        	return true;
        }
        function showLog(str) {
            if (!log) log = $("#log");
            log.append("<li class='"+className+"'>"+str+"</li>");
            if(log.children("li").length > 8) {
                log.get(0).removeChild(log.children("li")[0]);
            }
        }
        function getTime() {
            var now= new Date(),
            h=now.getHours(),
            m=now.getMinutes(),
            s=now.getSeconds(),
            ms=now.getMilliseconds();
            return (h+":"+m+":"+s+ " " +ms);
        }

        var newCount = 1;
        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span");
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
            sObj.after(addStr);
            var btn = $("#addBtn_"+treeNode.tId);
            if (btn) btn.bind("click", function(){
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
                return false;
            });
        };
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.tId).unbind().remove();
        };
        function selectAll() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
        }
        //设置字体样式
        function setFontCss() {
        	return {color:"#000000",size:"14px",height: "28px",family:"微软雅黑"};
        };
        //数中的节点被点击的事件
        function onClick(){
        	$("#shu").removeClass("col-md-12");
        	$("#shu").addClass("col-md-4");
        	$("#operate").show("fast");
        }
