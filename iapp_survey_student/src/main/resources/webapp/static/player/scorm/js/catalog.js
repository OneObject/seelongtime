function loadCatalog(site_context, catalog) {
    /* 组织章节目录树 */
    var chapters = catalog.chapters;
    var root_node = [ {
        title : "章节目录",
        identifier : catalog.identifier,
        isParent : true,
        open : true,
        chapters : chapters[0].chapters
    }];
    
    $(".recordlist > ul").addClass("parentrecord");
    var catalog_tree = $.fn.zTree.init($("#catalog_tree"), {
        data : {
            key : {
                name : "title",
                isParent : "visible",
                children : "chapters"
            },
            simpleData : {
                idKey : "identifier",
                enable : true
            }
        },
        view : {
            showIcon : false,
            showLine : false
        },
        callback : {
            onClick : function(event, treeId, treeNode, clickFlag) {
                if (treeNode.resource != null) {
                    locateToChapter(site_context, treeNode.resource);
                }
            }
        }
    }, root_node);

    // catalog_tree.expandAll(true);

    /* 设置起始章节 */
    var defaultScormPoint = findDefaultChapter();
    if (defaultScormPoint != null) {
        var selectedNode = catalog_tree.getNodeByParam("identifier", defaultScormPoint.identifier);
        catalog_tree.selectNode(selectedNode);
        locateToChapter(site_context, defaultScormPoint);
    }
}

function findDefaultChapter() {
    var defaultScormPoint = null;
    /* 优先使用cookie中记录的上一次chapter_id */
    var last_chapter_id = api.getSCOID();
    if (last_chapter_id != null) {
        var scormPoints = catalog.resources
        for ( var i = 0; i < scormPoints.length; i++) {
            var _scormPoint = scormPoints[i];
            if (_scormPoint.identifier == last_chapter_id) {
                defaultScormPoint = _scormPoint;
                break;
            }
        }
    }

    /* 如果cookie中没有使用章节的默认起始chapter */
    if (defaultScormPoint == null) {
        defaultScormPoint = catalog.defaultScormPoint;
    }

    return defaultScormPoint;
}

function locateToChapter(site_context, scormPoint) {
    api.setSCOID(scormPoint.identifier);
    var locate = site_context + "/" + scormPoint.href;

    document.getElementById("mainFrame").src = locate;
}