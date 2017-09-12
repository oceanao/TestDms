package com.market.dao.provider;
import java.util.Map;
import org.apache.ibatis.jdbc.SQL;
import com.market.pojo.result;
public class resultDynaSqlProvider {

	public String selectWhitParam(Map<String, Object> params) {
		String sql = new SQL() {
			{
				SELECT(" * ");
				FROM(" result ");
				if (params.get("result") != null) {
					result result = (result) params.get("result");
					if (result.getResult_name()!= null && !result.getResult_name().equals("")) {
						WHERE("  result_name LIKE CONCAT ('%',#{result.result_name},'%') ");
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
				FROM(" result ");
				if (params.get("result") != null) {
					result result = (result) params.get("result");
					if (result.getResult_name() != null && !result.getResult_name().equals("")) {
						WHERE("  result_name LIKE CONCAT ('%',#{result.result_name},'%') ");
					}
				}
			}
		}.toString();
	}

	
	// 动态插入
	public String insertresult(result result) {

		return new SQL() {
			{
				INSERT_INTO("result");
				if (result.getResult_name() != null && !result.getResult_name().equals("")) {
					VALUES("result_name", "#{result_name}");
				}
				if (result.getResult_description() != null && !result.getResult_description().equals("")) {
					VALUES("result_description", "#{result_description}");
				}
			}
		}.toString();
	}

	// 动态更新
	public String updateresult(result result) {

		return new SQL() {
			{
				UPDATE(" result ");
				if (result.getResult_name() != null) {
					SET(" result_name = #{result_name} ");
				}
				if (result.getResult_description() != null) {
					SET(" result_description = #{result_description} ");
				}
				WHERE(" result_id = #{result_id} ");
			}
		}.toString();
	}
}
