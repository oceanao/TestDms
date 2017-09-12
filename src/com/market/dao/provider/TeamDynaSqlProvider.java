package com.market.dao.provider;
import java.util.Map;
import org.apache.ibatis.jdbc.SQL;
import com.market.pojo.Team;
public class TeamDynaSqlProvider {

	public String selectWhitParam(Map<String, Object> params) {
		String sql = new SQL() {
			{
				SELECT(" * ");
				FROM(" team ");
				if (params.get("team") != null) {
					Team team = (Team) params.get("team");
					if (team.getTeam_name() != null && !team.getTeam_name().equals("")) {
						WHERE(" team_name LIKE CONCAT ('%',#{team.team_name},'%') ");
					}
				}
			}
		}.toString();


		return sql;
	}

	// 动态查询总数量
	public String count(Map<String, Object> params) {
		return new SQL() {
			{
				SELECT(" count(*) ");
				FROM(" team ");
				if (params.get("team") != null) {
					Team team = (Team) params.get("team");
					if (team.getTeam_name() != null && !team.getTeam_name().equals("")) {
						WHERE("  team_name LIKE CONCAT ('%',#{team.team_name},'%') ");
					}
				}
			}
		}.toString();
	}

	
	// 动态插入
	public String insertTeam(Team team) {

		return new SQL() {
			{
				INSERT_INTO(" team ");
				if (team.getTeam_name() != null && !team.getTeam_name().equals("")) {
					VALUES("team_name", "#{team_name}");
				}
				if (team.getTeam_description() != null && !team.getTeam_description().equals("")) {
					VALUES("team_description", "#{team_description}");
				}
			
				if (team.getManager_id() !=0) {
					VALUES("manager_id", "#{manager.user_id}");
				}
			}
		}.toString();
	}

	// 动态更新
	public String updateTeam(Team team) {

		return new SQL() {
			{
				UPDATE(" team ");
				if (team.getTeam_name() != null) {
					SET(" team_name = #{team_name} ");
				}
				if (team.getTeam_description() != null) {
					SET(" team_description = #{team_description} ");
				}
			
				if (team.getManager_id() !=0) {
					SET("manager_id=#{manager.user_id}");
				}
				WHERE(" team_id = #{team_id} ");
			}
		}.toString();
	}
}
