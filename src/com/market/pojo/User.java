package com.market.pojo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
	
    private Integer user_id;
    private Integer team_id;
    private Team team;
    public Integer getTeam_id() {
		return team_id;
	}

	public void setTeam_id(Integer team_id) {
		this.team_id = team_id;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getHostnumber() {
		return hostnumber;
	}

	public void setHostnumber(int hostnumber) {
		this.hostnumber = hostnumber;
	}

	public int getHandlernumber() {
		return handlernumber;
	}

	public void setHandlernumber(int handlernumber) {
		this.handlernumber = handlernumber;
	}

	public int getSignnumber() {
		return signnumber;
	}

	public void setSignnumber(int signnumber) {
		this.signnumber = signnumber;
	}

	private String  telephone;
    private String  student_num;
    private String  username;
    private String  picture;
    private String  password;
    private String  message;
    private Integer role;
    private int userscore;
    private int hostnumber;
    private int handlernumber;
    private int signnumber;
    public String useraddress;
    private int money;  
    private Date register_time;
    public String email;

    
    
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	
    
    public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getUseraddress() {
		return useraddress;
	}


	public int getUserscore() {
		return userscore;
	}

	public void setUserscore(int userscore) {
		this.userscore = userscore;
	}

	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}

	
    

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getStudent_num() {
        return student_num;
    }

    public void setStudent_num(String student_num) {
        this.student_num = student_num;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password ;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Date getRegister_time() {
        return register_time;
    }

    public void setRegister_time(Date register_time) {
        this.register_time = register_time;
    }

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", student_num=" + student_num + ", username=" + username + ", password="
				+ password + ", role=" + role + ",useraddress=" + useraddress +",money=" + money + " register_time=" + register_time + "]";
	}

	
}