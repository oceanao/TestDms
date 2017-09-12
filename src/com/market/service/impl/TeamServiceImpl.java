package com.market.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.market.dao.TeamDao;
import com.market.pojo.Team;
import com.market.service.TeamService;
import com.market.util.tag.PageModel;

/**
 * @Description:
 * @author 作者 :敖海洋
 * @version 创建时间：2017年3月15日 下午4:41:14
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("teamService")
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamDao teamDao;

	// 添加team实现
	@Override
	public void addTeam(Team team) {

		this.teamDao.save(team);

	}

	// 删除team 实现
	@Override
	public void deleteTeam(Integer team_id) {

		this.teamDao.delectTeamById(team_id);
	}

	// 修改team实现
	@Override
	public void modifyTeam(Team team) {

		this.teamDao.updateTeam(team);
	}

	// 根据pro_id查询team实现
	@Transactional(readOnly = true)
	@Override
	public Team selectTeamById(Integer team_id) {
		return this.teamDao.selectTeamById(team_id);
	}

	// 查询所有team实现
	@Transactional(readOnly = true)
	@Override
	public List<Team> selectAllTeams() {
		return this.teamDao.selectAllTeams();
	}

	
	@Transactional(readOnly = true)
	@Override
	public Integer checkTeam(String team_name) {
		return this.teamDao.selectTeamByName(team_name);
	}

/*	// 分页查询实现
	@Transactional(readOnly = true)
	@Override
	public List<Team> findTeam(Team team, PageModel pageModel) {
		*//** 当前需要分页的总数据条数 *//*
		Map<String, Object> params = new HashMap<>();
		params.put("team", team);
		int recordCount = teamDao.count(params);
		pageModel.setRecordCount(recordCount);

		if (recordCount > 0) {
			*//** 开始分页查询数据：查询第几页的数据 *//*
			params.put("pageModel", pageModel);
		}

		List<Team> teams = teamDao.selectByPage(params);
		return teams;
	}
*/
	@Override
	public List<Team> selectTeamuser(Integer user_id) {
		// TODO Auto-generated method stub
		/*List<team> teams=teamDao.selectteamByuser(user_id);*/
		return this.teamDao.selectTeamByuser(user_id);
	}

			@Override
			public List<Team> findTeam(Team Team, PageModel pageModel) {
				// TODO Auto-generated method stub
				return null;
			}

}
