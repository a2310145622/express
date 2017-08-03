package cn.raoxianhua.controller;

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

import cn.raoxianhua.common.utils.DBUtils;

@WebServlet("/login")
public class ClientLoginServlet extends HttpServlet {
	
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
		
		String cid = request.getParameter("cid");
		String cpwd = request.getParameter("cpwd");
		String rme = request.getParameter("rme");
		
		//若用户选择自动登录，则生成cookies保存必要信息
        if("rme".equals(rme)){
        	
           //cookies需要设置编码格式
        	    Cookie cookie = new Cookie("cid", URLEncoder.encode(cid, "utf-8"));
            Cookie cookie2 = new Cookie("cpwd",cpwd);
            //设置保存时间
            cookie.setMaxAge(7*24*60*60);
            cookie2.setMaxAge(7*24*60*60);
            //设置保存路径
//            cookie.setPath(request.getContextPath()+"/");
            //添加到响应头
            response.addCookie(cookie);
            response.addCookie(cookie2);
        }
		String sql = "SELECT * FROM CLIENT WHERE CLIENTID=? AND CLIENTPASSWORD=?";
		
		Map<String, Object> user = null;
		try {
			user = DBUtils.querySingle(sql, cid, cpwd);
		}catch (Exception e) {
			
		}
		
		String msg = "";
		HttpSession session = request.getSession();
		if( user.size() > 0 ) {
			msg = "登陆成功!";
			session.setAttribute("cid_in_session", cid);
			session.setAttribute("msg", msg);
			// 1. 请求重定向
			response.sendRedirect("home");
			// 2. 请求转发
//			RequestDispatcher dispatcher = ç.getRequestDispatcher("index.html");
//			dispatcher.forward(request, response);
		} else {
			msg = "登陆失败!";
			session.setAttribute("msg", msg);
			response.sendRedirect("main.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String cid = (String)session.getAttribute("cid_in_session");
		String cpwd = (String)session.getAttribute("cpwd_in_session");
		
		String sql = "SELECT * FROM CLIENT WHERE CLIENTID=? AND CLIENTPASSWORD=?";
		
		Map<String, Object> user = DBUtils.querySingle(sql, cid, cpwd);
		
		String msg = "";
		session.setAttribute("msg", msg);
		if( user.size() > 0 ) {
			msg = "登陆成功!";
			// 1. 请求重定向
			//session.setAttribute("msg", msg);
			resp.sendRedirect("home");
			// 2. 请求转发
//			RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
//			dispatcher.forward(request, response);
		} else {
			msg = "密码已修改，请重新登陆!";
			session.setAttribute("msg", msg);
			resp.sendRedirect("main.jsp");
		}
		
	}
	
}
