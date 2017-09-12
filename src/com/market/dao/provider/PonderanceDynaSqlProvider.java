package com.market.dao.provider;
import java.util.Map;
import org.apache.ibatis.jdbc.SQL;
import com.market.pojo.Ponderance;
public class PonderanceDynaSqlProvider {

	public String selectWhitParam(Map<String, Object> params) {
		String sql = new SQL() {
			{
				SELECT(" * ");
				FROM(" ponderance ");
				if (params.get("ponderance") != null) {
					Ponderance ponderance = (Ponderance) params.get("ponderance");
					if (ponderance.getPon_name()!= null && !ponderance.getPon_name().equals("")) {
						WHERE("  pon_name LIKE CONCAT ('%',#{ponderance.pon_name},'%') ");
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
				FROM(" ponderance ");
				if (params.get("ponderance") != null) {
					Ponderance ponderance = (Ponderance) params.get("ponderance");
					if (ponderance.getPon_name() != null && !ponderance.getPon_name().equals("")) {
						WHERE("  pon_name LIKE CONCAT ('%',#{ponderance.pon_name},'%') ");
					}
				}
			}
		}.toString();
	}

	
	// 动态插入
	public String insertponderance(Ponderance ponderance) {

		return new SQL() {
			{
				INSERT_INTO("ponderance");
				if (ponderance.getPon_name() != null && !ponderance.getPon_name().equals("")) {
					VALUES("pon_name", "#{pon_name}");
				}
				if (ponderance.getPon_description() != null && !ponderance.getPon_description().equals("")) {
					VALUES("pon_description", "#{pon_description}");
				}
			}
		}.toString();
	}

	// 动态更新
	public String updateponderance(Ponderance ponderance) {

		return new SQL() {
			{
				UPDATE(" ponderance ");
				if (ponderance.getPon_name() != null) {
					SET(" pon_name = #{pon_name} ");
				}
				if (ponderance.getPon_description() != null) {
					SET(" pon_description = #{pon_description} ");
				}
				WHERE(" pon_id = #{pon_id} ");
			}
		}.toString();
	}
}
