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

import com.market.dao.provider.ProjectDynaSqlProvider;
import com.market.pojo.Project;


public interface ProjectDao {

	// 动态查询
	@SelectProvider(type = ProjectDynaSqlProvider.class, method = "selectWhitParam")
	@Results({
		    @Result(id = true, column = "pro_id", property = "pro_id"),
			@Result(column = "pro_name", property = "pro_name"),
			@Result(column = "pro_description", property = "pro_description"),
			@Result(column = "manager_id", property = "manager",
			one = @One(select = "com.market.dao.UserDao.selectBystudentId", 
					fetchType = FetchType.EAGER)),
			@Result(column = "pro_version", property = "pro_version")})
	
	List<Project> selectByPage(Map<String, Object> params);

	@SelectProvider(type = ProjectDynaSqlProvider.class, method = "count")
	Integer count(Map<String, Object> params);

	// 动态插入部门
	@InsertProvider(type = ProjectDynaSqlProvider.class, method = "insertProject")
	@Options(useGeneratedKeys=true,keyProperty="pro_id")
	void save(Project project);

	// 动态修改用户
	@UpdateProvider(type = ProjectDynaSqlProvider.class, method = "updateProject")
	void updateProject(Project project);

	// 根据pro_name进行查询
	@Select("select count(*) from project where pro_name= #{pro_name}")
	Integer selectProjectByName(String pro_name);

	// 根据pro_id进行查询
	@Select("select * from project where pro_id= #{pro_id}")
	@Results({
	    @Result(id = true, column = "pro_id", property = "pro_id"),
		@Result(column = "pro_name", property = "pro_name"),
		@Result(column = "pro_description", property = "pro_description"),
		@Result(column = "manager_id", property = "manager",
		one = @One(select = "com.market.dao.UserDao.selectBystudentId", 
				fetchType = FetchType.EAGER)),
		@Result(column = "pro_version", property = "pro_version")})
	Project selectProjectById(@Param("pro_id")Integer pro_id);

	

	// 根据pro_id进行查询
	@Select("select * from project where manager_id= #{manager_id}")
	@Results({
	    @Result(id = true, column = "pro_id", property = "pro_id"),
		@Result(column = "pro_name", property = "pro_name"),
		@Result(column = "pro_description", property = "pro_description"),
		@Result(column = "manager_id", property = "manager",
		one = @One(select = "com.market.dao.UserDao.selectBystudentId", 
				fetchType = FetchType.EAGER)),
		@Result(column = "pro_version", property = "pro_version")})
	List<Project> selectProjectByuser(@Param("manager_id")Integer manager_id);
	
	
	// 查询所有project
	@Select("select * from project")
	@Results({
	    @Result(id = true, column = "pro_id", property = "pro_id"),
		@Result(column = "pro_name", property = "pro_name"),
		@Result(column = "pro_description", property = "pro_description"),
		@Result(column = "manager_id", property = "manager",
		one = @One(select = "com.market.dao.UserDao.selectBystudentId", 
				fetchType = FetchType.EAGER)),
		@Result(column = "pro_version", property = "pro_version")})
	List<Project> selectAllProjects();

	// 根据id删除project
	@Delete("delete from project where pro_id=#{pro_id}")
	void delectProjectById(Integer pro_id);
}
