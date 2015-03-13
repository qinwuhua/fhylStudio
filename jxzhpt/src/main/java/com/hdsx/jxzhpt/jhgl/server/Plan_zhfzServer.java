package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_zhfzServer {
	/**
	 * 修改审查库列入计划状态
	 * @param sckid
	 * @return
	 */
	boolean updateLrztBySckid(String sckid);
	/**
	 * 查询总计信息
	 * @return
	 */
	Plan_zhfz querySumZhfz(Plan_zhfz jh,Jckzhfz lx);
	/**
	 * 查询灾害防治列表
	 * @param page
	 * @param rows
	 * @param jh
	 * @param lx
	 * @return
	 */
	List<Plan_zhfz> queryZhfzList(int page,int rows,Plan_zhfz jh,Jckzhfz lx);
	/**
	 * 查询灾害防治个数
	 * @param jh
	 * @param lx
	 * @return
	 */
	int queryZhfzCount(Plan_zhfz jh,Jckzhfz lx);
	/**
	 * 根据ID查询详细信息
	 * @param id
	 * @return
	 */
	Plan_zhfz queryZhfzById(String id);
	/**
	 * 查询灾害防治年份列表
	 * @return
	 */
	List<TreeNode> queryZhfaNfs();
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
	List<SjbbMessage> exportExcel_jh(Plan_zhfz jh,Jckzhfz lx);
	/**
	 * 根据ID删除信息
	 * @param id
	 * @return
	 */
	boolean dropZhfzById(String id);
	/**
	 * 根据ID修改灾害防治信息
	 * @param jh
	 * @return
	 */
	int editZhfzById(Plan_zhfz jh);
	
	boolean importZhfz_jh(List<Map> data);
	/**
	 * 修改灾害防治的计划状态
	 * @param jh
	 * @return
	 */
	boolean editZhfzStatus(Plan_zhfz jh);
	boolean updateGkbg(Plan_zhfz jh);
	boolean updateSjsgt(Plan_zhfz jh);
	Plan_zhfz queryZhfzFjById(String id);
	boolean editZhfzSckBysckid(Plan_zhfz jh);
	List<Plan_zhfz> queryZhfzByStatus(Plan_zhfz jh, Jckzhfz lx);
	boolean updateStatusBatch(List<Plan_zhfz> splist);
	List<TreeNode> queryJcktj();
	List<TreeNode> queryJcktj1(String nf);
}
