package com.chen.lms.bean;

public class Orst {
    private Integer stId;

    private String orId;

    private String status;

    private Integer roId;

    private Integer carId;
    private int num;

    public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Integer getStId() {
        return stId;
    }

    public void setStId(Integer stId) {
        this.stId = stId;
    }

    public String getOrId() {
        return orId;
    }

    public void setOrId(String orId) {
        this.orId = orId == null ? null : orId.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Integer getRoId() {
        return roId;
    }

    public void setRoId(Integer roId) {
        this.roId = roId;
    }

    public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

	public Orst() {
		super();
	}

	public Orst(Integer stId, String orId, String status, Integer roId, Integer carId) {
		super();
		this.stId = stId;
		this.orId = orId;
		this.status = status;
		this.roId = roId;
		this.carId = carId;
	}

	@Override
	public String toString() {
		return "Orst [stId=" + stId + ", orId=" + orId + ", status=" + status + ", roId=" + roId + ", carId=" + carId
				+ ", num=" + num + "]";
	}
    
}