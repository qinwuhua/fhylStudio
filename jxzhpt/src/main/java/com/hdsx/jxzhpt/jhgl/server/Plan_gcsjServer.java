package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcsj;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_gcsjServer {
	/**
	 * 根据路线信息查询是否有记录
	 * @param lx
	 * @return
	 */
	int queryJlBylx(Plan_lx_gcsj lx);
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
	/**
	 * 修改升级项目的计划状态
	 * @param jh
	 * @return
	 */
	boolean editGcsjStatus(Plan_gcsj jh);
	/**
	 * 添加工程升级计划
	 * @param jh
	 * @return
	 */
	boolean insertGcsj_Jh(List<Map> jh);
	/**
	 * 添加工程升级路线
	 * @param lx
	 * @return
	 */
	boolean insertGcsj_lx(List<Map> lx);
	/**
	 * 根据路线编码查询是否有此路线
	 * @param lxbm
	 * @return
	 */
	Plan_lx_gcsj queryGPSBylxbm(Plan_lx_gcsj gcsj);
	/**
	 * 总计信息查询
	 * @return
	 */
	Plan_gcsj querySumMessage();
}
