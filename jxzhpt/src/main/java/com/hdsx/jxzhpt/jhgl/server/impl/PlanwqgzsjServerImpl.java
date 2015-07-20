package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.bean.Planwqgzsj;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.PlanwqgzsjServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class PlanwqgzsjServerImpl extends BaseOperate implements PlanwqgzsjServer {
	public PlanwqgzsjServerImpl() {
		super("planwqgzsj","jdbc");
	}
	@Override
	public List<Planwqgzsj> selectwqjhkgl(Planwqgzsj planwqgzsj) {
		return queryList("selectwqjhkgl",planwqgzsj);
	}
	@Override
	public int selectwqjhkglcount(Planwqgzsj planwqgzsj) {
		return queryOne("selectwqjhkglcount", planwqgzsj);
	}
	@Override
	public Planwqgzsj loadwqjhkglCount(Planwqgzsj planwqgzsj) {
		return queryOne("loadwqjhkglCount", planwqgzsj);
	}
	@Override
	public Planwqgzsj loadwqgzjhkbyid(String id) {
		return queryOne("loadwqgzjhkbyid", id);
	}
	@Override
	public Planwqgzsj loadwqgzsckbyid(String id) {
		return queryOne("loadwqgzsckbyid", id);
	}
	@Override
	public Planwqgzsj loadwqgzxmkbyid(String id) {
		return queryOne("loadwqgzxmkbyid", id);
	}

}
