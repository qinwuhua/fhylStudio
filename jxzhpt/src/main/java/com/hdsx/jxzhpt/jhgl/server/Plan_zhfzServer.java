package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_zhfzServer {
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
	Plan_zhfz queryZhfaById(String id);
	/**
	 * 查询灾害防治年份列表
	 * @return
	 */
	List<TreeNode> queryZhfaNfs();
	/**
	 * @param xzqhdm
	 * @return
	 */
	List<SjbbMessage> insertToSheet(String xzqhdm);
	
	/**
	 * 
	 * @param jck
	 * @return
	 */
	List<SjbbMessage> exportExcel_jh(Jckabgc jck);
}
