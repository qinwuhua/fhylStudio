package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_abgcServer {
	/**
	 * 查询特殊地区的下拉框
	 * @return
	 */
	List<TreeNode> queryTsdq();
	
	/**
	 * 删除后修改审查库信息的列入状态
	 * @param sckId
	 * @return
	 */
	boolean updateLrztBySckid(String sckId);
	/**
	 * 查询总计信息
	 * @param lx 路线参数信息 
	 * @param jh 计划参数信息
	 * @return
	 */
	Plan_abgc querySumAbgc(Plan_abgc jh, Jckabgc lx );
	
	/**
	 * 查询列表
	 * @param page
	 * @param rows
	 * @param jh
	 * @param lx
	 * @return
	 */
	List<Plan_abgc> queryAbgcList(int page,int rows,Plan_abgc jh,Jckabgc lx);
	
	/**
	 * 查询数量
	 * @param jh
	 * @param lx
	 * @return
	 */
	int queryAbgcCount(Plan_abgc jh,Jckabgc lx);
	/**
	 * 年份列表
	 * @return
	 */
	List<TreeNode> queryAbgcNfs();
	/**
	 * 根据ID查询对应详细信息
	 * @param id
	 * @return
	 */
	Plan_abgc queryAbgcById(String id);
	Plan_abgc queryAfgcById(String id);
	/**
	 * 根据ID删除安保工程
	 * @param id
	 */
	boolean dropAbgcById(String id);
	/**
	 * @param xzqhdm
	 * @return
	 */
	List<SjbbMessage> insertToSheet(Map map);
	/**
	 * @param jck
	 * @return
	 */
	List<Excel_list> exportExcel_jh(Plan_abgc jh,Jckabgc lx);
	List<Excel_list> exportExcel_jh1(Plan_abgc jh,Jckabgc lx);
	/**
	 * 修改安保工程计划信息
	 * @return
	 */
	int editAbgcById(Plan_abgc jh);
	
	
	boolean importAbgc_jh(List<Map> data);

	boolean editStatus(Plan_abgc jh);
	boolean editStatus1(Plan_abgc jh);
	Bzbz lwBzbz(Bzbz bz);
	Bzbz getafBzbz(Bzbz bz);
//	boolean updateGkbg(Plan_abgc jh);
//	boolean updateSjsgt(Plan_abgc jh);
	boolean updateGkbg(Plan_upload uploads);
	boolean updateSjsgt(Plan_upload uploads);
	Plan_upload queryFjById(String id);
	List<Plan_upload> queryFjByParentId(Plan_upload uploads);
	boolean deleteFile(Plan_upload uploads);

	boolean editAbgcSckBysckid(Sckabgc sc);

	List<Plan_abgc> queryAbgcListByStatus(Plan_abgc jh, Jckabgc lx);

	List<Plan_abgc> queryAbgcByStatus(Plan_abgc jh, Jckabgc lx);

	List<Plan_abgc> queryAfgcByStatus(Plan_abgc jh, Jckabgc lx);
	
	boolean updateStatusBatch(List<Plan_abgc> splist);

	TreeNode queryJcktj(TreeNode treenode);

	List<TreeNode> queryJcktj1(String nf);

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

	List<Plan_abgc> queryAbgcList(Plan_abgc jh, Jckabgc lx);
	List<Plan_abgc> queryAfgcList(Plan_abgc jh, Jckabgc lx);
	/**
	 * 安保工程资金追加
	 * @param jh
	 * @return
	 */
	boolean editZjById(Plan_abgc jh);
	/**
	 * 到处计划审核Excel
	 * @param jh
	 * @param lx
	 * @return
	 */
	List<Object> exportExcelAbgcJhSh(Plan_abgc jh, Jckabgc lx);
	List<Object> exportExcelAfgcJhSh(Plan_abgc jh, Jckabgc lx);
	/**
	 * 导入计划审核Excel
	 * @param list
	 * @return
	 */
	boolean updateImportAbgcJhSh(List<Plan_abgc> list);

	List<Plan_upload> queryFjByParentId2(Plan_upload uploads);

	boolean deleteFile2(Plan_upload uploads);

	boolean updateTzxz(Plan_abgc jh);

	int queryAbgcTz(Plan_abgc jh);

	boolean updateAbgcTz(Plan_abgc jh);

	boolean insertAbgcTz(Plan_abgc jh);

	int queryAbgcTzCount(Plan_abgc jh, Jckabgc lx);

	List<Plan_abgc> queryAbgcTzList(int page, int rows, Plan_abgc jh, Jckabgc lx);

	Plan_abgc querySumAbgcTz(Plan_abgc jh, Jckabgc lx);

	boolean insertAbgcFromBf(Plan_abgc jh);

	boolean dropAbgcBfById(Plan_abgc jh);

	Plan_abgc queryAbgcTzById(String id);

	int editAbgcTzById(Plan_abgc jh);

	Plan_abgc querySumAfgc(Plan_abgc jh, Jckabgc lx);

	int queryAfgcCount(Plan_abgc jh, Jckabgc lx);

	List<Plan_abgc> queryAfgcList(int page, int rows, Plan_abgc jh, Jckabgc lx);

	int editAfgcById(Plan_abgc jh);

	List<Excel_list> exportExcleAbgc(Plan_abgc jh);

	boolean tuihuiAfById(String jh);

}
