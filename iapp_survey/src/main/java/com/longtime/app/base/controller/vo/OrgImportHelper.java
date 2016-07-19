package com.longtime.app.base.controller.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.common.base.Splitter;
import com.myctu.platform.protocol.transform.json.JacksonSupport;

public class OrgImportHelper {

    Map<String, TreeNode> map   = new HashMap<String, TreeNode>(); // 记录 /节点全路径 --》 treenode

    TreeNode              _root = new TreeNode();
    
    String domain ;

    public OrgImportHelper(String domain){
    	this.domain = domain;
        _root.id = String.format("domain_%s", domain);

    }

    
    /**
     * 
     * @param orgPathStr  /技术部/测试一
     * @param releationId
     * @return
     */
    public TreeNode addNode(String orgFullPathStr,String releationId){
        String[] names =  Splitter.on("/").omitEmptyStrings().splitToList(orgFullPathStr).toArray(new String[0]);
        this.addNode(names, releationId);
        return _root;
    }
    public TreeNode addNode(String[] names, String releationId) {

        NodeVO node = toNode(names, releationId);

        addToTreeNode(null, node);
        return _root;
    }

    public TreeNode getRoot() {
        return _root;
    }
    public String getDomain(){
    	return domain;
    }
    private void addToTreeNode(String pname, NodeVO node) {

        TreeNode parent = null;
        if (null == pname) {// 直接添加到根下
            parent = _root;
        } else {
            parent = map.get(pname);

        }
        String key = node.name;
        if (null != pname) {
            key = pname + "/" + node.name;
        }

        if (map.get(key) == null) {// 当前节点没有创建
            TreeNode c = new TreeNode();
            c.name = node.name;
            c.releationId = node.releationId;
            parent.addChildren(c);
            map.put(key, c); // 记录当前节点已经创建
        }

        if (node.children != null) {
            addToTreeNode(key, node.children);
        }

    }

    private NodeVO toNode(String[] names, String releationId) {
        NodeVO node = new NodeVO();

        if (null != releationId) {
            node.releationId = releationId;
        }

        for (int j = names.length - 1; j >= 0; j--) {
            node.name = names[j];
            NodeVO parent = new NodeVO();
            parent.children = node;
            node = parent;
        }

        NodeVO root = node.children;
        return root;
    }

    static class NodeVO {

        String id;
        String releationId;
        String name;
        NodeVO children;

        @Override
        public String toString() {
            return String.format("Node [id=%s, releationId=%s, name=%s, children=%s]", id, releationId, name, children);
        }

    }

    public static class TreeNode {

        String         id;
        String         name;
        String         releationId;
        List<TreeNode> childrens = new ArrayList<TreeNode>();

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public List<TreeNode> getChildrens() {
            return childrens;
        }

        public void setChildrens(List<TreeNode> childrens) {
            this.childrens = childrens;
        }

        public void addChildren(TreeNode node) {
            childrens.add(node);
        }

        public String getReleationId() {
            return releationId;
        }

        public void setReleationId(String releationId) {
            this.releationId = releationId;
        }

        @Override
        public String toString() {
            return String.format("TreeNode [id=%s, name=%s, releationId=%s, childrens=%s]", id, name, releationId,
                                 childrens);
        }

    }

    public static void main(String[] args) {

        OrgImportHelper h = new OrgImportHelper("ajy");

        h.addNode(new String[] { "1", "1-1", "1-1-1" }, "abc");
        h.addNode(new String[] { "1", "1-2", "1-2-1" }, null);
        h.addNode(new String[] { "1", "1-3", "1-3-1" }, null);
        h.addNode(new String[] { "2", "2-1", "2-1-1" }, null);
        h.addNode("/2/2-2/2-2-1", null);

//        TreeNode n = h.getRoot();
//        String domain = h.getDomain();

//        System.out.println(JacksonSupport.encodeAsString(n));
        
        
        
        
//        insertDB(n.id,n.getChildrens());

    }
    
    
    /*private static void insertDB(String pid,List<TreeNode> node){
    	
    	
    	
    	// pid and node.name  查询数据库中的信息，如有获取id ,没有则新增
    	
    	//获取了node的id
    	
    	//添加node 下的childrens
    	
    	if(null!=node.getChildrens() && !node.getChildrens().isEmpty()){
    		
    		for (TreeNode tmp : node.getChildrens()) {
				insertDB(node.id,tmp);
			}
    		
    	}
    	
    	
    	
    }*/

}
