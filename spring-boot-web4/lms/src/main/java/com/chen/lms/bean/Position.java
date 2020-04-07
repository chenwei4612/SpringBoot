package com.chen.lms.bean;

public class Position {
    private Integer poId;

    private String poName;

    public Integer getPoId() {
        return poId;
    }

    public void setPoId(Integer poId) {
        this.poId = poId;
    }

    public String getPoName() {
        return poName;
    }

    public void setPoName(String poName) {
        this.poName = poName == null ? null : poName.trim();
    }

	public Position() {
		super();
	}

	public Position(Integer poId, String poName) {
		super();
		this.poId = poId;
		this.poName = poName;
	}

	@Override
	public String toString() {
		return "Position [poId=" + poId + ", poName=" + poName + "]";
	}
    
}