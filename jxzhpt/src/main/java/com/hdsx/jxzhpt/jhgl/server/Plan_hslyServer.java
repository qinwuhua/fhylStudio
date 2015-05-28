package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_hsly;

public interface Plan_hslyServer {
	/**
	 * 信息总计查询
	 * @return
	 */
	Plan_hsly querySumHsly(Plan_hsly yhsl);
	/**
	 * 添加
	 * @param list
	 * @return
	 */
	boolean insertHsly(List<Map> list);
	/**
	 * 添加
	 * @param list
	 * @return
	 */
	boolean insertHsly2(List<Plan_hsly> list);
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
	/**
	 * 根据ID查询详细信息
	 * @param id
	 * @return
	 */
	Plan_hsly queryHslyById(String id);
	/**
	 * 根据计划ID查询资金追加信息
	 * @param id 计划信息ID
	 * @return
	 */
	List<Plan_hsly> queryHslyZjzj(String id);
	/**
	 * 修改红色旅游信息
	 * @param hsly
	 */
	boolean editHsly(Plan_hsly hsly);
	/**
	 * 根据ID删除信息
	 * @param id
	 * @return
	 */
	boolean dropHslyById(String id);
	
	List<Plan_hsly> queryHslyList(Plan_hsly hsly);
	/**
	 * 修改红色旅游资金信息
	 * @param hsly
	 * @return
	 */
	boolean editHslyZj(Plan_hsly hsly);
}
