package com.hdsx.jxzhpt.gcbb.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcbb.server.DbbbServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
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

	@Override
	public List<Jckabgc> selectAbjc(Jckwqgz wqgz) {
		return queryList("selectAbjc",wqgz);
	}

	@Override
	public int selectAbjcCount(Jckwqgz wqgz) {
		return queryOne("selectAbjcCount",wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_abjc(Jckwqgz wqgz) {
		return queryList("exportExcel_abjc",wqgz);
	}

	@Override
	public List<Sckabgc> selectAbsc(Jckwqgz wqgz) {
		return queryList("selectAbsc",wqgz);
	}

	@Override
	public int selectAbscCount(Jckwqgz wqgz) {
		return queryOne("selectAbscCount",wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_absc(Jckwqgz wqgz) {
		return queryList("exportExcel_absc",wqgz);
	}

	@Override
	public List<Plan_abgc> selectAbjh(Jckwqgz wqgz) {
		return queryList("selectAbjh",wqgz);
	}

	@Override
	public int selectAbjhCount(Jckwqgz wqgz) {
		return queryOne("selectAbjhCount",wqgz);
	}

}
