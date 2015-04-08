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
	public PlanZjqf queryZjqfByXzqh(PlanZjqf zjqf) {
		return queryOne("queryZjqfByXzqh", zjqf);
	}

	@Override
	public boolean editZjqfById(PlanZjqf zjqf) {
		return update("editZjqfById", zjqf)>0;
	}

	@Override
	public boolean addZjqf(PlanZjqf zjqf) {
		return insert("addZjqf", zjqf)>0;
	}

	@Override
	public List<TreeNode> queryChildXzqh(TreeNode xzqh) {
		return queryList("queryChildXzqh",xzqh);
	}

	@Override
	public List<TreeNode> queryChildGydw(TreeNode xzqh) {
		return queryList("queryChildGydw",xzqh);
	}

	@Override
	public boolean updateZjqf(PlanZjqf zjqf) {
		return update("updateZjqf", zjqf)>0;
	}
}
