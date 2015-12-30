package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_yhdzx;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_bhsd;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckbhsd;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckbhsd;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

/**
 * @author chc
 *
 */
public interface Plan_bhsdServer {
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
	List<Plan_bhsd> queryWqgzList(int page,int rows,Plan_bhsd jh,Jckbhsd lx);
	/**
	 * 危桥改造数量
	 * @param jh
	 * @param lx
	 * @return
	 */
	int queryWqgzCount(Plan_bhsd jh,Jckbhsd lx);
	/**
	 * 根据ID查询详细
	 * @param id
	 * @return
	 */
	Plan_bhsd queryWqgzById(String id);
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
	List<SjbbMessage> exportExcel_jh(Plan_bhsd jh,Jckbhsd lx);
	
	List<SjbbMessage> exportExcel_jh_sh(Plan_bhsd jh,Jckbhsd lx);
	
	List<SjbbMessage> exportExcel_jh_sd(Plan_bhsd jh,Jckbhsd lx);
	
	List<SjbbMessage> exportExcel_jh_tz(Plan_bhsd jh,Jckbhsd lx);
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
	int editWqgzById(Plan_bhsd jh);
	
	boolean importWqgz_jh(List<Map> data);
	
	/**
	 * 修改危桥改造计划状态
	 * @param jh
	 * @return
	 */
	boolean editWqgzStatus(Plan_bhsd jh);
	/**
	 * 批量修改危桥改造计划状态
	 * @param jh
	 * @return
	 */
	boolean editWqgzBathStatus(String ids,Plan_bhsd jh);
	/**
	 * 批量审定危桥改造计划状态
	 * @param jh
	 * @return
	 */
	boolean editWqgzBathSdStatus(String ids,Plan_bhsd jh);
	/**
	 * 查询总计信息
	 * @return
	 */
	Plan_bhsd querySumWqgz(Plan_bhsd jh,Jckbhsd lx);
	Plan_bhsd queryWqgzFjById(String id);
	boolean editWqgzSckxx(Sckbhsd jh);
	List<Plan_bhsd> queryWqgzByStatus(Plan_bhsd jh, Jckbhsd lx);
	boolean updateStatusBatch(List<Plan_bhsd> splist);
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
	List<Plan_bhsd> queryWqgzList(Plan_bhsd jh, Jckbhsd lx);
	/**
	 * 查询危桥历史数据
	 * @param lx
	 * @return
	 */
	List<Plan_bhsd> queryWqLs(Jckbhsd lx);
	/**
	 * 修改危桥改造金额
	 * @param jh
	 * @return
	 */
	boolean editZjById(Plan_bhsd jh);
	/**
	 * 修改危桥改造上报状态
	 * @param jh
	 * @return
	 */
    boolean xgJhkWqgzSbzt(String jhids,Plan_bhsd wqgz); 
    /**
     * 修改计划库退回状态
     * @param jhIds
     * @param unit2
     * @return
     */
    boolean xgJhkWqgzTH(String jhIds,Plan_bhsd wqgz);
    /**
     * 调整项目
     * @param jhIds
     * @param unit2
     * @return
     */
    boolean tzBhsd(Plan_bhsd jh);
    boolean tzBhsdTh(Plan_bhsd jh);
    List<Plan_bhsd> queryBhsdListTz(int page,int rows,Plan_bhsd jh,Jckbhsd lx);
    int queryBhsdCountTz(Plan_bhsd jh,Jckbhsd lx);
    Plan_bhsd querySumBhsdTz(Plan_bhsd jh,Jckbhsd lx);
    Plan_bhsd queryBhsdtzById(String id);
}
