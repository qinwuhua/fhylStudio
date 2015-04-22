package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import jsx3.gui.Tree;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcsj;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_gcsjServer {
	/**
	 * 判断计划中是否有此数据
	 * @param lx
	 * @return
	 */
	int queryJhExist(Plan_lx_gcsj lx);
	/**
	 * 根据ID查询对应文件
	 * @param id
	 * @return
	 */
	Plan_gcsj queryWjById(String id);
	/**
	 * 上传文件，把文件存入数据库中
	 * @param jh
	 * @return
	 */
	boolean uploadGcsjFile(Plan_gcsj jh);
	/**
	 * 根据计划ID删除路线
	 * @param id
	 * @return
	 */
	boolean dropGcsjLxByJhid(String id);
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
	
	List<Plan_gcsj> queryGcsjList(Plan_gcsj jh,Plan_lx_gcsj lx);
	
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
	/**
	 * 查询补助资金
	 * @param flw
	 * @return
	 */
	Plan_flwbzbz queryBzzj(Plan_flwbzbz flw);
	/**
	 * 根据行政区划查询特殊地区
	 * @param xzqhdm
	 * @return
	 */
	String queryTsdqByXzqh(String xzqhdm);
	
	Plan_gcsj queryGcsjSum(Plan_gcsj jh, Plan_lx_gcsj lx);
	
	List<TreeNode> queryJhktj(String nf);
	
	List<TreeNode> queryJhktj2(String xzqhdm, String nf, String end);
	/**
	 * 根据行政区划和年份查询总资金
	 * @param xzqhdm
	 * @param year
	 * @return
	 */
	double queryJhktj2(String xzqhdm, String year);
	
	List<TreeNode> queryJhktjt3(String xzqhdm, String nf, String end);
	
	List<TreeNode> queryGcktj(String xzqhdm,String nf);
	TreeNode queryGcktjt(String xzqhdm);
	TreeNode queryGcktj2(String xzqhdm, String nf);
	/**
	 * 工程升级
	 * @param lx 路线
	 * @return
	 */
	boolean insertGcsj_lx(Plan_lx_gcsj lx);
	/**
	 * 工程计划
	 * @param jh 计划实体
	 * @return
	 */
	boolean insertGcsj_Jh(Plan_gcsj jh);
	/**
	 * 查询历史修建记录
	 * @param lx
	 * @return
	 */
	List<Plan_gcsj> queryXjls(Plan_lx_gcsj lx);
	/**
	 * 查询GPSROAD表中的路线
	 * @param lx
	 * @return
	 */
	List<Plan_lx_gcsj> sjAutoCompleteLxbm(Plan_lx_gcsj lx);
}
