package cn.raoxianhua.common.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class registerServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		String uname = req.getParameter("uname");
//		String pwd = req.getParameter("pwd");
//
//		resp.setCharacterEncoding("UTF-8");
//		resp.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = resp.getWriter();
//		if(uname.equals(pwd)) {
//			out.println("登陆成功！");
//		}else {
//			out.println("登陆失败！");
//		}
//	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		String age = request.getParameter("age");
		
		String sql = "INSERT INTO T_USER (USERID, UNAME, PWD, AGE) VALUES (?, ?, ?, ?)";
		
		int user = DBUtils.modify(sql,userid, uname, pwd,age);
		
		String msg = "";
		if( user > 0 ) {
			msg = "注册成功!";
			// 1. 请求重定向
			response.sendRedirect("home");
			// 2. 请求转发
//			RequestDispatcher dispatcher = ç.getRequestDispatcher("index.html");
//			dispatcher.forward(request, response);
		} else {
			msg = "注册失败!";
			response.sendRedirect("register.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
		
	}
	
}
