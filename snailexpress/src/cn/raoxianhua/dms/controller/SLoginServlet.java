/**
 * 
 */
package cn.raoxianhua.dms.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.raoxianhua.dms.service.IClientService;
import cn.raoxianhua.dms.service.IStaffService;
import cn.raoxianhua.dms.service.impl.ClientServiceImpl;
import cn.raoxianhua.dms.service.impl.StaffServiceImpl;
import cn.raoxianhua.dms.vo.Client;
import cn.raoxianhua.dms.vo.Staff;

/**
 * @author raoxianhua
 *
 */
@WebServlet("/manager/doLogin")
public class SLoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IStaffService StaffService = new StaffServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		Cookie[] cookies = req.getCookies();
		for (Cookie c : cookies) {
			if ("sid".equals(c.getName())) {
				// 如果是中文，cookies需要解码
				Staff staff = StaffService.doLoginByCookie(URLDecoder.decode(c.getValue(), "utf-8"));
				req.getSession().setAttribute("sid_in_session", staff.getSid());
				resp.sendRedirect("index.jsp");
				break;
			}else
				req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String sid = req.getParameter("sid");
		String spwd = req.getParameter("spwd");
		String rme = req.getParameter("rme");

		Staff staff = StaffService.doLogin(sid, spwd);
		HttpSession session = req.getSession();

		if (staff != null) {
			req.getSession().setAttribute("sid_in_session", staff.getSid());
			// 记住我 功能实现
			// 若用户选择自动登录，则生成cookies保存必要信息
			if ("rme".equals(rme)) {

				// cookies需要设置编码格式
				Cookie cookie = new Cookie("sid", URLEncoder.encode(staff.getSid(), "utf-8"));
				// Cookie cookie2 = new Cookie("cpwd",cpwd);
				// 设置保存时间
				cookie.setMaxAge(7 * 24 * 60 * 60);
				// cookie2.setMaxAge(7*24*60*60);
				// 设置保存路径
				// cookie.setPath(request.getContextPath()+"/");
				// 添加到响应头
				resp.addCookie(cookie);
				// resp.addCookie(cookie2);
			}
			String msg = "登录成功！";
			session.setAttribute("msg", msg);
			resp.sendRedirect("index.jsp");
		} else {
			String msg = "登录失败！";
			session.setAttribute("msg", msg);
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}

	}

}
