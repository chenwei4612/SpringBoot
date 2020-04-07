package com.chen.lms.bean;

public class Department {
    private Integer deId;

    private String deName;
    
    private int num;
    

    public Integer getDeId() {
        return deId;
    }

    public void setDeId(Integer deId) {
        this.deId = deId;
    }

    public String getDeName() {
        return deName;
    }

    public void setDeName(String deName) {
        this.deName = deName == null ? null : deName.trim();
    }

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Department() {
		super();
	}

	public Department(Integer deId, String deName) {
		super();
		this.deId = deId;
		this.deName = deName;
	}

	@Override
	public String toString() {
		return "Department [deId=" + deId + ", deName=" + deName + ", num=" + num + "]";
	}
    
}