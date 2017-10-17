package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_yhdzx;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

/**
 * @author chc
 *
 */
public interface Plan_wqgzServer {
	boolean updateLrztBySckid(String sckid);
	/**
	 * 添加危桥改造的上传文件
	 * @param upload
	 * @return
	 */
	boolean insertwqFile(Plan_upload upload);
	/**
	 * 危桥改造列表
	 * @param page
	 * @param rows
	 * @param jh
	 * @param lx
	 * @return
	 */
	List<Plan_wqgz> queryWqgzList(int page,int rows,Plan_wqgz jh,Jckwqgz lx);
	/**
	 * 危桥改造数量
	 * @param jh
	 * @param lx
	 * @return
	 */
	int queryWqgzCount(Plan_wqgz jh,Jckwqgz lx);
	/**
	 * 根据ID查询详细
	 * @param id
	 * @return
	 */
	Plan_wqgz queryWqgzById(String id);
	/**
	 * 危桥改造年份列表
	 * @return
	 */
	List<TreeNode> queryWqgzNfs();
	
	/**
	 * @param xzqhdm
	 * @return
	 */
	List<SjbbMessage> insertToSheet(Map map);
	/**
	 * 
	 * @param jck
	 * @return
	 */
	List<Excel_list> exportExcel_jh(Plan_wqgz jh,Jckwqgz lx);
	/**
	 * 根据ID删除危桥改造项目
	 * @param id
	 * @return
	 */
	boolean dropWqgzById(String id);
	/**
	 * 根据ID修改计划信息
	 * @param jh
	 * @return
	 */
	int editWqgzById(Plan_wqgz jh);
	
	boolean importWqgz_jh(List<Map> data);
	
	/**
	 * 修改危桥改造计划状态
	 * @param jh
	 * @return
	 */
	boolean editWqgzStatus(Plan_wqgz jh);
	/**
	 * 查询总计信息
	 * @return
	 */
	Plan_wqgz querySumWqgz(Plan_wqgz jh,Jckwqgz lx);
	Plan_wqgz queryWqgzFjById(String id);
	boolean editWqgzSckxx(Sckwqgz jh);
	List<Plan_wqgz> queryWqgzByStatus(Plan_wqgz jh, Jckwqgz lx);
	boolean updateStatusBatch(List<Plan_wqgz> splist);
	TreeNode queryJcktj(TreeNode treenode);
	List<TreeNode> queryJcktj1(String nf);
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
	List<Plan_wqgz> queryWqgzList(Plan_wqgz jh, Jckwqgz lx);
	/**
	 * 查询危桥历史数据
	 * @param lx
	 * @return
	 */
	List<Plan_wqgz> queryWqLs(Jckwqgz lx);
	/**
	 * 修改危桥改造金额
	 * @param jh
	 * @return
	 */
	boolean editZjById(Plan_wqgz jh);
	/**
	 * 计划库审查导出EXCEL
	 * @param jh
	 * @param lx
	 * @return
	 */
	List<Object> exportExcelWqgzJhSh(Plan_wqgz jh, Jckwqgz lx);
	/**
	 * 导入危桥改造计划审核
	 * @param list
	 * @return
	 */
	boolean updateImportWqgzJh(List<Plan_wqgz> list);
	List<Object> queryWqgzList1(Plan_wqgz jh, Jckwqgz lx);
}	
