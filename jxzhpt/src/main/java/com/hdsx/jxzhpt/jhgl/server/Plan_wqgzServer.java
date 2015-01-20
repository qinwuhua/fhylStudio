package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

/**
 * @author chc
 *
 */
public interface Plan_wqgzServer {
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
	List<SjbbMessage> insertToSheet(String xzqhdm);
	/**
	 * 
	 * @param jck
	 * @return
	 */
	List<SjbbMessage> exportExcel_jh(Jckabgc jck);
}
