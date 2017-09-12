package com.market.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.market.dao.PonderanceDao;
import com.market.pojo.Ponderance;
import com.market.service.PonderanceService;
import com.market.util.tag.PageModel;

/**
 * @Description:
 * @author 作者 :lixingyan
 * @version 创建时间：2017年3月15日 下午4:41:14
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("ponderanceService")
public class PonderanceServiceImpl implements PonderanceService {

	@Autowired
	private PonderanceDao ponderanceDao;

	// 添加ponderance实现
	@Override
	public void addponderance(Ponderance Ponderance) {

		this.ponderanceDao.save(Ponderance);

	}

	// 删除ponderance 实现
	@Override
	public void deleteponderance(Integer pon_id) {

		this.ponderanceDao.delectPonderanceById(pon_id);
	}

	// 修改ponderance实现
	@Override
	public void modifyponderance(Ponderance ponderance) {

		this.ponderanceDao.updatePonderance(ponderance);
	}

	// 根据pon_id查询ponderance实现
	@Transactional(readOnly = true)
	@Override
	public Ponderance selectponderanceById(Integer pon_id) {
		return this.ponderanceDao.selectPonderanceById(pon_id);
	}

	// 查询所有ponderance实现
	@Transactional(readOnly = true)
	@Override
	public List<Ponderance> selectAllponderances() {
		return this.ponderanceDao.selectAllPonderances();
	}

	// 根据pro_name进行查询存在projet的记录数的实现
	@Transactional(readOnly = true)
	@Override
	public Integer checkponderance(String pro_name) {
		return this.ponderanceDao.selectPonderanceByName(pro_name);
	}

	// 分页查询实现
	@Transactional(readOnly = true)
	@Override
	public List<Ponderance> findPonderance(Ponderance ponderance, PageModel pageModel) {
		/** 当前需要分页的总数据条数 */
		Map<String, Object> params = new HashMap<>();
		params.put("ponderance", ponderance);
		int recordCount = ponderanceDao.count(params);
		pageModel.setRecordCount(recordCount);

		if (recordCount > 0) {
			/** 开始分页查询数据：查询第几页的数据 */
			params.put("pageModel", pageModel);
		}

		List<Ponderance> ponderances = ponderanceDao.selectByPage(params);
		return ponderances;
	}
}
