package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckzhfzServer;
@Service
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
