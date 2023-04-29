package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.enterprise;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import service.enterprise_service;

public class InquireBatchAction extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String data=req.getParameter("array");
		data=URLDecoder.decode(data, "UTF-8");
		System.out.println(data);
		enterprise_service service=new enterprise_service();
		List array=new ArrayList();
		JSONArray myArray=JSONArray.fromObject(data);
		for(int i=0;i<myArray.size();i++){
			enterprise ent=new enterprise();
		   JSONObject object=myArray.getJSONObject(i);
		   ent.setName(object.getString("name"));
		   ent.setRegistered_capital((Float.parseFloat(object.getString("registered_capital"))));
		   ent.setEnt_contribution((Float.parseFloat(object.getString("ent_contribution"))));
		   ent.setShareholding_ratio((Float.parseFloat(object.getString("shareholding_ratio"))));
		   ent.setEnt_contribution_year_paid((Float.parseFloat(object.getString("ent_year_paid"))));
		   ent.setEnt_contribution_year_subscription((Float.parseFloat(object.getString("ent_year_subscription"))));
		   ent.code(ent);
		   try {
			ent.calculate_cluster(ent, service.GetClusterCenter());
			 System.out.print(ent.toString());
			  array.add(ent);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   }
		JSONArray ent_json=JSONArray.fromObject(array);
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.write(ent_json.toString());
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doDelete(req, resp);
	}

}
