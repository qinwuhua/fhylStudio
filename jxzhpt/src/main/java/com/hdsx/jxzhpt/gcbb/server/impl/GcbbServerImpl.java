package com.hdsx.jxzhpt.gcbb.server.impl;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcbb.server.GcbbServer;

public class GcbbServerImpl extends BaseOperate implements GcbbServer{

	public GcbbServerImpl(Object nameSpace, String[] environmentId) {
		super("gcbb", "jdbc");
	}

}
