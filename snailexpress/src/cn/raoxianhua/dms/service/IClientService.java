/**
 * 
 */
package cn.raoxianhua.dms.service;

import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.vo.Client;

/**
 * @author raoxianhua
 *
 */
public interface IClientService {
	
	Client doLogin(String cid,String cpwd);

	Client doLoginByCookie(String cid);

	Client doCheck(String cid);

	int doRegister(String cid, String cpwd, String cname, String clphone, String cemail);
	
	int doModify(String cid, String cpwd, String cname, String clphone, String cemail);

	CommonPage<Map<String, Object>> queryPage(int currentPage);

	Client doQuery(String cid);

	int doModifyInfo(String cid, String cname, String clphone, String cemail);

	int doModifyPWD(String cid, String cpwd, String ncpwd);
}
