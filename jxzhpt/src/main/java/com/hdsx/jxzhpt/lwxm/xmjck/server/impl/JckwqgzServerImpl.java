package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzServer;
@Service
public class JckwqgzServerImpl extends BaseOperate implements JckwqgzServer {

	public JckwqgzServerImpl() {
		super("jckwqgz", "jdbc");
	}

	@Override
	public boolean insertWqgz(Jckwqgz wqgz) {
		if(insert("insertJckwqgz",wqgz)>0) return true;
		else return false;
	}

}
