package com.chen.lms.bean;

public class Route {
    private Integer rouId;

    private String area;

    private String dscope;

    public Integer getRouId() {
        return rouId;
    }

    public void setRouId(Integer rouId) {
        this.rouId = rouId;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getDscope() {
        return dscope;
    }

    public void setDscope(String dscope) {
        this.dscope = dscope == null ? null : dscope.trim();
    }

	public Route() {
		super();
	}

	public Route(Integer rouId, String area, String dscope) {
		super();
		this.rouId = rouId;
		this.area = area;
		this.dscope = dscope;
	}

	@Override
	public String toString() {
		return "Route [rouId=" + rouId + ", area=" + area + ", dscope=" + dscope + "]";
	}
    
}