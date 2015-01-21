package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_shuih;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_shuihServer {
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
}
