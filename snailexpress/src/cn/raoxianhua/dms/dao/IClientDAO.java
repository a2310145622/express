/**
 * 
 */
package cn.raoxianhua.dms.dao;

import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.vo.Client;

/**
 * @author raoxianhua
 *
 */
public interface IClientDAO {
	
	Client querySingle(String cid);
	
	int register(String cid, String cpwd, String cname, String clphone, String cemail);

	int modify(String cid, String cpwd, String cname, String clphone, String cemail);

	CommonPage<Map<String, Object>> queryPage(int currentPage);

	Client query(String cid);

	int modifyinfo(String cid, String cname, String clphone, String cemail);

	int modifypwd(String cid, String cpwd, String ncpwd);

}
