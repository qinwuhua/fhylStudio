package com.hdsx.jxzhpt.gcbb.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcbb.server.DbbbServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
@Service
public class DbbbServerImpl extends BaseOperate implements DbbbServer{

	public DbbbServerImpl() {
		super("dbbb", "jdbc");
	}

	@Override
	public List<Jckwqgz> selectWqjc(Jckwqgz wqgz) {
		return queryList("selectWqjc", wqgz);
	}

	@Override
	public int selectWqjcCount(Jckwqgz wqgz) {
		return queryOne("selectWqjcCount", wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_wqjc(Jckwqgz wqgz) {
		return queryList("exportExcel_wqjc",wqgz);
	}

	@Override
	public List<Sckwqgz> selectWqsc(Jckwqgz wqgz) {
		return queryList("selectWqsc", wqgz);
	}

	@Override
	public int selectWqscCount(Jckwqgz wqgz) {
		return queryOne("selectWqscCount", wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_wqsc(Jckwqgz wqgz) {
		return queryList("exportExcel_wqsc",wqgz);
	}

	@Override
	public List<Plan_wqgz> selectWqjh(Jckwqgz wqgz) {
		return queryList("selectWqjh", wqgz);
	}

	@Override
	public int selectWqjhCount(Jckwqgz wqgz) {
		return queryOne("selectWqjhCount", wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_wqjh(Jckwqgz wqgz) {
		return queryList("exportExcel_wqjh",wqgz);
	}

}
