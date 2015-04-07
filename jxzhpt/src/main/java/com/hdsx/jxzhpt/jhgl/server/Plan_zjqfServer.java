package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.PlanZjqf;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_zjqfServer {
	/**
	 * 根据年份和行政区划查询对应资金切分信息
	 * @param zjqf
	 * @return
	 */
	PlanZjqf queryZjqfByXzqh(PlanZjqf zjqf);
	
	/**
	 * 修改资金切分
	 * @param zjqf
	 * @return
	 */
	boolean editZjqfById(PlanZjqf zjqf);
	
	/**
	 * 添加资金切分信息
	 * @param zjqf
	 * @return
	 */
	boolean addZjqf(PlanZjqf zjqf);
	
	/**
	 * 查询下级行政区划列表
	 * @return
	 */
	List<TreeNode> queryChildXzqh(TreeNode xzqh);

	/**
	 * 查询夏季管养单位
	 * @param xzqh
	 * @return
	 */
	List<TreeNode> queryChildGydw(TreeNode xzqh);
}
