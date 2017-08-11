/**
 * 
 */
package cn.raoxianhua.dms.dao;

import java.util.List;
import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.vo.Express;

/**
 * @author raoxianhua
 *
 */
public interface IExpressDAO {

	CommonPage<Map<String, Object>> queryPage(int currentPage);

	List<Map<String, Object>> query(String eid);
	
	List<Map<String, Object>> equery(String eid);

	Express add(String cid, String eccname, String ecphone, String esaddress, String eremark, String escname,
			String esphone, String ehaddress);

	int modify(String eid,String eccname, String ecphone, String esaddress, String escname, String esphone, String ehaddress,
			String eremark, String esignfor, String edid);

	int update(String eid, String edetails);

	int delete(String eid);

}
