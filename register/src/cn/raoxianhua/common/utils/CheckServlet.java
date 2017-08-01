package cn.raoxianhua.common.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/check")
public class CheckServlet extends HttpServlet{

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
		
		String uname = req.getParameter("uname");
		
		String sql = "SELECT * FROM T_USER t WHERE t.uname=?";
		
		Map<String, Object> user = DBUtils.querySingle(sql, uname);
		
		//System.out.println(user.toString());
		
		resp.setCharacterEncoding("UTF-8");
		
		String msg = "";
		if( user.get("UNAME")==null ) {
			msg = "用户名可用!";
			PrintWriter out = resp.getWriter();
			out.println(msg);
			//System.out.println(msg);
		} else {
			msg = "用户名已被使用!";
			PrintWriter out = resp.getWriter();
			out.println(msg);
			//System.out.println(msg);
		}
	}
	

}
