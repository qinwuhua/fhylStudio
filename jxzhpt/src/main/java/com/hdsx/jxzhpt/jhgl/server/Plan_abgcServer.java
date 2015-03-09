package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.utile.SjbbMessage;
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
	List<SjbbMessage> exportExcel_jh(Plan_abgc jh,Jckabgc lx);
	/**
	 * 修改安保工程计划信息
	 * @return
	 */
	int editAbgcById(Plan_abgc jh);
	
	
	boolean importAbgc_jh(List<Map> data);

	boolean editStatus(Plan_abgc jh);
	Bzbz lwBzbz(Bzbz bz);
//	boolean updateGkbg(Plan_abgc jh);
//	boolean updateSjsgt(Plan_abgc jh);
	boolean updateGkbg(Plan_upload uploads);
	boolean updateSjsgt(Plan_upload uploads);
	Plan_upload queryFjById(String id);
	List<Plan_upload> queryFjByParentId(Plan_upload uploads);
	boolean deleteFile(Plan_upload uploads);

	boolean editAbgcSckBysckid(Plan_abgc jh);

	List<Plan_abgc> queryAbgcListByStatus(Plan_abgc jh, Jckabgc lx);
}
