/**
 * 
 */
package cn.raoxianhua.dms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.raoxianhua.dms.service.IClientService;
import cn.raoxianhua.dms.service.impl.ClientServiceImpl;
import cn.raoxianhua.dms.vo.Client;

/**
 * @author raoxianhua
 *
 */
@WebServlet("/doCheck")
public class CheckServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IClientService ClientService = new ClientServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String cid = req.getParameter("cid");
		
		Client client = ClientService.doCheck(cid);
		
		//System.out.println(user.toString());
		
		resp.setCharacterEncoding("UTF-8");
		
		String msg = "";
		if( client.getCid()==null ) {
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
