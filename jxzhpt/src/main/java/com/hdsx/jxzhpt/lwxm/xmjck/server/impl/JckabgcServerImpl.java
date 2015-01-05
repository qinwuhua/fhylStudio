package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckabgcServer;

public class JckabgcServerImpl extends BaseOperate implements JckabgcServer {

	public JckabgcServerImpl() {
		super("jckabgc", "jdbc");
	}

	@Override
	public boolean insertAbgc(Jckabgc abgc) {
		if(insert("insertAbgc",abgc)>0) return true;
		else return false;
	}

}
