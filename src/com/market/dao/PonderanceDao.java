package com.market.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;
import com.market.dao.provider.PonderanceDynaSqlProvider;
import com.market.pojo.Ponderance;


public interface PonderanceDao {

	// 动态查询
	@SelectProvider(type = PonderanceDynaSqlProvider.class, method = "selectWhitParam")
	@Results({
		    @Result(id = true, column = "pon_id", property = "pon_id"),
			@Result(column = "pon_name", property = "pon_name"),
			@Result(column = "pon_description", property = "pon_description")})
	List<Ponderance> selectByPage(Map<String, Object> params);

	@SelectProvider(type = PonderanceDynaSqlProvider.class, method = "count")
	Integer count(Map<String, Object> params);

	// 动态插入部门
	@InsertProvider(type = PonderanceDynaSqlProvider.class, method = "insertponderance")
	@Options(useGeneratedKeys=true,keyProperty="pon_id")
	void save(Ponderance Ponderance);

	// 动态修改用户
	@UpdateProvider(type = PonderanceDynaSqlProvider.class, method = "updateponderance")
	void updatePonderance(Ponderance Ponderance);

	// 根据pon_name进行查询
	@Select("select count(*) from ponderance where pon_name= #{pon_name}")
	Integer selectPonderanceByName(String pon_name);

	// 根据pon_id进行查询
	@Select("select * from ponderance where pon_id= #{pon_id}")
	@Results({
	    @Result(id = true, column = "pon_id", property = "pon_id"),
		@Result(column = "pon_name", property = "pon_name"),
		@Result(column = "pon_description", property = "pon_description")})
	Ponderance selectPonderanceById(@Param("pon_id")Integer pon_id);

	// 查询所有Ponderance
	@Select("select * from ponderance")
	@Results({
	    @Result(id = true, column = "pon_id", property = "pon_id"),
		@Result(column = "pon_name", property = "pon_name"),
		@Result(column = "pon_description", property = "pon_description")})
	List<Ponderance> selectAllPonderances();

	// 根据id删除Ponderance
	@Delete("delete from ponderance where pon_id=#{pon_id}")
	void delectPonderanceById(Integer pon_id);
}
