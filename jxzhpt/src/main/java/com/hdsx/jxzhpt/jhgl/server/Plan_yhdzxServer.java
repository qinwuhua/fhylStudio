package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_yhdzx;
import com.hdsx.jxzhpt.jhgl.bean.Plan_yhdzx;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_yhdzxServer {
	/**
	 * 根据计划ID删除路线信息
	 */
	boolean dropYhdzxLxByJhid(String id);
	
	/**
	 * 总计信息查询
	 * @param lx 路线参数信息
	 * @param jh 计划参数信息
	 * @return
	 */
	Plan_yhdzx querySumYhdzx(Plan_yhdzx jh, Plan_lx_yhdzx lx);
	/**
	 * 养护大中修列表查询
	 * @param jh
	 * @param lx
	 * @return
	 */
	List<Plan_yhdzx> queryYhdzxList(int page,int rows,Plan_yhdzx jh,Plan_lx_yhdzx lx);
	/**
	 * 养护大中修列表总数查询
	 * @param jh
	 * @param lx
	 * @return
	 */
	int queryYhdzxCount(Plan_yhdzx jh,Plan_lx_yhdzx lx);
	/**
	 * 获取养护大中修年份
	 * @return
	 */
	List<TreeNode> queryYhdzxNfs();
	/**
	 * 根据ID删除信息
	 * @param id
	 * @return
	 */
	boolean dropYhdzxById(String id);
	/**
	 * 修改养护大中修计划信息
	 * @param jh
	 * @return
	 */
	boolean editYhdzxById(Plan_yhdzx jh,Plan_lx_yhdzx lx);
	/**
	 * 修改养护大中修的状态信息
	 * @param jh
	 * @return
	 */
	boolean editYhdzxStatus(Plan_yhdzx jh);
	/**
	 * 添加养护大中修的计划信息
	 * @param jh
	 * @return
	 */
	boolean insertYhdzx_jh(List<Map> jh);
	/**
	 * 添加养护大中修的路线信息
	 * @param lx
	 * @return
	 */
	boolean insertYhdzx_lx(List<Map> lx);
	/**
	 * 根据ID查询详细信息
	 * @param id
	 * @return
	 */
	Plan_yhdzx queryYhdzxById(String id);
	
	boolean editYhdzxLxById(Plan_yhdzx jh, Plan_lx_yhdzx lx);

	List<TreeNode> queryJhktj(String nf);

	List<TreeNode> queryJhktj2(String xzqhdm, String nf, String end);
	/**
	 * 根据行政区划和年份查询总资金
	 * @param xzqhdm
	 * @param string
	 * @return
	 */
	double queryJhktj2(String xzqhdm, String string);

	List<TreeNode> queryJhktjt3(String xzqhdm, String nf, String end);

	List<TreeNode> queryGcktj(String xzqhdm,String nf);

	TreeNode queryGcktjt(String xzqhdm);

	TreeNode queryGcktj2(String xzqhdm, String nf);

	List<Plan_yhdzx> queryYhdzxList(Plan_yhdzx jh, Plan_lx_yhdzx lx);
	/**
	 * 添加单个路线
	 * @param lx
	 * @return
	 */
	boolean insertYhdzx_lx(Plan_lx_yhdzx lx);
	/**
	 * 添加单个计划
	 * @param jh
	 * @return
	 */
	boolean insertYhdzx_jh(Plan_yhdzx jh);
	/**
	 * GPSROAD查询路线
	 * @param lx
	 * @return
	 */
	List<Plan_lx_yhdzx> yhdzxAutoCompleteLxbm(Plan_lx_yhdzx lx);
	/**
	 * 修改养护大中修路线
	 * @param lx 路线对象
	 * @return
	 */
	boolean editYhdzxLxById(Plan_lx_yhdzx lx);
	/**
	 * 查询是否有次路线
	 * @param lx
	 * @return
	 */
	int queryJhExist(Plan_lx_yhdzx lx);
	/**
	 * 查询是否有历史记录
	 * @param lx1
	 * @return
	 */
	int queryJlBylx(Plan_lx_yhdzx lx1);

	boolean editYhdzxStatusBatch(List<Plan_yhdzx> list);
}
