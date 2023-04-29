package servlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.enterprise;
import jdk.nashorn.internal.ir.RuntimeNode.Request;
import service.enterprise_service;

public class InquireSingleAction extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		String name=req.getParameter("name");
		float registered_capital=Float.parseFloat(req.getParameter("registered_capital"));
		float shareholding_ratio=Float.parseFloat(req.getParameter("shareholding_ratio"));
		float ent_year_subscription=Float.parseFloat(req.getParameter("ent_year_subscription"));
		float ent_year_paid=Float.parseFloat(req.getParameter("ent_year_paid"));
		float ent_contribution=Float.parseFloat(req.getParameter("ent_contribution"));
		enterprise ent=new enterprise();
		ent.setName(name);
		ent.setRegistered_capital(registered_capital);
		ent.setEnt_contribution(ent_contribution);
		ent.setShareholding_ratio(shareholding_ratio);
		ent.setEnt_contribution_year_paid(ent_year_paid);
		ent.setEnt_contribution_year_subscription(ent_year_subscription);
		ent.code(ent);
		enterprise_service service=new enterprise_service();
		try {
			List<enterprise> list=service.GetClusterCenter();
			ent.calculate_cluster(ent, list);
			System.out.print(ent.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		req.setAttribute("enterprise", ent);
		req.getRequestDispatcher("/display_single.jsp").forward(req, resp);
	}

}
