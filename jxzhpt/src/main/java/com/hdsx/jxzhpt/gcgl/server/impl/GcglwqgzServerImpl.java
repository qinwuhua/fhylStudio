package com.hdsx.jxzhpt.gcgl.server.impl;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
@Service
public class GcglwqgzServerImpl extends BaseOperate implements GcglwqgzServer {

	public GcglwqgzServerImpl() {
		super("gcgl", "jdbc");
	}

}
