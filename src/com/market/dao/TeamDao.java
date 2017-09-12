package com.market.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.mapping.FetchType;

import com.market.dao.provider.TeamDynaSqlProvider;
import com.market.pojo.Team;


public interface TeamDao {

	// 动态查询
	@SelectProvider(type = TeamDynaSqlProvider.class, method = "selectWhitParam")
	@Results({
		    @Result(id = true, column = "team_id", property = "team_id"),
			@Result(column = "team_name", property = "team_name"),
			@Result(column = "team_description", property = "team_description"),
			@Result(column = "manager_id", property = "manager",
			one = @One(select = "com.market.dao.UserDao.selectBystudentId", 
					fetchType = FetchType.EAGER))})
	
	List<Team> selectByPage(Map<String, Object> params);

	@SelectProvider(type = TeamDynaSqlProvider.class, method = "count")
	Integer count(Map<String, Object> params);

	// 动态插入部门
	@InsertProvider(type = TeamDynaSqlProvider.class, method = "insertTeam")
	@Options(useGeneratedKeys=true,keyProperty="team_id")
	void save(Team Team);

	// 动态修改用户
	@UpdateProvider(type = TeamDynaSqlProvider.class, method = "updateTeam")
	void updateTeam(Team Team);

	// 根据team_name进行查询
	@Select("select count(*) from team where team_name= #{team_name}")
	Integer selectTeamByName(String team_name);

	// 根据team_id进行查询
	@Select("select * from team where team_id= #{team_id}")
	@Results({
	    @Result(id = true, column = "team_id", property = "team_id"),
		@Result(column = "team_name", property = "team_name"),
		@Result(column = "team_description", property = "team_description"),
		@Result(column = "manager_id", property = "manager",
		one = @One(select = "com.market.dao.UserDao.selectBystudentId", 
				fetchType = FetchType.EAGER))})
	Team selectTeamById(@Param("team_id")Integer team_id);

	

	// 根据manager_id进行查询
	@Select("select * from team where manager_id= #{manager_id}")
	@Results({
	    @Result(id = true, column = "team_id", property = "team_id"),
		@Result(column = "team_name", property = "team_name"),
		@Result(column = "team_description", property = "team_description"),
		@Result(column = "manager_id", property = "manager",
		one = @One(select = "com.market.dao.UserDao.selectBystudentId", 
				fetchType = FetchType.EAGER))})
	List<Team> selectTeamByuser(@Param("manager_id")Integer manager_id);
	
	
	// 查询所有Team
	@Select("select * from team")
	@Results({
	    @Result(id = true, column = "team_id", property = "team_id"),
		@Result(column = "team_name", property = "team_name"),
		@Result(column = "team_description", property = "team_description"),
		@Result(column = "manager_id", property = "manager",
		one = @One(select = "com.market.dao.UserDao.selectBystudentId", 
				fetchType = FetchType.EAGER))})
	List<Team> selectAllTeams();

	// 根据id删除Team
	@Delete("delete from team where team_id=#{team_id}")
	void delectTeamById(Integer team_id);
}
