package com.chen.lms.bean;

public class Storehouse {
    private Integer storeId;

    private String type;

    private Integer number;

    private Integer stState;

    private String remark;
    private int num;

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getStState() {
        return stState;
    }

    public void setStState(Integer stState) {
        this.stState = stState;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Storehouse() {
		super();
	}

	public Storehouse(Integer storeId, String type, Integer number, Integer stState, String remark) {
		super();
		this.storeId = storeId;
		this.type = type;
		this.number = number;
		this.stState = stState;
		this.remark = remark;
	}

	public Storehouse(Integer storeId, String type, Integer number, Integer stState, String remark, int num) {
		super();
		this.storeId = storeId;
		this.type = type;
		this.number = number;
		this.stState = stState;
		this.remark = remark;
		this.num = num;
	}

	@Override
	public String toString() {
		return "Storehouse [storeId=" + storeId + ", type=" + type + ", number=" + number + ", stState=" + stState
				+ ", remark=" + remark + ", num=" + num + "]";
	}
    
}