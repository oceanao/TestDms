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
import com.market.dao.provider.resultDynaSqlProvider;
import com.market.pojo.result;


public interface resultDao {

	// 动态查询
	@SelectProvider(type = resultDynaSqlProvider.class, method = "selectWhitParam")
	@Results({
		    @Result(id = true, column = "result_id", property = "result_id"),
			@Result(column = "result_name", property = "result_name"),
			@Result(column = "result_description", property = "result_description")})
	List<result> selectByPage(Map<String, Object> params);

	@SelectProvider(type = resultDynaSqlProvider.class, method = "count")
	Integer count(Map<String, Object> params);

	// 动态插入部门
	@InsertProvider(type = resultDynaSqlProvider.class, method = "insertresult")
	@Options(useGeneratedKeys=true,keyProperty="result_id")
	void save(result result);

	// 动态修改用户
	@UpdateProvider(type = resultDynaSqlProvider.class, method = "updateresult")
	void updateresult(result result);

	// 根据result_name进行查询
	@Select("select count(*) from result where result_name= #{result_name}")
	Integer selectresultByName(String result_name);

	// 根据result_id进行查询
	@Select("select * from result where result_id= #{result_id}")
	@Results({
	    @Result(id = true, column = "result_id", property = "result_id"),
		@Result(column = "result_name", property = "result_name"),
		@Result(column = "result_description", property = "result_description")})
	result selectresultById(@Param("result_id")Integer result_id);

	// 查询所有result
	@Select("select * from result")
	@Results({
	    @Result(id = true, column = "result_id", property = "result_id"),
		@Result(column = "result_name", property = "result_name"),
		@Result(column = "result_description", property = "result_description")})
	List<result> selectAllresults();

	// 根据id删除result
	@Delete("delete from result where result_id=#{result_id}")
	void delectresultById(Integer result_id);
}
