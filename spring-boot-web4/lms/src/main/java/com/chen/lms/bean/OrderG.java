package com.chen.lms.bean;

public class OrderG {
    private String ordId;

    private String date;

    private String rname;

    private String rphone;

    private String raddress;

    private String sname;

    private String sphone;

    private String saddress;

    private String remark;
    
    private String rpovince;
    private String rcity;
    private String spovince;
    private String scity;
    private int rpi;
    private int spi;
    private int num;

    public String getRpovince() {
		return rpovince;
	}

	public void setRpovince(String rpovince) {
		this.rpovince = rpovince;
	}

	public String getRcity() {
		return rcity;
	}

	public void setRcity(String rcity) {
		this.rcity = rcity;
	}

	public String getSpovince() {
		return spovince;
	}

	public void setSpovince(String spovince) {
		this.spovince = spovince;
	}

	public String getScity() {
		return scity;
	}

	public void setScity(String scity) {
		this.scity = scity;
	}

	public String getOrdId() {
        return ordId;
    }

    public void setOrdId(String ordId) {
        this.ordId = ordId == null ? null : ordId.trim();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getRphone() {
        return rphone;
    }

    public void setRphone(String rphone) {
        this.rphone = rphone == null ? null : rphone.trim();
    }

    public String getRaddress() {
        return raddress;
    }

    public void setRaddress(String raddress) {
        this.raddress = raddress == null ? null : raddress.trim();
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public String getSphone() {
        return sphone;
    }

    public void setSphone(String sphone) {
        this.sphone = sphone == null ? null : sphone.trim();
    }

    public String getSaddress() {
        return saddress;
    }

    public void setSaddress(String saddress) {
        this.saddress = saddress == null ? null : saddress.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public OrderG() {
		super();
	}

	public OrderG(String ordId, String date, String rname, String rphone, String raddress, String sname, String sphone,
			String saddress, String remark) {
		super();
		this.ordId = ordId;
		this.date = date;
		this.rname = rname;
		this.rphone = rphone;
		this.raddress = raddress;
		this.sname = sname;
		this.sphone = sphone;
		this.saddress = saddress;
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "OrderG [ordId=" + ordId + ", date=" + date + ", rname=" + rname + ", rphone=" + rphone + ", raddress="
				+ raddress + ", sname=" + sname + ", sphone=" + sphone + ", saddress=" + saddress + ", remark=" + remark
				+ "]";
	}

	public int getRpi() {
		return rpi;
	}

	public void setRpi(int rpi) {
		this.rpi = rpi;
	}

	public int getSpi() {
		return spi;
	}

	public void setSpi(int spi) {
		this.spi = spi;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
    
}