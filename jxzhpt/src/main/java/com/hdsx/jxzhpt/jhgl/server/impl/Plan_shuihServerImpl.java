package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_shuih;
import com.hdsx.jxzhpt.jhgl.server.Plan_shuihServer;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_shuihServerImpl extends BaseOperate implements Plan_shuihServer {

	public Plan_shuihServerImpl() {
		super("plan_shuih", "jdbc");
	}

	@Override
	public List<Plan_shuih> queryShuihList(int page, int rows, Plan_shuih jh,Plan_lx_shuih lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("l", lx);
		return queryList("queryShuihList",params);
	}

	@Override
	public Plan_shuih queryShuihById(String id) {
		return queryOne("queryShuihById", id);
	}

	@Override
	public int queryShuihCount(Plan_shuih jh, Plan_lx_shuih lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("l", lx);
		return queryOne("queryShuihCount", params);
	}

	@Override
	public List<TreeNode> queryShuihNfs() {
		return queryList("queryShuihNfs");
	}

}
