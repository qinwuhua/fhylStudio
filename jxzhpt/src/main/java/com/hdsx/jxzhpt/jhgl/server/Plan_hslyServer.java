package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_hsly;

public interface Plan_hslyServer {
	/**
	 * 添加
	 * @param list
	 * @return
	 */
	boolean insertHsly(List<Map> list);
	/**
	 * 查询
	 * @param hsly
	 * @return
	 */
	List<Plan_hsly> queryHslyList(int page,int rows,Plan_hsly hsly);
	/**
	 * 查询红色旅游个数
	 * @param hsly
	 * @return
	 */
	int queryHslyCount(Plan_hsly hsly);
}
