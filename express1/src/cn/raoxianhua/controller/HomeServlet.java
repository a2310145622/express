/**
 * 
 */
package cn.raoxianhua.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Map;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.raoxianhua.common.utils.DBUtils;

/**
 * @author raoxianhua
 *
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Cookie[] cookies = req.getCookies();
		String cid = null;
		String cpwd = null;
		HttpSession session = req.getSession();
		if (session.getAttribute("cid_in_session") == null) {
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					String id = cookies[i].getName();
					String pwd = cookies[i].getName();
					if ("cid".equals(id)) {
						// 如果是中文，cookies需要解码
						cid = URLDecoder.decode(cookies[i].getValue(), "utf-8");
					} else if ("cpwd".equals(pwd)) {
						cpwd = cookies[i].getValue();
					}
				}
			}
			// 当用户名和密码不为空时，自动登录
			if ((cid != null && !("".equals(cid))) && (cpwd != null && !("".equals(cpwd)))) {
				session.setAttribute("cid_in_session", cid);
				session.setAttribute("cpwd_in_session", cpwd);
				resp.sendRedirect("login");// get请求
			} else {
				String sql = "SELECT * FROM CLIENT";
				List<Map<String, Object>> clientlist = DBUtils.query(sql);
				req.setAttribute("clientlist", clientlist);
				req.getRequestDispatcher("queryClientList").forward(req, resp);
			}
		} else {
			String sql = "SELECT * FROM CLIENT";
			List<Map<String, Object>> clientlist = DBUtils.query(sql);
			req.setAttribute("clientlist", clientlist);
			req.getRequestDispatcher("queryClientList").forward(req, resp);
		}

	}
}
