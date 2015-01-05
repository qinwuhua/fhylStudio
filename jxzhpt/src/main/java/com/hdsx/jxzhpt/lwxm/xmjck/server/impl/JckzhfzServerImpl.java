package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckzhfzServer;

public class JckzhfzServerImpl extends BaseOperate implements JckzhfzServer {

	public JckzhfzServerImpl() {
		super("jckzhfz", "jdbc");
	}

	@Override
	public boolean insertZhfz(Jckzhfz zhfz) {
		if(insert("insertJckzhfz",zhfz)>0) return true;
		else return false;
	}

}
