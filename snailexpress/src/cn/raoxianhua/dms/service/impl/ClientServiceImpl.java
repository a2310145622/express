/**
 * 
 */
package cn.raoxianhua.dms.service.impl;

import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.dao.IClientDAO;
import cn.raoxianhua.dms.dao.impl.ClientDAOImpl;
import cn.raoxianhua.dms.service.IClientService;
import cn.raoxianhua.dms.vo.Client;

/**
 * @author raoxianhua
 *
 */
public class ClientServiceImpl implements IClientService {

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.raoxianhua.dms.service.IClientService#doLogin(java.lang.String,
	 * java.lang.String)
	 */

	private IClientDAO clientDao;

	public ClientServiceImpl() {
		clientDao = new ClientDAOImpl();
	}

	@Override
	public Client doLogin(String cid, String cpwd) {
		// TODO Auto-generated method stub

		Client client = clientDao.querySingle(cid);
		if (client.getCid() != null && client.getCpwd().equals(cpwd)) {
			return client;
		} else
			return null;
	}

	@Override
	public Client doLoginByCookie(String cid) {
		// TODO Auto-generated method stub
		
		Client client = clientDao.querySingle(cid);
		return client;
	}

	@Override
	public Client doCheck(String cid) {
		// TODO Auto-generated method stub
		
		Client client = clientDao.querySingle(cid);
		return client;
	}
	
	@Override
	public int doRegister(String cid, String cpwd, String cname, String clphone, String cemail) {
		// TODO Auto-generated method stub
		
		int register = clientDao.register(cid,cpwd,cname,clphone,cemail);
		return register;
	}

	@Override
	public int doModify(String cid, String cpwd, String cname, String clphone, String cemail) {
		// TODO Auto-generated method stub

		int modify = clientDao.modify(cid,cpwd,cname,clphone,cemail);
		return modify;
	}

	@Override
	public CommonPage<Map<String, Object>> queryPage(int currentPage) {
		// TODO Auto-generated method stub
		
		CommonPage<Map<String, Object>> clients = clientDao.queryPage(currentPage);
		return clients;
	}

	@Override
	public Client doQuery(String cid) {
		// TODO Auto-generated method stub
		
		Client query = clientDao.query(cid);
		return query;
	}

	@Override
	public int doModifyInfo(String cid, String cname, String clphone, String cemail) {
		// TODO Auto-generated method stub
		
		int modifyinfo = clientDao.modifyinfo(cid,cname,clphone,cemail);
		return modifyinfo;
	}

	@Override
	public int doModifyPWD(String cid, String cpwd, String ncpwd) {
		// TODO Auto-generated method stub
		
		int modifypwd = clientDao.modifypwd(cid,cpwd,ncpwd);
		return modifypwd;
	}

}
