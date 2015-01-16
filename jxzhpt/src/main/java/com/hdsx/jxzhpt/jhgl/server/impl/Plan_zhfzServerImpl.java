package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_zhfzServerImpl extends BaseOperate  implements Plan_zhfzServer {

	public Plan_zhfzServerImpl() {
		super("plan_zhfz", "jdbc");
	}

	@Override
	public List<Plan_zhfz> queryZhfzList(int page, int rows, Plan_zhfz jh,Jckzhfz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		List<Plan_zhfz> queryList = queryList("queryZhfzList",params);
		return queryList;
	}

	@Override
	public int queryZhfzCount(Plan_zhfz jh, Jckzhfz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryZhfzCount", params);
	}

	@Override
	public Plan_zhfz queryZhfaById(String id) {
		return queryOne("queryZhfaById", id);
	}

	@Override
	public List<TreeNode> queryZhfaNfs() {
		return queryList("queryZhfaNfs");
	}

}
