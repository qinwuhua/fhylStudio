package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcsj;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_gcsjServer {
	/**
	 * 工程升级查询
	 * @param jh
	 * @param lx
	 * @return
	 */
	List<Plan_gcsj> queryGcsjList(int page,int rows,Plan_gcsj jh,Plan_lx_gcsj lx);
	
	/**
	 * 工程升级项目数量查询
	 * @param jh
	 * @param lx
	 * @return
	 */
	int queryGcsjCount(Plan_gcsj jh,Plan_lx_gcsj lx);
	
	/**
	 * 根据ID查详细
	 * @param id
	 * @return
	 */
	Plan_gcsj queryGcsjById(String id);
	
	/**
	 * 获取工程升级的年份信息
	 * @return
	 */
	List<TreeNode> queryGcsjNfs();
	/**
	 * 根据ID删除工程升级计划
	 * @param id
	 * @return
	 */
	boolean dropGcsjById(String id);
	/**
	 * 根据ID修改信息
	 * @param jh
	 * @return
	 */
	int editGcsjById(Plan_gcsj jh);
}
