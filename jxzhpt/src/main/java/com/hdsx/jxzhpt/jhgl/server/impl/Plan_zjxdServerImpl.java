package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_hslyZjzj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjzj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_zjxdServerImpl extends BaseOperate implements Plan_zjxdServer {
	public Plan_zjxdServerImpl() {
		super("plan_zjxd", "jdbc");
	}

	@Override
	public List<Plan_zjxd> queryZjxdByXmId(String id) {
		return queryList("queryZjxdByXmId",id);
	}
	
	@Override
	public int queryZjxdCount(String id) {
		return queryOne("queryZjxdCount", id);
	}

	@Override
	public boolean addZjxd(Plan_zjxd zjxd) {
		return insert("addZjxd", zjxd)>0;
	}

	@Override
	public boolean dropZjxd(String id) {
		return delete("dropZjxdById",id)>0;
	}

	@Override
	public boolean editZjxd(Plan_zjxd zjxd) {
		return update("editZjxd", zjxd)>0;
	}

	@Override
	public Plan_zjxd queryZjxdById(String id) {
		return queryOne("queryZjxdById", id);
	}

	@Override
	public int queryZjxdExistById(String id) {
		return queryOne("queryZjxdExistById", id);
	}

	@Override
	public boolean insertZjzj(Plan_zjzj zjzj) {
		return insert("insertZjzj", zjzj)>0;
	}

	@Override
	public Plan_zjxd queryZjxdSumByXmid(String id) {
		return queryOne("queryZjxdSumByXmid", id);
	}

	@Override
	public boolean insertBatch(List<Plan_zjxd> readerExcel) {
		return insertBatch("insertBatch", readerExcel)==readerExcel.size();
	}

	@Override
	public String queryGydwmcById(String id) {
		return queryOne("queryGydwmcById", id);
	}

	@Override
	public List<TreeNode> queryTsdqByXzqh(String xzqh) {
		return queryList("queryTsdqByXzqh",xzqh);
	}

	@Override
	public boolean insertHslyZjzj(Plan_hslyZjzj zjzj) {
		return insert("insertHslyZjzj", zjzj)>0;
	}
}
