package com.market.dao.provider;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.market.pojo.User;


public class UserDynaSqlProvider {

	public String selectWhitParam(Map<String, Object> params) {
		String sql = new SQL() {
			{
				SELECT(" * ");
				FROM(" user ");
				if (params.get("user") != null) {
					User user = (User) params.get("user");
					if (user.getStudent_num() != null && !user.getStudent_num().equals("")) {
						WHERE("  student_num LIKE CONCAT ('%',#{user.student_num},'%') ");
					}
					if (user.getUsername() != null && !user.getUsername().equals("")) {
						WHERE("  username LIKE CONCAT ('%',#{user.username},'%') ");
					}
					if (user.getRole() != null && user.getRole() != 0) {
						WHERE(" role = #{user.role} ");
					}
					if (user.getUseraddress() != null && !user.getUseraddress().equals("")) {
						WHERE(" useraddress LIKE CONCAT ('%',#{user.useraddress},'%') ");
					}
					if ( user.getMoney() != 0) {
						WHERE(" money = #{user.money} ");
					}
					if ( user.getUserscore() != 0) {
						WHERE(" userscore = #{user.userscore} ");
					}
					
					if (user.getTeam()!= null && user.getTeam().getTeam_id() != null
							&&user.getTeam().getTeam_id() != 0) {
						WHERE(" team_id = #{user.team.team_id} ");
					}
					
				}
			}
		}.toString();
		
		if(params.get("pageModel") != null){
			sql += " limit #{pageModel.firstLimitParam} , #{pageModel.pageSize}  ";
		}
		return sql;
	}

	// 动态查询总数量
	public String count(Map<String, Object> params){
		return new SQL(){
			{
				SELECT(" count(*) ");
				FROM(" user ");
				if(params.get("user") != null){
					User user = (User)params.get("user");
					if(user.getStudent_num()!= null && !user.getStudent_num().equals("")){
						WHERE(" student_num LIKE CONCAT ('%',#{user.student_num},'%') ");
					}
					if(user.getUsername() != null && !user.getUsername().equals("")){
						WHERE(" username LIKE CONCAT ('%',#{user.username},'%') ");
					}
					if(user.getUseraddress() != null && !user.getUseraddress().equals("")){
						WHERE(" useraddress LIKE CONCAT ('%',#{user.useraddress},'%') ");
					}
					if(user.getTelephone() != null && !user.getTelephone().equals("")){
						WHERE(" telephone LIKE CONCAT ('%',#{user.telephone},'%') ");
					}
					if(user.getPicture()!= null && !user.getPicture().equals("")){
						WHERE(" picture LIKE CONCAT ('%',#{user.picture},'%') ");
					}
					if(user.getMessage()!= null && !user.getMessage().equals("")){
						WHERE(" message LIKE CONCAT ('%',#{user.message},'%') ");
					}
				
					if(user.getEmail() != null && !user.getEmail().equals("")){
						WHERE(" email LIKE CONCAT ('%',#{user.email},'%') ");
					}
					
					if(user.getMoney()!= 0){
						WHERE(" money=#{user.money}");
					}
					if(user.getUserscore()!= 0){
						WHERE(" userscore=#{user.userscore}");
					}
					if(user.getRole() != null && user.getRole()!=0){
						WHERE(" role=#{user.role} ");
				    }
					
					if(user.getHandlernumber()!= 0){
						WHERE(" handlernumber=#{user.handlernumber}");
					}
					if(user.getHostnumber()!= 0){
						WHERE("hostnumber=#{user.gethostnumber}");
					}
					
					if(user.getSignnumber()!=0){
						WHERE(" signnumber=#{user.signnumber} ");
				    }
					if (user.getTeam()!= null && user.getTeam().getTeam_id() != null
							&&user.getTeam().getTeam_id() != 0) {
						WHERE(" team_id = #{user.team.team_id} ");
					}
				}
			}
		}.toString();
	}

	
	// 动态插入
	public String insertUser(User user) {

		return new SQL() {
			{
				INSERT_INTO(" user ");
				if (user.getStudent_num() != null && !user.getStudent_num().equals("")) {
					VALUES("student_num", "#{student_num}");
				}
				if (user.getUsername() != null && !user.getUsername().equals("")) {
					VALUES("username", "#{username}");
				}
				if (user.getPassword() != null && !user.getPassword().equals("")) {
					VALUES("password", "#{password}");
				}
				if (user.getUseraddress() != null && !user.getUseraddress().equals("")) {
					VALUES("useraddress", "#{useraddress}");
				}
				if (user.getRole() != null && !user.getRole().equals("")) {
					VALUES("role", "#{role}");
				}
				if (user.getRegister_time() != null && !user.getRegister_time().equals("")) {
					VALUES("register_time", "#{register_time}");
				}
				if (user.getTelephone() != null && !user.getTelephone().equals("")) {
					VALUES("telephone", "#{telephone}");
				}
				
				
				if (user.getPicture()!= null && !user.getPicture().equals("")) {
					VALUES("picture", "#{picture}");
				}
				if (user.getEmail()!= null && !user.getEmail().equals("")) {
					VALUES("email", "#{email}");
				}
				if (user.getMessage()!= null && !user.getMessage().equals("")) {
					VALUES("message", "#{message}");
				}
				
				if (user.getMoney()!= 0 ) {
					VALUES("money", "#{money}");
				}
				if (user.getUserscore()!= 0 ) {
					VALUES("userscore", "#{userscore}");
				}
				if (user.getHandlernumber()!= 0 ) {
					VALUES("handlernumber", "#{handlernumber}");
				}
				if (user.getHostnumber()!= 0 ) {
					VALUES("hostnumber", "#{hostnumber}");
				}
				if (user.getSignnumber()!= 0 ) {
					VALUES("signnumber", "#{signnumber}");
				}
				if (user.getTeam()!= null && user.getTeam().getTeam_id() != null
						&&user.getTeam().getTeam_id() != 0) {
					VALUES(" team_id","#{team.team_id}");
				}
			}
		}.toString();
	}

