package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.server.AbgcServer;

public class AbgcServerImpl extends BaseOperate implements AbgcServer {

	public AbgcServerImpl() {
		super("jckabgc", "jdbc");
	}

	@Override
	public boolean insertAbgc(Jckabgc abgc) {
		if(insert("insertAbgc",abgc)>0) return true;
		else return false;
	}

}
