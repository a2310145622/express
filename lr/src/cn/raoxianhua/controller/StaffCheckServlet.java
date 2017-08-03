package cn.raoxianhua.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.raoxianhua.common.utils.DBUtils;

@WebServlet("/manager/staffcheck")
public class StaffCheckServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String sid = req.getParameter("sid");
		
		String sql = "SELECT * FROM STAFF s WHERE s.STAFFID=?";
		
		Map<String, Object> user = DBUtils.querySingle(sql, sid);
		
		//System.out.println(user.toString());
		
		resp.setCharacterEncoding("UTF-8");
		
		String msg = "";
		if( user.get("STAFFID")==null ) {
			msg = "<font color=green >用户名可用!</font>";
			PrintWriter out = resp.getWriter();
			out.println(msg);
			//System.out.println(msg);
		} else {
			msg = "<font color=red >用户名已被使用!</font>";
			PrintWriter out = resp.getWriter();
			out.println(msg);
			//System.out.println(msg);
		}
	}
	

}
