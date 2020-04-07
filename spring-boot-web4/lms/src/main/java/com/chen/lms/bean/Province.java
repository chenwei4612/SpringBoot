package com.chen.lms.bean;

public class Province {
    private Integer provinceId;

    private String province;

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

	@Override
	public String toString() {
		return "Province [provinceId=" + provinceId + ", province=" + province + "]";
	}
    
}