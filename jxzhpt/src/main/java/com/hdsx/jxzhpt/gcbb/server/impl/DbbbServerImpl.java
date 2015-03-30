package com.hdsx.jxzhpt.gcbb.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcbb.server.DbbbServer;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
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

	@Override
	public List<SjbbMessage> exportExcel_abjh(Jckwqgz wqgz) {
		return queryList("exportExcel_abjh",wqgz);
	}

	@Override
	public List<Jckzhfz> selectZhjc(Jckwqgz wqgz) {
		return queryList("selectZhjc",wqgz);
	}

	@Override
	public int selectZhjcCount(Jckwqgz wqgz) {
		return queryOne("selectZhjcCount",wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_zhjc(Jckwqgz wqgz) {
		return queryList("exportExcel_zhjc",wqgz);
	}

	@Override
	public List<Sckzhfz> selectZhsc(Jckwqgz wqgz) {
		return queryList("selectZhsc",wqgz);
	}

	@Override
	public int selectZhscCount(Jckwqgz wqgz) {
		return queryOne("selectZhscCount",wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_zhsc(Jckwqgz wqgz) {
		return queryList("exportExcel_zhsc",wqgz);
	}

	@Override
	public List<Plan_zhfz> selectZhjh(Jckwqgz wqgz) {
		return queryList("selectZhjh",wqgz);
	}

	@Override
	public int selectZhjhCount(Jckwqgz wqgz) {
		return queryOne("selectZhjhCount",wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_zhjh(Jckwqgz wqgz) {
		return queryList("exportExcel_zhjh",wqgz);
	}

	@Override
	public List<Plan_wqgz> selectWqkg(Jckwqgz wqgz) {
		return queryList("selectWqkg",wqgz);
	}

	@Override
	public int selectWqkgCount(Jckwqgz wqgz) {
		return queryOne("selectWqkgCount",wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_wqkg(Jckwqgz wqgz) {
		return queryList("exportExcel_wqkg",wqgz);
	}

	@Override
	public List<Plan_abgc> selectAbkg(Jckwqgz wqgz) {
		return queryList("selectAbkg",wqgz);
	}

	@Override
	public int selectAbkgCount(Jckwqgz wqgz) {
		return queryOne("selectAbkgCount",wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_abkg(Jckwqgz wqgz) {
		return queryList("exportExcel_abkg",wqgz);
	}

	@Override
	public List<Plan_zhfz> selectZhkg(Jckwqgz wqgz) {
		return queryList("selectZhkg",wqgz);
	}

	@Override
	public int selectZhkgCount(Jckwqgz wqgz) {
		return queryOne("selectZhkgCount",wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_zhkg(Jckwqgz wqgz) {
		return queryList("exportExcel_zhkg",wqgz);
	}

	@Override
	public List<Gcglwqgz> selectWqjz(Jckwqgz wqgz) {
		return queryList("selectWqjz",wqgz);
	}

	@Override
	public int selectWqjzCount(Jckwqgz wqgz) {
		return queryOne("selectWqjzCount",wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_wqjz(Jckwqgz wqgz) {
		return queryList("exportExcel_wqjz",wqgz);
	}

	@Override
	public List<Gcglabgc> selectAbjz(Jckwqgz wqgz) {
		return queryList("selectAbjz",wqgz);
	}

	@Override
	public int selectAbjzCount(Jckwqgz wqgz) {
		return queryOne("selectAbjzCount",wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_abjz(Jckwqgz wqgz) {
		return queryList("exportExcel_abjz",wqgz);
	}

	@Override
	public List<Gcglzhfz> selectZhjz(Jckwqgz wqgz) {
		return queryList("selectZhjz",wqgz);
	}

	@Override
	public int selectZhjzCount(Jckwqgz wqgz) {
		return queryOne("selectZhjzCount",wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_zhjz(Jckwqgz wqgz) {
		return queryList("exportExcel_zhjz",wqgz);
	}

}
