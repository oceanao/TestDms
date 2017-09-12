package com.market.service;

import com.market.pojo.Adminuser;

public interface AdminUserService {

	/**
	 * 用户登录
	 * 
	 * @param ad_username
	 * @param ad_password
	 * @return Adminuser对象
	 */
	Integer login(String ad_username, String ad_password);

	/**
	 * 修改管理员登录信息
	 * 
	 * @param adminuser
	 */
	public void modifyAdminUserInfo(Adminuser adminuser);

	/**
	 * 根据用户名查询管理员
	 * 
	 * @param ad_username
	 * @param
	 * @return Adminuser对象
	 */
	Adminuser getAdminUserByName(String ad_username);

	/**
	 * 插入管理员
	 * 
	 * @param adminuser
	 */
	public void insertAdminuser(Adminuser adminuser);
}
