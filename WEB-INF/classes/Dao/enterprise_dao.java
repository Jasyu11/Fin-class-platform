package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.enterprise;

public class enterprise_dao {
	private Connection connection=null;
	public void connect() throws SQLException { //连接数据库
		String connectDB = "jdbc:sqlserver://localhost:1433;DatabaseName=ServiceCompetition";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//数据库引擎
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String user="sa";
		String password="123";
		connection = DriverManager.getConnection(connectDB, user, password);// 连接数据库对象
        System.out.println("连接数据库成功");
	}
	public List<enterprise>  GetClusterCenter() throws SQLException{
		List list=new ArrayList();
		String sql="select * from ClusterCenter";
		PreparedStatement ps=connection.prepareStatement(sql);
		ResultSet rs =ps.executeQuery();
		while(rs.next()) {
			enterprise ent=new enterprise();
			ent.setSade1(rs.getFloat("attribute_1"));
			ent.setSade2(rs.getFloat("attribute_2"));
			ent.setSade3(rs.getFloat("attribute_3"));
			ent.setSade4(rs.getFloat("attribute_4"));
			ent.setSade5(rs.getFloat("attribute_5"));
			ent.setSade6(rs.getFloat("attribute_6"));
			ent.setSade7(rs.getFloat("attribute_7"));
			ent.setSade8(rs.getFloat("attribute_8"));
			ent.setType(rs.getInt("type"));
			ent.setDescription(rs.getString("description"));
			list.add(ent);
		}
		return list;
	}
	public List<enterprise> Get_break_promise_ent() throws SQLException{
		List list=new ArrayList();
		String sql="select * from ent where (case when whether_break_promise=? then 1 else 0 end + case when blacklist_or_not>0 then 1 else 0 end + case when abnormal_times >0 then 1 else 0 end + case when number_of_penalty>0 then 1 else 0 end + case when time_of_comprehensive_punishment>0 then 1 else 0 end)>=2	";
		PreparedStatement ps=connection.prepareStatement(sql);
		ps.setFloat(1, 1);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			enterprise ent=new enterprise();
			ent.setName(rs.getString("ent_name"));
			ent.setAccumulated_tax_arrears(rs.getFloat("accumulate_tax_arrears"));
			ent.setEnt_credit_rank(rs.getString("ent_credit_rank"));
			ent.setAbnormal_time(rs.getFloat("abnormal_times"));
			ent.setTime_of_comprehensive_punishment(rs.getFloat("time_of_comprehensive_punishment"));
			ent.setNumber_of_penalty(rs.getFloat("number_of_penalty"));
			ent.setWhether_break_promise(rs.getFloat("whether_break_promise"));
			ent.setBlacklist_or_not(rs.getFloat("blacklist_or_not"));
			list.add(ent);
		}
		return list;
	}
	public List<enterprise> Get_great_ent() throws SQLException{
		List list=new ArrayList();
		String sql="select * from ent where (case when(intellectual_property_rights>0) then 1 else 0 end +"
				+ "case when (whether_wellknown_trademark>0) then 1 else 0 end + case when (number_of_patent_applications>0) then 1 else 0 end + "
				+ "case when (whether_famous_trademark>0) then 1 else 0 end +case when (number_of_copyright_application>0) then 1 else 0 end+"
				+ "case when  (whether_keep_promise>0) then 1 else 0 end)>=2";
		PreparedStatement ps=connection.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			enterprise ent=new enterprise();
			ent.setName(rs.getString(("ent_name")));
			ent.setIntellectual_property_rights(rs.getFloat(("intellectual_property_rights")));
			ent.setWhether_wellknown_trademark(rs.getFloat("whether_wellknown_trademark"));
			ent.setNumber_of_patent_applications(rs.getFloat("number_of_patent_applications"));
			ent.setWhether_famous_trademark(rs.getFloat("whether_famous_trademark"));
			ent.setNumber_of_copyright_application(rs.getFloat("number_of_copyright_application"));
			ent.setWhether_keep_promise((rs.getFloat("whether_keep_promise")));
			list.add(ent);
		}
		return list;
	}
	public List<enterprise> Get_Category_Ent(float category) throws SQLException{
		List list=new ArrayList();
		String sql;
		ResultSet rs;
		if(category<16) {
		sql="select * from ent where bussiness_category=?";
		PreparedStatement ps=connection.prepareStatement(sql);
		ps.setFloat(1, category);
		rs=ps.executeQuery();
		while(rs.next()) {
			enterprise ent=new enterprise();
			ent.setName(rs.getString("ent_name"));
			ent.setRegistered_capital(rs.getFloat("registered_capital"));
			ent.setNumber_of_branches(rs.getFloat("number_of_branches"));
			ent.setOnlineshop_number(rs.getFloat("number_of_online_shop"));
			ent.setNumber_of_employees(rs.getFloat("number_of_employees"));
			list.add(ent);
		}
		}
		else {
			sql="select * from ent where bussiness_category>15";
			PreparedStatement ps=connection.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				enterprise ent=new enterprise();
				ent.setName(rs.getString("ent_name"));
				ent.setRegistered_capital(rs.getFloat("registered_capital"));
				ent.setNumber_of_branches(rs.getFloat("number_of_branches"));
				ent.setOnlineshop_number(rs.getFloat("number_of_online_shop"));
				ent.setNumber_of_employees(rs.getFloat("number_of_employees"));
				list.add(ent);
			}
		}
		return list;
	}
	public List<enterprise> inquire(String key) throws SQLException{
		List list=new ArrayList();
		String sql="select * from ent  where (ent_name LIKE ?)";
		PreparedStatement ps=connection.prepareStatement(sql);
		ps.setString(1, "%"+key+"%");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			enterprise ent=new enterprise();
			ent.setName(rs.getString("ent_name"));
			ent.setRegistered_capital(rs.getFloat("registered_capital"));
			ent.setShareholding_ratio(rs.getFloat("shareholding_ratio"));
			ent.setEnt_contribution(rs.getFloat("ent_contribution"));
			ent.setEnt_contribution_year_paid(rs.getFloat("ent_contribution_year_paid"));
			ent.setEnt_contribution_year_subscription(rs.getFloat("ent_contribution_year_subscription"));
			ent.setOnlineshop_number(rs.getFloat("number_of_online_shop"));
			ent.setNumber_of_branches(rs.getFloat("number_of_branches"));
			ent.setNumber_of_employees(rs.getFloat("number_of_employees"));
			list.add(ent);
	}
		return list;
	}
}
