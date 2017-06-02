package com.hdsx.jxzhpt.xtgl.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.xtgl.bean.Dzdt;
import com.hdsx.jxzhpt.xtgl.bean.Param;
import com.hdsx.jxzhpt.xtgl.bean.ProgBean;
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

	@Override
	public List<ProgBean> selectExistLxProgramList(ProgBean param) {
		return queryList("selectExistLxProgramList", param);
	}

	@Override
	public List<Param> selectExistQlProgramList(Param param) {
		return queryList("selectExistQlProgramList", param);
	}

	@Override
	public int selectExistLxProgramListCount(Param param) {
		return queryOne("selectExistLxProgramListCount", param);
	}

	@Override
	public int selectExistQlProgramListCount(Param param) {
		return queryOne("selectExistQlProgramListCount", param);
	}
	
	@Override
	public List<ProgBean> selectNewLx(ProgBean param) {
		return queryList("selectNewLx", param);
	}
	
}
