/**
 * 
 */
package cn.raoxianhua.dms.service;

import java.util.List;
import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.vo.Express;

/**
 * @author raoxianhua
 *
 */
public interface IExpressService {

	CommonPage<Map<String, Object>> queryPage(int currentPage);

	List<Map<String, Object>> doSearch(String eid);
	int doAdd(String cid, String eccname, String ecphone, String esaddress, String eremark, String escname,
			String esphone, String ehaddress);

	int doModify(String eid,String eccname, String ecphone, String esaddress, String escname, String esphone, String ehaddress,
			String eremark, String esignfor, String edid);

	int doUpdate(String eid, String edetails);

}
