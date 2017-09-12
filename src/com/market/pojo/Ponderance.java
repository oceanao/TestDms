package com.market.pojo;
import java.io.Serializable;

public class Ponderance implements Serializable {
	private Integer  pon_id;
	private String  pon_name;
	private String pon_description;
	public Integer getPon_id() {
		return pon_id;
	}
	public void setPon_id(Integer pon_id) {
		this.pon_id = pon_id;
	}
	public String getPon_name() {
		return pon_name;
	}
	public void setPon_name(String pon_name) {
		this.pon_name = pon_name;
	}
	public String getPon_description() {
		return pon_description;
	}
	public void setPon_description(String pon_description) {
		this.pon_description = pon_description;
	}
	@Override
	public String toString() {
		return "Project [pon_id=" + pon_id + ", pon_name=" + pon_name + ", pon_description=" + pon_description
				+  "]";
	}
}
