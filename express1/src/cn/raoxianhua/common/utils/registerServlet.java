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

	// @Override
	// protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	// throws ServletException, IOException {
	//
	// String uname = req.getParameter("uname");
	// String pwd = req.getParameter("pwd");
	//
	// resp.setCharacterEncoding("UTF-8");
	// resp.setContentType("text/html; charset=UTF-8");
	// PrintWriter out = resp.getWriter();
	// if(uname.equals(pwd)) {
	// out.println("登陆成功！");
	// }else {
	// out.println("登陆失败！");
	// }
	// }

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String sid = request.getParameter("sid");
		String spwd = request.getParameter("spwd");
		String name = request.getParameter("name");
		String snumber = request.getParameter("snumber");
		String lphone = request.getParameter("lphone");
		String remark = request.getParameter("remark");

		String sql = "INSERT INTO STAFF (STAFFID, STAFFNAME, STAFFNUMBER, "
				+ "LINKPHONE,STAFFPASSWORD,REMARK) VALUES (?, ?, ?, ?,?,?)";

		int register = 0;
		try {
			register = DBUtils.modify(sql, sid, name, snumber, lphone, spwd, remark);
		} catch (Exception e) {

		}

		HttpSession session = request.getSession();
		String msg = "";
		if (register > 0) {
			msg = "注册成功!";
			session.setAttribute("msg", msg);
			// 1. 请求重定向
			response.sendRedirect("home");
			// 2. 请求转发
			// RequestDispatcher dispatcher = ç.getRequestDispatcher("index.html");
			// dispatcher.forward(request, response);
		} else {
			msg = "注册失败!";
			session.setAttribute("msg", msg);
			response.sendRedirect("register.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);

	}

}
