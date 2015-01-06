package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckabgcServer;
@Service
public class JckabgcServerImpl extends BaseOperate implements JckabgcServer {

	public JckabgcServerImpl() {
		super("jckabgc", "jdbc");
	}

	@Override
	public boolean insertAbgc(Jckabgc jckabgc) {
		if(insert("insertJckabgc",jckabgc)>0) return true;
		else return false;
	}

}
