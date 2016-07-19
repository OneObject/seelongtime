package com.longtime.app.image.model;


public class ImageModel {
    
    private String id;
    
    private String realname;
    
    private String suffix;
    
    private long createtime;

    
    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }

    
    public String getRealname() {
        return realname;
    }

    
    public void setRealname(String realname) {
        this.realname = realname;
    }

    
    public String getSuffix() {
        return suffix;
    }

    
    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    
    public long getCreatetime() {
        return createtime;
    }

    
    public void setCreatetime(long createtime) {
        this.createtime = createtime;
    }


    @Override
    public String toString() {
        return String.format("ImageModel [id=%s, realname=%s, suffix=%s, createtime=%s]", id, realname, suffix,
                             createtime);
    }
    
    

}
