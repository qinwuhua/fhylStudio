package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Abgc;
import com.hdsx.jxzhpt.lwxm.xmjck.server.AbgcServer;

public class AbgcServerImpl extends BaseOperate implements AbgcServer {

	public AbgcServerImpl() {
		super("abgc", "jdbc");
	}

	@Override
	public boolean insertAbgc(Abgc abgc) {
		if(insert("insertAbgc",abgc)>0) return true;
		else return false;
	}

}
