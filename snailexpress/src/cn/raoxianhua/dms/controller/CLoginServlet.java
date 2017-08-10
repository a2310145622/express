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
import cn.raoxianhua.dms.service.impl.ClientServiceImpl;
import cn.raoxianhua.dms.vo.Client;

/**
 * @author raoxianhua
 *
 */
@WebServlet("/doLogin")
public class CLoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private IClientService ClientService = new ClientServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		// HttpSession session = req.getSession();
		// String cid = (String)session.getAttribute("cid_in_session");

		Cookie[] cookies = req.getCookies();

		// if (cookies != null) {
		for (Cookie c : cookies) {
			if ("cid".equals(c.getName())) {
				// 如果是中文，cookies需要解码
				Client client = ClientService.doLoginByCookie(URLDecoder.decode(c.getValue(), "utf-8"));
				req.getSession().setAttribute("cid_in_session", client.getCid());
				resp.sendRedirect("index.jsp");
				break;
			}else
				req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		// for (int i = 0; i < cookies.length; i++) {
		// String id = cookies[i].getName();
		// if ("cid".equals(id)) {
		// //如果是中文，cookies需要解码
		// cid = URLDecoder.decode(cookies[i].getValue(), "utf-8");
		// }
		// }
		// }
		// 当用户名和密码不为空时，自动登录
		// if ((cid != null && !("".equals(cid)))) {
		// session.setAttribute("cid_in_session", cid);
		// resp.sendRedirect("dologin");//get请求
		// }
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		String cid = req.getParameter("cid");
		String cpwd = req.getParameter("cpwd");
		String rme = req.getParameter("rme");

		Client client = ClientService.doLogin(cid, cpwd);
		HttpSession session = req.getSession();

		if (client != null) {
			req.getSession().setAttribute("cid_in_session", client.getCid());
			// 记住我 功能实现
			// 若用户选择自动登录，则生成cookies保存必要信息
			if ("rme".equals(rme)) {

				// cookies需要设置编码格式
				Cookie cookie = new Cookie("cid", URLEncoder.encode(client.getCid(), "utf-8"));
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
