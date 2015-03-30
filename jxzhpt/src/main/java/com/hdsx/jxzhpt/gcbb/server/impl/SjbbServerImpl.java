package com.hdsx.jxzhpt.gcbb.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcbb.server.SjbbServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
@Service
public class SjbbServerImpl extends BaseOperate implements SjbbServer{
	public SjbbServerImpl() {
		super("gcbb", "jdbc");
	}

	@Override
	public List<SjbbMessage> getLwjgjsgzb(SjbbMessage sjbb) {
		return queryList("getLwjgjsgzb", sjbb);
	}
	
}
