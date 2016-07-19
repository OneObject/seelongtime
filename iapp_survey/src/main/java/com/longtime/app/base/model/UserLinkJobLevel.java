package com.longtime.app.base.model;

import com.longtime.common.model.BaseModel;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="iapp_base_user_joblevel")
public class UserLinkJobLevel extends BaseModel<String> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	   @Id
		@GeneratedValue(generator = "system-uuid")
		@GenericGenerator(name = "system-uuid", strategy = "uuid")
		@Column(length = 36)
	    private String id;
	   
	    private String userid;
	    
	    private String joblevelid;

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getUserid() {
			return userid;
		}

		public void setUserid(String userid) {
			this.userid = userid;
		}

		public String getJoblevelid() {
			return joblevelid;
		}

		public void setJoblevelid(String joblevelid) {
			this.joblevelid = joblevelid;
		}
	    
}
