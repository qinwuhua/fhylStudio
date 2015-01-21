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
<<<<<<< HEAD
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
=======
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
>>>>>>> refs/remotes/origin/master
}
