package com.market.service;

import java.util.List;
import com.market.pojo.result;
import com.market.util.tag.PageModel;

/**
 * @Description:result service接口
 * @author 作者 :lixingyan
 * @version 创建时间：2017年3月15日 下午4:33:15
 */
public interface resultService {

	// 添加result
	void addresult(result result);

	// 删除result
	void deleteresult(Integer result_id);

	// 修改result
	void modifyresult(result result);

	// 根据result_id查询result
	result selectresultById(Integer result_id);

	// 查询所有result
	List<result> selectAllresults();

	// 根据result_name进行查询存在result的记录数
	Integer checkresult(String result_name);

	// 分页查询
	List<result> findresult(result result, PageModel pageModel);

}
