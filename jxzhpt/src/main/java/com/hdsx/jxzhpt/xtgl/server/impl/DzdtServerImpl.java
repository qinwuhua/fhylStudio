package com.hdsx.jxzhpt.xtgl.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.xtgl.bean.Dzdt;
import com.hdsx.jxzhpt.xtgl.bean.Param;
import com.hdsx.jxzhpt.xtgl.server.DzdtServer;
@Service
public class DzdtServerImpl extends BaseOperate  implements DzdtServer{
	public DzdtServerImpl() {
		super("xtgl", "jdbc");
	}

	@Override
	public List<Dzdt> selLines(Dzdt dzdt) {
		return queryList("selLines",dzdt);
	}

	@Override
	public List<Param> xmlxCountTj(Param param) {
		return queryList("xmlxCountTj", param);
	}
	
}
