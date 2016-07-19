package com.longtime.ajy.model.vo;

import com.longtime.ajy.model.ResourceEntity;

public class ResourceVO extends ResourceEntity {
	
	private String path ; 
    
    private String module ;
    
    private String name;
    
    private Long size;
    
    private String suffix;
    
    private String releasetimestr;

	public String getReleasetimestr() {
		return releasetimestr;
	}

	public void setReleasetimestr(String releasetimestr) {
		this.releasetimestr = releasetimestr;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getSize() {
		return size;
	}

	public void setSize(Long size) {
		this.size = size;
	}

	public String getSuffix() {
		return suffix;
	}

	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}

	@Override
	public String toString() {
		return String.format("ResourceVO [path=%s, module=%s, name=%s, size=%s, suffix=%s]",
			path,
			module,
			name,
			size,
			suffix);
	}
    
    
	
}
