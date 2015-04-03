package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_shuih;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_shuihServer {
	/**
	 * 查询此路段是否有计划
	 * @param shuih
	 * @return
	 */
	int queryJhExist(Plan_lx_shuih shuih);
	/**
	 * 根据ID查询相应文件下载
	 * @param id
	 * @return
	 */
	Plan_shuih queryShuihwjById(String id);
	/**
	 * 上传文件到数据库中
	 * @param jh
	 * @return
	 */
	boolean uploadShuihFile(Plan_shuih jh);
	/**
	 * 根据计划ID删除路线信息
	 * @param id
	 * @return
	 */
	boolean dropShuihLxByJhid(String id);
	/**
	 * 根据路线查询是否有记录
	 * @param shuih
	 * @return
	 */
	int queryJlBylx(Plan_lx_shuih shuih);
	/**
	 * 水毁信息总计
	 * @return
	 */
	Plan_shuih querySumShuih(Plan_shuih jh,Plan_lx_shuih lx);
	/**
	 * 查询水毁列表
	 * @param page
	 * @param rows
	 * @param jh
	 * @param lx
	 * @return
	 */
	List<Plan_shuih> queryShuihList(int page,int rows,Plan_shuih jh,Plan_lx_shuih lx);
	/**
	 * 根据ID查询水毁的详细
	 * @param id
	 * @return
	 */
	Plan_shuih queryShuihById(String id);
	/**
	 * 查询水毁项目数量
	 * @param jh
	 * @param lx
	 * @return
	 */
	int queryShuihCount(Plan_shuih jh,Plan_lx_shuih lx);
	/**
	 * 查询水毁的年份列表
	 * @return
	 */
	List<TreeNode> queryShuihNfs();
	/**
	 * 根据ID删除水毁计划
	 * @param id
	 * @return
	 */
	boolean dropShuihById(String id);
	/**
	 * 根据ID修改水毁计划信息
	 * @param jh
	 * @return
	 */
	int editShuihById(Plan_shuih jh);
	/**
	 * 修改水毁计划状态
	 * @param jh
	 * @return
	 */
	boolean editShuihStatus(Plan_shuih jh);
	/**
	 * 添加计划信息
	 * @param jh
	 * @return
	 */
	boolean insertShuih_Jh(List<Map> jh);
	/**
	 * 添加路线信息
	 * @param lx
	 * @return
	 */
	boolean insertShuih_Lx(List<Map> lx);
	/**
	 * 查询次路线是否存在
	 * @param lxbm
	 * @return
	 */
	Plan_lx_shuih queryGPSBylxbm(Plan_lx_shuih shuih);
	/**
	 * 根据行政区划查询特殊地区
	 * @param xzqhdm
	 * @return
	 */
	String queryTsdqByXzqh(String xzqhdm);
	/**
	 * 查询补助金额信息
	 * @param flw
	 * @return
	 */
	Plan_flwbzbz queryBzzj(Plan_flwbzbz flw);
	
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
	List<Plan_shuih> queryShuihList(Plan_shuih jh, Plan_lx_shuih lx);
}
