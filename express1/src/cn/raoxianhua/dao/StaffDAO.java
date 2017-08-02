/**
 * 
 */
package cn.raoxianhua.dao;

import java.util.Map;

import cn.raoxianhua.common.CommonPage;

/**
 * DESC: 
 * 2017年7月27日
 * @author BKF
 */
public class StaffDAO {

	/**
	 * 获取分页员工信息
	 * @param currPage
	 * @return
	 */
	public CommonPage<Map<String, Object>> queryPage(int currentPage) {
		
		CommonPage<Map<String, Object>> data = new CommonPage<>(currentPage, 1);

		String countSql = "SELECT count(1) FROM STAFF WHERE 1=1";
		String dataSql = "SELECT * " +
						 "  FROM (SELECT ROWNUM rn, s.STAFFID, s.STAFFNAME, s.STAFFNUMBER, "
						 + "s.LINKPHONE, s.STAFFPASSWORD,s.REMARK FROM STAFF s " +
						 "         WHERE ROWNUM <= ? * ?) t" +
						 " WHERE rn > ? * (?-1)";

		data.setCountSql(countSql);
		data.setDataSql(dataSql);
		return data;
	}
	
	
}
