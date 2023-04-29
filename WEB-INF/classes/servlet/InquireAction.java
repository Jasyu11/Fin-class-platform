package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.enterprise;
import net.sf.json.JSONArray;
import service.enterprise_service;

public class InquireAction extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String key=req.getParameter("key");
		System.out.print(key);
		enterprise_service service=new enterprise_service();
		List list=new ArrayList();
		try {
			list=service.inquire(key);
			for(int i=0;i<list.size();i++) {
				((enterprise) list.get(i)).code((enterprise)list.get(i));
				List<enterprise> center=service.GetClusterCenter();;
				((enterprise) list.get(i)).calculate_cluster(((enterprise) list.get(i)), center);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONArray array=JSONArray.fromObject(list);
		resp.setCharacterEncoding("utf-8");
		PrintWriter out=resp.getWriter();
		out.write(array.toString());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
