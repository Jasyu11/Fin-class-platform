package service;

import java.sql.SQLException;
import java.util.List;

import Dao.enterprise_dao;
import entity.enterprise;

public class enterprise_service {
	enterprise_dao dao=new enterprise_dao();
	public List<enterprise> GetClusterCenter() throws SQLException{
		dao.connect();
		return dao.GetClusterCenter();
	}
	public List<enterprise> Get_break_promise_ent() throws SQLException{
		dao.connect();
		return dao.Get_break_promise_ent();
	}
	public List<enterprise> Get_great_ent() throws SQLException{
		dao.connect();
		return dao.Get_great_ent();
	}
	public List<enterprise> Get_Category_ent(float category) throws SQLException{
		dao.connect();
		return dao.Get_Category_Ent(category);
	}
	public List<enterprise> inquire(String key) throws SQLException{
		dao.connect();
		return dao.inquire(key);
	}
}
