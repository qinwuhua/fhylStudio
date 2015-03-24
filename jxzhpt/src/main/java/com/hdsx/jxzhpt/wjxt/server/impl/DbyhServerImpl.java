package com.hdsx.jxzhpt.wjxt.server.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;
import com.hdsx.jxzhpt.wjxt.server.DbyhServer;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.wjxt.server.ZdxxServer;
import com.hdsx.jxzhpt.wjxt.server.ZhqkServer;

@Service
public class DbyhServerImpl extends BaseOperate implements DbyhServer {

	public DbyhServerImpl() {
		super("dbyh", "odbc");
	}

	@Override
	public List<Map<String, Object>> selectList1() {
		// TODO Auto-generated method stub
		return queryList("selectList1");
	}

	@Override
	public List<Map<String, Object>> selectList2(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectList2",zdxx);
	}

	@Override
	public List<Zdxx> selectList3(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectList3",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectList4(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectList4",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectList5(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectList5",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectxhbList1() {
		// TODO Auto-generated method stub
		return queryList("selectxhbList1");
	}

	@Override
	public List<Map<String, Object>> selectxhbList4(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectxhbList4",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectxhbList5(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectxhbList5",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectfxbList1(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectfxbList1",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectPdbList(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectPdbList",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectYlbList(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectYlbList",zdxx);
	}
	
}
