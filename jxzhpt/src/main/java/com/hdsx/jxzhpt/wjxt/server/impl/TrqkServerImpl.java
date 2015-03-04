package com.hdsx.jxzhpt.wjxt.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;

@Service
public class TrqkServerImpl extends BaseOperate implements TrqkServer {

	public TrqkServerImpl() {
		super("trqk", "jdbc");
	}

	
}