	// 动态更新
	public String updateUser(User user) {

		return new SQL() {
			{
				UPDATE(" user ");
				if (user.getStudent_num() != null) {
					SET(" student_num = #{student_num} ");
				}
				if (user.getUsername() != null) {
					SET(" username = #{username} ");
				}
				if (user.getPassword() != null) {
					SET(" password = #{password} ");
				}
				if (user.getUseraddress() != null) {
					SET(" useraddress = #{useraddress} ");
				}
				if (user.getRole() != null) {
					SET(" role = #{role} ");
				}
				if (user.getRegister_time() != null) {
					SET(" register_time = #{register_time} ");
				}
				if (user.getTelephone() != null) {
					SET(" telephone = #{telephone} ");
				}
				if (user.getUserscore() !=0) {
					SET(" userscore = #{userscore} ");
				}
				
				if (user.getMoney() !=0) {
					SET(" money = #{money} ");
				}
				
				if (user.getHandlernumber()!= 0 ) {
					SET("handlernumber=#{handlernumber}");
				}
				if (user.getHostnumber()!= 0 ) {
					SET("hostnumber=#{hostnumber}");
				}
				if (user.getSignnumber()!= 0 ) {
					SET("signnumber=#{signnumber}");
				}
				
				if (user.getPicture()!= null && !user.getPicture().equals("")) {
					SET("picture=#{picture}");
				}
				if (user.getEmail()!= null && !user.getEmail().equals("")) {
					SET("email=#{email}");
				}
				if (user.getMessage()!= null && !user.getMessage().equals("")) {
					SET("message=#{message}");
				}
				if (user.getTeam()!= null && user.getTeam().getTeam_id() != null
						&&user.getTeam().getTeam_id() != 0) {
					SET("team_id=#{team.team_id}");
				}
				WHERE(" user_id = #{ user_id} ");
			}
		}.toString();
	}
}
