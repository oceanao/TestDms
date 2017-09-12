package com.market.pojo;

import java.io.Serializable;

public class Project implements Serializable{
	
    private Integer pro_id;

    private Integer manager_id;
    
    private User manager;
    
    
    public User getManager() {
		return manager;
	}

	public void setManager(User manager) {
		this.manager = manager;
	}

	public Integer getManager_id() {
		return manager_id;
	}

	public void setManager_id(Integer manager_id) {
		this.manager_id = manager_id;
	}

	private String pro_name;

    private String pro_description;
    
    private String pro_version;
    
    private String pro_file;

    public String getPro_file() {
		return pro_file;
	}

	public void setPro_file(String pro_file) {
		this.pro_file = pro_file;
	}

	public Integer getPro_id() {
        return pro_id;
    }

    public void setPro_id(Integer pro_id) {
        this.pro_id = pro_id;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name == null ? null : pro_name.trim();
    }

    public String getPro_description() {
        return pro_description;
    }

    public void setPro_description(String pro_description) {
        this.pro_description = pro_description == null ? null : pro_description.trim();
    }

	public String getPro_version() {
		return pro_version;
	}

	public void setPro_version(String pro_version) {
		this.pro_version = pro_version;
	}

	@Override
	public String toString() {
		return "Project [pro_id=" + pro_id + ", pro_name=" + pro_name + ", pro_description=" + pro_description
				+ ", pro_version=" + pro_version + "]";
	}
    
}