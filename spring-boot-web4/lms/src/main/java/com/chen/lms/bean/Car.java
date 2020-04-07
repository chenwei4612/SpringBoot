package com.chen.lms.bean;

public class Car {
    private Integer carId;

    private Integer roadId;

    private String emId;

    private Integer carType;
    private int num;

	public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public Integer getRoadId() {
        return roadId;
    }

    public void setRoadId(Integer roadId) {
        this.roadId = roadId;
    }

    public String getEmId() {
        return emId;
    }

    public void setEmId(String emId) {
        this.emId = emId == null ? null : emId.trim();
    }

    public Integer getCarType() {
        return carType;
    }

    public void setCarType(Integer carType) {
        this.carType = carType;
    }

	public Car() {
		super();
	}

	public Car(Integer carId, Integer roadId, String emId, Integer carType) {
		super();
		this.carId = carId;
		this.roadId = roadId;
		this.emId = emId;
		this.carType = carType;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}


	
}