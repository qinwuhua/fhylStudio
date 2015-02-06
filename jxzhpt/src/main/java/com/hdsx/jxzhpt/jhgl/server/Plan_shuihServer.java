package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_shuih;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_shuihServer {
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
	Plan_shuih querySumShuih();
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
}
