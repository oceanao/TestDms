package com.market.dao.provider;

import java.util.Map;
import org.apache.ibatis.jdbc.SQL;

import com.market.pojo.Project;


public class ProjectDynaSqlProvider {

	public String selectWhitParam(Map<String, Object> params) {
		String sql = new SQL() {
			{
				SELECT(" * ");
				FROM(" project ");
				if (params.get("project") != null) {
					Project project = (Project) params.get("project");
					if (project.getPro_name() != null && !project.getPro_name().equals("")) {
						WHERE("  pro_name LIKE CONCAT ('%',#{project.pro_name},'%') ");
					}
				}
			}
		}.toString();

		if (params.get("pageModel") != null) {
			sql += " limit #{pageModel.firstLimitParam} , #{pageModel.pageSize}  ";
		}

		return sql;
	}

	// 动态查询总数量
	public String count(Map<String, Object> params) {
		return new SQL() {
			{
				SELECT(" count(*) ");
				FROM(" project ");
				if (params.get("project") != null) {
					Project project = (Project) params.get("project");
					if (project.getPro_name() != null && !project.getPro_name().equals("")) {
						WHERE("  pro_name LIKE CONCAT ('%',#{project.pro_name},'%') ");
					}
				}
			}
		}.toString();
	}

	
	// 动态插入
	public String insertProject(Project project) {

		return new SQL() {
			{
				INSERT_INTO(" project ");
				if (project.getPro_name() != null && !project.getPro_name().equals("")) {
					VALUES("pro_name", "#{pro_name}");
				}
				if (project.getPro_description() != null && !project.getPro_description().equals("")) {
					VALUES("pro_description", "#{pro_description}");
				}
				if (project.getPro_version() != null && !project.getPro_version().equals("")) {
					VALUES("pro_version", "#{pro_version}");
				}
				if (project.getPro_file() != null && !project.getPro_file().equals("")) {
					VALUES("pro_file", "#{pro_file}");
				}
				if (project.getManager_id() !=0) {
					VALUES("manager_id", "#{manager.user_id}");
				}
			}
		}.toString();
	}

	// 动态更新
	public String updateProject(Project project) {

		return new SQL() {
			{
				UPDATE(" project ");
				if (project.getPro_name() != null) {
					SET(" pro_name = #{pro_name} ");
				}
				if (project.getPro_description() != null) {
					SET(" pro_description = #{pro_description} ");
				}
				if (project.getPro_version() != null) {
					SET(" pro_version = #{pro_version} ");
				}
				if (project.getPro_file() != null) {
					SET(" pro_file = #{pro_file} ");
				}
				if (project.getManager_id() !=0) {
					SET("manager_id=#{manager.user_id}");
				}
				WHERE(" pro_id = #{pro_id} ");
			}
		}.toString();
	}
}
