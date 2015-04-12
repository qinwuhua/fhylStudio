package com.hdsx.jxzhpt.jhgl.server.impl;
import java.util.List;

import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.PlanZjqf;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjqfServer;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_zjqfServerImpl extends BaseOperate implements Plan_zjqfServer {
	public Plan_zjqfServerImpl() {
		super("plan_zjqf", "jdbc");
	}
	@Override
	public List<TreeNode> queryChildGydw(TreeNode xzqh) {
		return queryList("queryChildGydw",xzqh);
	}
	@Override
	public List<PlanZjqf> queryZjqfByGydwbm(PlanZjqf zjqf) {
		return queryList("queryZjqfByGydwbm",zjqf);
	}
	@Override
	public PlanZjqf queryZjqfByZjqf(PlanZjqf zjqf) {
		return queryOne("queryZjqfByZjqf", zjqf);
	}
	@Override
	public boolean insertZjqfBatch(List<PlanZjqf> list) {
		return insertBatch("insertZjqfBatch", list)==list.size();
	}
	@Override
	public boolean updateZjqfBatch(List<PlanZjqf> update) {
		return updateBatch("updateZjqfBatch", update)==update.size();
	}
	@Override
	public List<TreeNode> queryChildXzqh(TreeNode treenode) {
		return queryList("queryChildXzqh",treenode);
	}
}
