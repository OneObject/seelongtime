package com.longtime.app.ixin.mgr.rank.model;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * 话题实体 对应表：ixin_topic
 */
public class RankEntity {

	private String id;//主键
	private String title;//标题
	private String remark;//简介
	private String domain;//租户
	private String cover; //封面
	
	
	private int model = 0;//类型  0:默认自定义,1:积分,2:素材
	
	
	private int datetype = 0;//周期类型
	
	private Long starttime;
	
	private Long endtime;

	private List<Item> items;

	protected String creator;

	protected String updater;

	protected Long createtime=System.currentTimeMillis();

	protected Long updatetime;
	private String creatorName;
	private String updaterName;
	
	private String timestr;
	
	public String getCreatorName() {
		return creatorName;
	}

	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}

	public String getUpdaterName() {
		return updaterName;
	}

	public void setUpdaterName(String updaterName) {
		this.updaterName = updaterName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTimestr() {
		return timestr;
	}

	public void setTimestr(String timestr) {
		this.timestr = timestr;
	}

	public int getDatetype() {
		return datetype;
	}

	public void setDatetype(int datetype) {
		this.datetype = datetype;
	}

	public Long getStarttime() {
		return starttime;
	}

	public void setStarttime(Long starttime) {
		this.starttime = starttime;
	}

	public Long getEndtime() {
		return endtime;
	}

	public void setEndtime(Long endtime) {
		this.endtime = endtime;
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


	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}
	
	public int getModel() {
		return model;
	}

	public void setModel(int model) {
		this.model = model;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	public Long getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Long updatetime) {
		this.updatetime = updatetime;
	}

	public void addItem(Item item){
		
		if(items==null){
			items = Lists.newArrayList();
		}
		items.add(item);
	}
	
	public String  getItemStr(){
		if(null==items){
			items = Lists.newArrayList();
		}
		
		Collections.sort(items,itemComparator);
		return JSONObject.toJSONString(items);
	}
	
	public void setItemsFromString(String itemstr){
		
		if(StringUtils.isBlank(itemstr)){
			items = Collections.EMPTY_LIST;
		}else{
			items = JSONObject.parseArray(itemstr, Item.class);
			Collections.sort(items, itemComparator);
		}
		
		
	}
	
	
	private static ItemComparator itemComparator= new ItemComparator();
	static class ItemComparator implements Comparator<Item>{

		@Override
		public int compare(Item o1, Item o2) {
			return  (o1.getIndex() == o2.getIndex()? 0 : (o1.getIndex()>o2.getIndex()?1:-1));
		}
		
	}
	
	@Override
	public String toString() {
		return String.format("RankEntity [id=%s, title=%s, remark=%s, domain=%s, cover=%s, items=%s, creator=%s, updater=%s, createtime=%s, updatetime=%s]",
			id,
			title,
			remark,
			domain,
			cover,
			items,
			creator,
			updater,
			createtime,
			updatetime);
	}

	
	public static void main(String[] args) {
		
		
		Item i1 = new Item();
		i1.setTitle("1");
		i1.setIndex(10);
		
		Item i2 = new Item();
		i2.setTitle("2");
		i2.setIndex(2);
		RankEntity rank = new RankEntity();
		rank.addItem(i1);
		rank.addItem(i2);
		
		System.out.println(rank.getItemStr());
		
		rank.setItemsFromString(rank.getItemStr());
		
		System.out.println(rank.getItems());
		
		
		
	}
}
