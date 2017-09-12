package com.market.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.mapping.FetchType;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;

import com.market.dao.provider.UserDynaSqlProvider;
import com.market.pojo.User;

public interface UserDao {


	// 根据登录名和密码查询员工
	@Select("select count(*) from user where student_num = #{student_num} and password = #{password}")
	Integer selectuserByLoginnameAndPassword(
			@Param("student_num") String student_num,
            @Param("password") String password);
	

	// 根据学号查询用户个数
	@Select("select count(*) from user where student_num = #{student_num}")

	Integer countBystudent_Num(
			@Param("student_num") String student_num);
	
	
	// 根据学号查询用户
	@Select("select * from user where student_num = #{student_num}")
	@Results({
		@Result(id=true,column="user_id",property="user_id"),
		@Result(column="student_num",property="student_num"),
		@Result(column="username",property="username"),
		@Result(column="password",property="password"),
		@Result(column="role",property="role"),
		@Result(column="useraddress",property="useraddress"),
		@Result(column="team_id",property="team",one = @One(select = "com.market.dao.TeamDao.selectTeamById",fetchType = FetchType.EAGER)),
		@Result(column="register_time",property="register_time",javaType=java.util.Date.class)
	})
	User getUserBystudent_Num(
			@Param("student_num") String student_num);
	
	// 根据ID查询用户
	@Select("select * from user where user_id = #{user_id}")
	@Results({
		@Result(id=true,column="user_id",property="user_id"),
		@Result(column="student_num",property="student_num"),
		@Result(column="username",property="username"),
		@Result(column="password",property="password"),
		@Result(column="role",property="role"),
		@Result(column="useraddress",property="useraddress"),
		@Result(column="team_id",property="team",one = @One(select = "com.market.dao.TeamDao.selectTeamById",fetchType = FetchType.EAGER)),
		@Result(column="register_time",property="register_time",javaType=java.util.Date.class)
	})
	User selectBystudentId(
			@Param("user_id") Integer user_id);
	
	
	
	// 根据id删除用户
	@Delete(" delete from user where user_id = #{user_id} ")
	void deleteUserById(
			@Param("user_id") Integer user_id);
	
	
	//查询所有用户
	@Select("select * from  user")
	@Results({
		@Result(id=true,column="user_id",property="user_id"),
		@Result(column="student_num",property="student_num"),
		@Result(column="username",property="username"),
		@Result(column="password",property="password"),
		@Result(column="role",property="role"),
		@Result(column="useraddress",property="useraddress"),
		@Result(column="team_id",property="team",one = @One(select = "com.market.dao.TeamDao.selectTeamById",fetchType = FetchType.EAGER)),
		@Result(column="register_time",property="register_time",javaType=java.util.Date.class)
	})
    List<User> selectAllUsers();

	
	//查询所有用户
	@Select("select * from  user where team_id=#{team_id}")
	@Results({
		@Result(id=true,column="user_id",property="user_id"),
		@Result(column="student_num",property="student_num"),
		@Result(column="username",property="username"),
		@Result(column="password",property="password"),
		@Result(column="role",property="role"),
		@Result(column="useraddress",property="useraddress"),
		@Result(column="team_id",property="team",one = @One(select = "com.market.dao.TeamDao.selectTeamById",fetchType = FetchType.EAGER)),
		@Result(column="register_time",property="register_time",javaType=java.util.Date.class)
	})
    List<User> selectUsersByteam(Integer team_id);
	
	
	
	

	// 动态修改用户
	@UpdateProvider(type = UserDynaSqlProvider.class, method = "updateUser")
	void updateUser(User user);

	// 动态查询
	@SelectProvider(type = UserDynaSqlProvider.class, method = "selectWhitParam")
	@Results({
		@Result(id=true,column="user_id",property="user_id"),
		@Result(column="student_num",property="student_num"),
		@Result(column="username",property="username"),
		@Result(column="password",property="password"),
		@Result(column="role",property="role"),
		@Result(column="useraddress",property="useraddress"),
		@Result(column="team_id",property="team",one = @One(select = "com.market.dao.TeamDao.selectTeamById",fetchType = FetchType.EAGER)),
		@Result(column="register_time",property="register_time",javaType=java.util.Date.class)
	})
	List<User> selectUserByPage(Map<String, Object> params);

	// 根据参数查询用户总数
	@SelectProvider(type = UserDynaSqlProvider.class, method = "count")
	Integer count(Map<String, Object> params);

	// 动态插入用户
	@InsertProvider(type = UserDynaSqlProvider.class, method = "insertUser")
	@Options(useGeneratedKeys=true,keyProperty="user_id")
	void insertUser(User user);
}
