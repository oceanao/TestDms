package com.market.pojo;

public class Adminuser {
    private Integer ad_id;

    private String ad_username;

    private String ad_password;

    public Integer getAd_id() {
        return ad_id;
    }

    public void setAd_id(Integer ad_id) {
        this.ad_id = ad_id;
    }

    public String getAd_username() {
        return ad_username;
    }

    public void setAd_username(String ad_username) {
        this.ad_username = ad_username;
    }

    public String getAd_password() {
        return ad_password;
    }

    public void setAd_password(String ad_password) {
        this.ad_password = ad_password;
    }

	@Override
	public String toString() {
		return "Adminuser [ad_id=" + ad_id + ", ad_username=" + ad_username + ", ad_password=" + ad_password + "]";
	}
}