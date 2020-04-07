package com.chen.lms.bean;

public class PrCi {
    private Integer prId;

    private Integer ciId;
  //2
    private City city;
    private Province province;

    public Integer getPrId() {
        return prId;
    }

    public void setPrId(Integer prId) {
        this.prId = prId;
    }

    public Integer getCiId() {
        return ciId;
    }

    public void setCiId(Integer ciId) {
        this.ciId = ciId;
    }

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public PrCi() {
		super();
	}

	public PrCi(Integer prId, Integer ciId) {
		super();
		this.prId = prId;
		this.ciId = ciId;
	}

	public PrCi(Integer prId, Integer ciId, City city, Province province) {
		super();
		this.prId = prId;
		this.ciId = ciId;
		this.city = city;
		this.province = province;
	}

	@Override
	public String toString() {
		return "PrCi [prId=" + prId + ", ciId=" + ciId + ", city=" + city + ", province=" + province + "]";
	}
    
}