package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

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
}
