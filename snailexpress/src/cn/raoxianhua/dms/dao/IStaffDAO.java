/**
 * 
 */
package cn.raoxianhua.dms.dao;

import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.vo.Staff;

/**
 * @author raoxianhua
 *
 */
public interface IStaffDAO {
	
	Staff querySingle(String sid);
	
	int register(String sid, String spwd, String sname, String snumber, String slphone, String sremark);

	int modify(String sid, String spwd, String sname, String snumber, String slphone, String sremark);

	CommonPage<Map<String, Object>> queryPage(int currentPage);

	Staff query(String sid);
	
}
