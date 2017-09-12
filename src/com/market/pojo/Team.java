package com.market.pojo;

import java.io.Serializable;

public class Team implements Serializable{
	
    private Integer team_id;

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

	private String team_name;

    @Override
	public String toString() {
		return "Team [team_id=" + team_id + ", manager_id=" + manager_id + ", manager=" + manager + ", team_name="
				+ team_name + ", team_description=" + team_description + "]";
	}

	public Integer getTeam_id() {
		return team_id;
	}

	public void setTeam_id(Integer team_id) {
		this.team_id = team_id;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getTeam_description() {
		return team_description;
	}

	public void setTeam_description(String team_description) {
		this.team_description = team_description;
	}

	private String team_description;
    
}