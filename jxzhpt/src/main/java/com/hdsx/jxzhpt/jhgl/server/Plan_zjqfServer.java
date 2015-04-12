package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.PlanZjqf;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_zjqfServer {

	List<TreeNode> queryChildGydw(TreeNode xzqh);

	List<PlanZjqf> queryZjqfByGydwbm(PlanZjqf zjqf);

	PlanZjqf queryZjqfByZjqf(PlanZjqf zjqf);
	
	boolean insertZjqfBatch(List<PlanZjqf> zjqf);

	boolean updateZjqfBatch(List<PlanZjqf> update);

	List<TreeNode> queryChildXzqh(TreeNode treenode);
}
