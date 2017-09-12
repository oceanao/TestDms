package com.market.service;

import java.util.List;
import com.market.pojo.Ponderance;
import com.market.util.tag.PageModel;

/**
 * @Description:ponderance service接口
 * @author 作者 :lixingyan
 * @version 创建时间：2017年3月15日 下午4:33:15
 */
public interface PonderanceService {

	// 添加ponderance
	void addponderance(Ponderance ponderance);

	// 删除ponderance
	void deleteponderance(Integer pro_id);

	// 修改ponderance
	void modifyponderance(Ponderance ponderance);

	// 根据pro_id查询ponderance
	Ponderance selectponderanceById(Integer pro_id);

	// 查询所有ponderance
	List<Ponderance> selectAllponderances();

	// 根据pro_name进行查询存在projet的记录数
	Integer checkponderance(String pro_name);

	// 分页查询
	List<Ponderance> findPonderance(Ponderance ponderance, PageModel pageModel);

}
