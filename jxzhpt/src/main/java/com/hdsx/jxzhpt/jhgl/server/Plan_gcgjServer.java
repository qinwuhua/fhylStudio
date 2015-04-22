package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcgj;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_gcgjServer {
	/**
	 * 添加一条路线信息
	 * @param lx
	 * @return
	 */
	boolean insertPlan_lx_Gcgj(Plan_lx_gcgj lx);
	
	/**
	 * 根据条件查询补助资金
	 * @param flwbzbz
	 * @return
	 */
	Plan_flwbzbz queryBzzj(Plan_flwbzbz flwbzbz);
	/**
	 * 根据行政区划查询特殊地区
	 * @param xzqh
	 * @return
	 */
	String queryTsdqByXzqh(String xzqh);
	
	/**
	 * 查询此路段是否存在计划
	 * @param gcgj
	 * @return
	 */
	int queryJhExist(Plan_lx_gcgj gcgj);
	/**
	 * 根据ID查询对应文件
	 * @param id
	 * @return
	 */
	Plan_gcgj queryGjwjById(String id);
	/**
	 * 上传文件到数据库中
	 * @param jh
	 * @return
	 */
	boolean uploadGcgjFile(Plan_gcgj jh);
	/**
	 * 根据计划ID删除路线信息
	 * @param id
	 * @return
	 */
	boolean dropGcgjLxByJhid(String id);
	/**
	 * 查询GPS路线信息
	 * @param lx
	 * @return
	 */
	Plan_lx_gcgj queryGPSBylxbm(Plan_lx_gcgj lx);
	/**
	 * 根据路线查询是否有记录
	 * @param lx
	 * @return
	 */
	int queryJlBylx(Plan_lx_gcgj lx);
	/**
	 * 信息总计
	 * @param lx 路线信息参数
	 * @param jh 计划信息参数
	 * @return
	 */
	Plan_gcgj querySumGcgj(Plan_gcgj jh, Plan_lx_gcgj lx);
	/**
	 * 分页查询
	 * @param page
	 * @param row
	 * @return
	 */
	List<Plan_gcgj> queryGcgjList(int page,int row,Plan_gcgj plan_gcgj,Plan_lx_gcgj plan_lx_gcgj);
	
	List<Plan_gcgj> queryGcgjList(Plan_gcgj plan_gcgj,Plan_lx_gcgj plan_lx_gcgj);
	/**
	 * 查询计划总个数
	 * @param plan_gcgj 查询条件
	 * @return
	 */
	int queryGcgjCount(Plan_gcgj plan_gcgj,Plan_lx_gcgj plan_lx_gcgj);
	
	/**
	 * 根据计划ID查询对应的工程改建信息
	 * @param id
	 * @return
	 */
	Plan_gcgj queryGcgjById(String id);

	/**
	 * 获取工程改建的年份列表
	 * @return
	 */
	List<TreeNode> queryGcgjNfs();
	/**
	 * 根据ID删除信息
	 * @param id
	 * @return
	 */
	boolean dropGcgjById(String id);
	/**
	 * 根据ID修改计划信息
	 * @param jh
	 * @return
	 */
	int editGcgjById(Plan_gcgj jh);
	/**
	 * 修改改建工程计划状态
	 * @param jh
	 * @return
	 */
	boolean editGcgjStatus(Plan_gcgj jh);
	
	/**
	 * 添加工程改建计划信息
	 * @param jh
	 * @return
	 */
	boolean insertGcgj_jh(List<Map> jh);
	/**
	 * 添加改建工程计划的路线信息
	 * @param lx
	 * @return
	 */
	boolean insertGcgj_lx(List<Map> lx);
	/**
	 * 根据路线编码到2013年路线数据库中查找是否有这一项
	 * @param lxbm
	 * @return
	 */
	int queryGPSBylxbm1(Plan_lx_gcgj lx);

	List<TreeNode> queryJhktj(String nf);

	List<TreeNode> queryJhktj2(String xzqhdm, String nf, String end);

	List<TreeNode> queryJhktjt3(String xzqhdm, String nf, String end);

	List<TreeNode> queryGcktj(String xzqhdm,String nf);

	TreeNode queryGcktjt(String xzqhdm);

	TreeNode queryGcktj2(String xzqhdm, String nf);

	boolean insertGcgjJh(Plan_gcgj jh);
	/**
	 * 从GPSROAD表中查询对应行政区划中的路线信息
	 * @param lx
	 * @return
	 */
	List<Plan_lx_gcgj> gjAutoCompleteLxbm(Plan_lx_gcgj lx);
}
