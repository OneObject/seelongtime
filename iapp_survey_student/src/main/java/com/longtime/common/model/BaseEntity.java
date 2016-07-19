package com.longtime.common.model;

import java.io.Serializable;

public abstract class BaseEntity<ID extends Serializable> implements Entity<ID> {

    private static final long serialVersionUID = -3867686443509899871L;

    protected ID              id;

    protected String          creator;

    protected String          updater;

    protected Long            createtime = System.currentTimeMillis();

    protected Long            updatetime =0L;

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Long getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Long createtime) {
        this.createtime = createtime;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public Long getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Long updatetime) {
        this.updatetime = updatetime;
    }

    public static enum Delete {
        NORMAL((short) 0), DELETED((short) 1);

        public final short code;

        Delete(short code){
            this.code = code;
        }

        public short getCode() {
            return code;
        }

        public static Delete from(short code) {
            switch (code) {
                case (short) 1:
                    return DELETED;
                default:
                    return NORMAL;
            }
        }
    }

}
