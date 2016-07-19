package com.longtime.ajy.mweb.model;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;

public class RankEntityVo extends RankEntity {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -7535568744769361384L;

	
	private RankEntityVo(){
		
	}
	
	public static RankEntityVo create(RankEntity entity){
		RankEntityVo vo = new RankEntityVo();
		try {
			PropertyUtils.copyProperties(vo, entity);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return vo;
	}
	
	
	public void addItem(Item item){
		List<Item> list = getItemList();
		list.add(item);
		Collections.sort(list,itemComparator);
		String items =  JSONObject.toJSONString(list);
		this.setItems(items);
	}

	public List<Item> getItemList() {
		String items = getItems();
		List<Item> itemsList;
		if (StringUtils.isBlank(items)) {
			itemsList = Lists.newArrayList();
		} else {
			itemsList = JSONObject.parseArray(items, Item.class);
			Collections.sort(itemsList, itemComparator);
		}
		return itemsList;

	}

	private static ItemComparator itemComparator = new ItemComparator();

	static class ItemComparator implements Comparator<Item> {

		@Override
		public int compare(Item o1, Item o2) {
			return (o1.getIndex() == o2.getIndex() ? 0 : (o1.getIndex() > o2.getIndex() ? 1 : -1));
		}

	}

	public static class Item {

		private String title;
		private String remark;
		private String img;
		private int index = 1;
		private String url;
		private String phone;
		
		

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getRemark() {
			return remark;
		}

		public void setRemark(String remark) {
			this.remark = remark;
		}

		public String getImg() {
			return img;
		}

		public void setImg(String img) {
			this.img = img;
		}

		public int getIndex() {
			return index;
		}

		public void setIndex(int index) {
			this.index = index;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		@Override
		public String toString() {
			return String.format("Item [title=%s, remark=%s, img=%s, index=%s, phone]", title, remark, img, index, phone);
		}

	}

	public static void main(String[] args) {
		RankEntity rank = new RankEntity();
		rank.setItems("[{\"url\":\"1\",\"index\":1}]");
		RankEntityVo vo = RankEntityVo.create(rank);
		
		System.out.println(ToStringBuilder.reflectionToString(vo.getItemList().get(0)));
	}

}
