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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
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
		
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		String rme = request.getParameter("rme");
		
		//若用户选择自动登录，则生成cookies保存必要信息
        if("rme".equals(rme)){
        	
           //cookies需要设置编码格式
        	    Cookie cookie = new Cookie("uname", URLEncoder.encode(uname, "utf-8"));
            Cookie cookie2 = new Cookie("pwd",pwd);
            //设置保存时间
            cookie.setMaxAge(7*24*60*60);
            cookie2.setMaxAge(7*24*60*60);
            //设置保存路径
//            cookie.setPath(request.getContextPath()+"/");
            //添加到响应头
            response.addCookie(cookie);
            response.addCookie(cookie2);
        }
		String sql = "SELECT * FROM T_USER t WHERE t.uname=? AND t.pwd=?";
		
		Map<String, Object> user = DBUtils.querySingle(sql, uname, pwd);
		
		String msg = "";
		if( user.size() > 0 ) {
			msg = "登陆成功!";
			HttpSession session = request.getSession();
			session.setAttribute("uname_in_session", uname);
			// 1. 请求重定向
			response.sendRedirect("../project/home");
			// 2. 请求转发
//			RequestDispatcher dispatcher = ç.getRequestDispatcher("index.html");
//			dispatcher.forward(request, response);
		} else {
			msg = "登陆失败!";
			response.sendRedirect("../project/login.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String uname = (String)session.getAttribute("uname_in_session");
		String pwd = (String)session.getAttribute("pwd_in_session");
		
		String sql = "SELECT * FROM T_USER t WHERE t.uname=? AND t.pwd=?";
		
		Map<String, Object> user = DBUtils.querySingle(sql, uname, pwd);
		
		String msg = "";
		if( user.size() > 0 ) {
			msg = "登陆成功!";
			// 1. 请求重定向
			resp.sendRedirect("../project/home");
			// 2. 请求转发
//			RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
//			dispatcher.forward(request, response);
		} else {
			msg = "登陆失败!";
			resp.sendRedirect("../project/login.jsp");
		}
		
	}
	
}
