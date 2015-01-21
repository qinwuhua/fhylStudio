package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_wqgzServerImpl extends BaseOperate implements Plan_wqgzServer {

	public Plan_wqgzServerImpl() {
		super("plan_wqgz","jdbc");
	}

	@Override
	public List<Plan_wqgz> queryWqgzList(int page, int rows, Plan_wqgz jh,Jckwqgz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryWqgzList",params);
	}

	@Override
	public int queryWqgzCount(Plan_wqgz jh, Jckwqgz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryWqgzCount",params);
	}

	@Override
	public Plan_wqgz queryWqgzById(String id) {
		return queryOne("queryWqgzById",id);
	}

	@Override
	public List<TreeNode> queryWqgzNfs() {
		return queryList("queryWqgzNfs");
	}

	@Override
	public List<SjbbMessage> insertToSheet(String xzqhdm) {
		return this.queryList("insertToSheet",xzqhdm);
	}

	@Override
	public List<SjbbMessage> exportExcel_jh(Jckabgc jck) {
		return this.queryList("exportExcel_jh",jck);
	}
	public boolean dropWqgzById(String id) {
		return delete("dropWqgzById",id)>0;
	}

	@Override
	public int editWqgzById(Plan_wqgz jh) {
		return update("editWqgzById", jh);
	}
}
