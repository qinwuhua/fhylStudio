package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
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
		return delete("dropZjxd",id)>0;
	}

	@Override
	public boolean editZjxd(Plan_zjxd zjxd) {
		return update("editZjxd", zjxd)>0;
	}

	@Override
	public Plan_zjxd queryZjxdById(String id) {
		return queryOne("queryZjxdById", id);
	}
}
