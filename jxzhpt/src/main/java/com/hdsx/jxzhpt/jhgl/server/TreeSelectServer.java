package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;

import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface TreeSelectServer {
	/**
	 * 根据父级的管养单位Id获取包含的管养单位
	 * @param parent 父级别的管养单位ID
	 * @return 子类别的管养单位列表
	 */
	List<TreeNode> queryGydwByParent(String parent);
	
	/**
	 * 管养单位
	 * 根据父级别的ID获取子级别的个数
	 * @param parent
	 * @return
	 */
	int queryChildCount(String parent);
	
	/**
	 * 行政区划查询
	 * @param parent
	 * @return
	 */
	List<TreeNode> queryXzqhByParent(String parent);
}
