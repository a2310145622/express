/**
 * 
 */
package cn.raoxianhua.dms.service;

import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.vo.Staff;

/**
 * @author raoxianhua
 *
 */
public interface IStaffService {
	
	Staff doLogin(String sid,String spwd);

	Staff doLoginByCookie(String sid);

	Staff doCheck(String sid);
	
	int doRegister(String sid, String spwd, String sname, String snumber, String slphone, String sremark);

	int doModify(String sid, String spwd, String sname, String snumber, String slphone, String sremark);

	CommonPage<Map<String, Object>> queryPage(int currentPage);

	Staff doQuery(String sid);
	
}
