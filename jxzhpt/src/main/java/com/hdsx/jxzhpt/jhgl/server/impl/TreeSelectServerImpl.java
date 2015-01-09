package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcgjServer;
import com.hdsx.jxzhpt.jhgl.server.TreeSelectServer;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

@Service
public class TreeSelectServerImpl extends BaseOperate implements TreeSelectServer {

	public TreeSelectServerImpl() {
		super("treenode", "jdbc");
	}

	@Override
	public List<TreeNode> queryGydwByParent(String parent) {
		return queryList("queryGydwByParent",parent);
	}

	@Override
	public int queryChildCount(String parentId) {
		return queryOne("queryChildCount", parentId);
	}

	@Override
	public List<TreeNode> queryXzqhByParent(String parent) {
		return queryList("queryXzqhByParent",parent);
	}
}
