package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_hslyZjzj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjzj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_zjxdServer {
	/**
	 * 根据项目ID查找资金下达的列表
	 * @param id
	 * @return
	 */
	List<Plan_zjxd> queryZjxdByXmId(String id);
	/**
	 * 资金下达信息数量
	 * @param id 项目ID
	 * @return
	 */
	int queryZjxdCount(String id);
	/**
	 * 添加资金下达信息
	 * @param zjxd
	 */
	boolean addZjxd(Plan_zjxd zjxd);
	/**
	 * 根据ID删除资金下达信息
	 * @param id
	 * @return
	 */
	boolean dropZjxd(String id);
	/**
	 * 修改资金下达信息
	 * @param zjxd
	 * @return
	 */
	boolean editZjxd(Plan_zjxd zjxd);
	/**
	 * 根据ID查找对应下达信息
	 * @param id
	 * @return
	 */
	Plan_zjxd queryZjxdById(String id);
	/**
	 * 查看是否有资金下达记录，以确定是否是追加记录
	 * @param id
	 * @return
	 */
	int queryZjxdExistById(String id);
	/**
	 * 添加资金追加信息
	 * @param zjzj
	 * @return
	 */
	boolean insertZjzj(Plan_zjzj zjzj);
	
	Plan_zjxd queryZjxdSumByXmid(String xmid);
	boolean insertBatch(List<Plan_zjxd> readerExcel);
	String queryGydwmcById(String string);
	/**
	 * 根据行政区划查询所在的特殊地区
	 * @param xzqh
	 * @return
	 */
	List<TreeNode> queryTsdqByXzqh(String xzqh);
	/**
	 * 红色旅游资金追加
	 * @param zjzj
	 * @return
	 */
	boolean insertHslyZjzj(Plan_hslyZjzj zjzj);
	/**
	 * 根据项目ID查询资金追加记录
	 * @param zjzj
	 * @return
	 */
	List<Plan_zjzj> queryZjzjByXmid(Plan_zjzj zjzj);
}
