package com.market.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.market.dao.resultDao;
import com.market.pojo.result;
import com.market.service.resultService;
import com.market.util.tag.PageModel;

/**
 * @Description:
 * @author 作者 :lixingyan
 * @version 创建时间：2017年3月15日 下午4:41:14
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("resultService")
public class resultServiceImpl implements resultService {

	@Autowired
	private resultDao resultDao;

	// 添加result实现
	@Override
	public void addresult(result result) {

		this.resultDao.save(result);

	}

	// 删除result 实现
	@Override
	public void deleteresult(Integer pon_id) {

		this.resultDao.delectresultById(pon_id);
	}

	// 修改result实现
	@Override
	public void modifyresult(result result) {

		this.resultDao.updateresult(result);
	}

	// 根据pon_id查询result实现
	@Transactional(readOnly = true)
	@Override
	public result selectresultById(Integer pon_id) {
		return this.resultDao.selectresultById(pon_id);
	}

	// 查询所有result实现
	@Transactional(readOnly = true)
	@Override
	public List<result> selectAllresults() {
		return this.resultDao.selectAllresults();
	}

	// 根据pro_name进行查询存在projet的记录数的实现
	@Transactional(readOnly = true)
	@Override
	public Integer checkresult(String pro_name) {
		return this.resultDao.selectresultByName(pro_name);
	}

	// 分页查询实现
	@Transactional(readOnly = true)
	@Override
	public List<result> findresult(result result, PageModel pageModel) {
		/** 当前需要分页的总数据条数 */
		Map<String, Object> params = new HashMap<>();
		params.put("result", result);
		int recordCount = resultDao.count(params);
		pageModel.setRecordCount(recordCount);

		if (recordCount > 0) {
			/** 开始分页查询数据：查询第几页的数据 */
			params.put("pageModel", pageModel);
		}

		List<result> results = resultDao.selectByPage(params);
		return results;
	}
}
