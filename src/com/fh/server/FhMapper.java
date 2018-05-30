package com.fh.server;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface FhMapper {

	     /**
	      * 查询所有的用户信息
	      * @return
	      * @throws Exception
	      */
	    public List<Map<String, String>> selectOutMsg(String msg) throws Exception;

		public List<HashMap<String, String>> selectRoleByQq(String string);

		public int insertRole(Map<String, String> role);

		public void updateRole(Map<String, String> role);

		public List<HashMap<String, String>> selectRoleByQqAndJg(String string);

		public List<HashMap<String, String>> selectFb();

		public List<HashMap<String, String>> queryfbByName(String split);

		public List<HashMap<String, String>> selectSP(String string);

		public List<HashMap<String, String>> selectWpByQq(String string);

		public List<HashMap<String, String>> selectWdwpByQqAndName(HashMap<String, String> h);

		public List<HashMap<String, String>> selectSpByName(String string);

		public void updatewp(HashMap<String, String> h);

		public void insertWp(HashMap<String, String> ywq);

		public void deleteWp(HashMap<String, String> xwq);

		public void updateRolebyWp(HashMap<String, String> h);

		public HashMap<String, String> querySpByIdAndLx(HashMap<String, String> bsp);
		
		
	
}
