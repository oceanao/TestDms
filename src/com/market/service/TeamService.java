package com.market.service;
import java.util.List;
import com.market.pojo.Team;
import com.market.util.tag.PageModel;
/**
 * @Description:Team service接口
 * @author 作者 :敖海洋
 * @version 创建时间：2017年3月15日 下午4:33:15
 */
public interface TeamService {

	// 添加Team
	void addTeam(Team Team);

	// 删除Team
	void deleteTeam(Integer team_id);

	// 修改Team
	void modifyTeam(Team Team);

	// 根据team_id查询Team
	Team selectTeamById(Integer team_id);
	// 根据team_id查询Team
	List<Team> selectTeamuser(Integer manager_id);

	// 查询所有Team
	List<Team> selectAllTeams();
   
	
	
	
	// 根据team_name进行查询存在teamjet的记录数
	Integer checkTeam(String team_name);

	// 分页查询
	List<Team> findTeam(Team Team, PageModel pageModel);

}
