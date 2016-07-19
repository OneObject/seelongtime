

import java.text.DecimalFormat;

import com.myctu.platform.utils.NumberUtils;
import com.myctu.platform.protocol.transform.json.JacksonSupport;
import com.alibaba.fastjson.JSON;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Test {
    
    
  public static class TreeNode{
      String id;
      String name;
      List<TreeNode> list = new ArrayList<TreeNode>();
      
      
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

    
    public List<TreeNode> getList() {
        return list;
    }

    
    public void setList(List<TreeNode> list) {
        this.list = list;
    }

    public void addChildren(TreeNode node){
          list.add(node);
      }

    @Override
    public String toString() {
        return String.format("TreeNode [id=%s, name=%s, list=%s]", id, name, list);
    }
      
  }

    
   static class Node{
        String id;
        String releationId;
        String name;
        Node children;
        
        @Override
        public String toString() {
            return String.format("Node [id=%s, name=%s, children=%s]", id, name, children);
        }
        
        
    }
   
   static Map<String,TreeNode> map = new HashMap<String, TreeNode>(); // 记录 /节点全路径 --》 treenode  
   
   static TreeNode _root = new TreeNode();
   static{
      _root.id="domain_ajy";
   }
   public static void addTreeNode(String pname,Node node){
       
       TreeNode parent = null;
       if(null==pname){//直接添加到根下
           parent = _root;
       }else{
           parent = map.get(pname);
           
       }
       String key = node.name;
       if(null!=pname){
           key = pname+"/" + node.name; 
        }
        
        if(map.get(key)==null){// 当前节点没有创建
           TreeNode c = new TreeNode();
           c.name = node.name;
           parent.addChildren(c);
           map.put(key, c);  //记录当前节点已经创建
        }
        
        if(node.children!=null){
            addTreeNode(key,node.children);
        }
       
   }
   
   public static void inertDB(String pid,List<TreeNode> nodes){ //
       
       for (TreeNode treeNode : nodes) {
           // 1. 判断treeNode 是否存在DB中，如果不存在，新增,获取id
           treeNode.id = "";//设置id
           if(!treeNode.getList().isEmpty()){
               inertDB(treeNode.getId(),treeNode.getList());
           }
           
       }
       
       
   }
   
   
   
   
   public static Node toNode(String[] names,String releationId){
       Node node = new Node();
        
       if(null!=releationId){
           node.releationId = releationId;
       }
       
       for(int j= names.length-1;j>=0;j--){
           node.name = names[j];
           Node parent = new Node();
           parent.children = node;
           node = parent;
       }
       
       Node root = node.children;
       return root;
   }
   
    public static void main(String[] args) {

      
      Node node1= toNode(new String[]{"1","1-1","1-1"},null);
      Node node2= toNode(new String[]{"1","1-1"},null);
      Node node3= toNode(new String[]{"2","2-1","2-1-1"},null);
      Node node4= toNode(new String[]{"2","2-2","2-2-2"},null);
      Node node5= toNode(new String[]{"3","3-1","3-1-1"},null);
       
       
       addTreeNode(null, node1);
       addTreeNode(null, node2);
       addTreeNode(null, node2);
       addTreeNode(null, node3);
       addTreeNode(null, node3);
       addTreeNode(null, node4);
       addTreeNode(null, node4);
       addTreeNode(null, node5);
       addTreeNode(null, node5);
       
       System.out.println(JacksonSupport.encodeAsString(_root));
        
       
       inertDB(_root.getId(),_root.getList());
       
       DecimalFormat df = new DecimalFormat("#");
       System.out.println(df.format(1.10f));
    }

}
