package com.longtime.app.base.controller.vo;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;


import com.longtime.app.base.model.Permission;


public class PermissionInfo {
	public final static Comparator<PermissionInfo> COMPARATOR = new Comparator<PermissionInfo>() {

		@Override
		public int compare(PermissionInfo o1, PermissionInfo o2) {
			// TODO Auto-generated method stub
			return o1.attr.leftWeigth > o2.attr.leftWeigth ? 1 : -1;
		}

	};
	
	public PermissionInfo(int expand_depth, Permission root) {
		this.data = new Data(root);
		this.attr = new Attribute(root);
		/* 如果是叶子节点设置为打开状态 */
		this.state = root.isLeaf() ? "open" : "closed";

		if (expand_depth <= 1) {
			return;
		}

		for (Permission node : root.getChildren()) {
			PermissionInfo child = new PermissionInfo(expand_depth - 1, node);
			children.add(child);
		}

		/* 如果有子节点被加载,那么也设为打开状态 */
		if (this.children.size() > 0) {
			this.state = "open";
		}
	}
	
	private Data data;

	private String state;

	private Attribute attr;

	private int expand_depth;
	
	private Set<PermissionInfo> children = new TreeSet<PermissionInfo>(COMPARATOR);

	public Data getData() {
		return data;
	}

	public String getState() {
		return state;
	}

	public Attribute getAttr() {
		return attr;
	}

	public int getExpand_depth() {
		return expand_depth;
	}

	public Set<PermissionInfo> getChildren() {
		return children;
	}
	public class Data {

		public Data(Permission root) {
			this.title = String.format("%s[%s~%s]", root.getName(), root.getLeftWeight(), root.getRightWeight());
			this.icon = root.isLeaf() ? "file" : "folder";

			if (root.isLeaf()) {
				this.attr.put("class", "jstree-hovered");
			}
		}

		String title;

		String icon;

		Map<String, String> attr = new HashMap<String, String>();

		public String getTitle() {
			return title;
		}

		public String getIcon() {
			return icon;
		}

		public Map<String, String> getAttr() {
			return attr;
		}

	}

	public class Attribute {

		public Attribute(Permission per) {
			this.id = per.getId();
			this.leftWeigth = per.getLeftWeight();
			this.rightWeight = per.getRightWeight();
			this.depth = per.getDepth();
			this.leaf = per.isLeaf();
			this.name = per.getName();
			if(per.getParentId()==null){
				this.pId=null;
			}
			else{
				this.pId = per.getParentId();
			}
			
		}

		String id;

		String name;
		
		String pId;
		
		Integer leftWeigth;

		Integer rightWeight;

		int depth;

		boolean leaf;

		public String getId() {
			return id;
		}

		public Integer getLeftWeigth() {
			return leftWeigth;
		}

		public Integer getRightWeight() {
			return rightWeight;
		}

		public Integer getDepth() {
			return depth;
		}

		public boolean getLeaf() {
			return leaf;
		}

		public String getName() {
			return name;
		}

		public String getpId() {
			return pId;
		}
		
		

	}
}
