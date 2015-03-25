package com.hdsx.jxzhpt.gcxmybb.server.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcxmybb.server.GcybbServer;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;

@Service
public class GcybbServerImpl extends BaseOperate implements GcybbServer {

	public GcybbServerImpl() {
		super("gcybb", "jdbc");
	}

	@Override
	public List<Map<String, Object>> getWqgzybb(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getWqgzybb", gcglwqgz);
	}

	@Override
	public List<Map<String, Object>> getWqgzxzqh(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getWqgzxzqh", gcglwqgz);
	}

	@Override
	public List<Map<String, Object>> getWqgznf(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getWqgznf", gcglwqgz);
	}

	@Override
	public Excel_list getwqgzlist1(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("getwqgzlist1", gcglwqgz);
	}

	@Override
	public Excel_list getwqgzlist2(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("getwqgzlist1", gcglwqgz);
	}

	@Override
	public Excel_list getwqgzlist3(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("getwqgzlist3", gcglwqgz);
	}

	@Override
	public List<Excel_list> getwqgzlist4(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getwqgzlist4", gcglwqgz);
	}

	@Override
	public List<Map<String, Object>> getabgcybb(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getabgcybb", gcglabgc);
	}

	@Override
	public Excel_list getabgclist1(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryOne("getabgclist1", gcglabgc);
	}

	@Override
	public List<Map<String, Object>> getAbgcxzqh(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getAbgcxzqh", gcglabgc);
	}

	@Override
	public Excel_list getabgclist3(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryOne("getabgclist1", gcglabgc);
	}

	@Override
	public List<Map<String, Object>> getAbgcnf(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getAbgcnf", gcglabgc);
	}

	@Override
	public Excel_list getabgclist2(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryOne("getabgclist1", gcglabgc);
	}

	@Override
	public List<Excel_list> getabgclist4(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getabgclist4", gcglabgc);
	}

	@Override
	public List<Map<String, Object>> getzhfzybb(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getzhfzybb", gcglzhfz);
	}

	@Override
	public Excel_list getzhfzlist1(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryOne("getzhfzlist1", gcglzhfz);
	}

	@Override
	public List<Map<String, Object>> getZhfzxzqh(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getZhfzxzqh", gcglzhfz);
	}

	@Override
	public List<Map<String, Object>> getZhfznf(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getZhfznf", gcglzhfz);
	}

	@Override
	public List<Excel_list> getzhfzlist2(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getzhfzlist2", gcglzhfz);
	}
	
	
	
}
