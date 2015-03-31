package com.hdsx.jxzhpt.gcxmybb.server.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcxmybb.bean.Xmbb;
import com.hdsx.jxzhpt.gcxmybb.server.GcybbServer;
import com.hdsx.jxzhpt.gcxmybb.server.XmbbServer;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;

@Service
public class XmbbServerImpl extends BaseOperate implements XmbbServer {

	public XmbbServerImpl() {
		super("xmbb", "jdbc");
	}

	@Override
	public List<Map<String, Object>> getptgxXzqh1(Xmbb xmbb) {
		// TODO Auto-generated method stub
		return queryList("getptgxXzqh1", xmbb);
	}

	@Override
	public List<Map<String, Object>> getptgxXzqh2(Xmbb xmbb) {
		// TODO Auto-generated method stub
		return queryList("getptgxXzqh2", xmbb);
	}

	@Override
	public Excel_list selectEx1(Xmbb xmbb) {
		// TODO Auto-generated method stub
		return queryOne("selectEx1", xmbb);
	}

	@Override
	public List<Excel_list> selectelist1(Xmbb xmbb) {
		// TODO Auto-generated method stub
		return queryList("selectelist1",xmbb);
	}

	@Override
	public Excel_list selectEx2(Xmbb xmbb) {
		// TODO Auto-generated method stub
		return queryOne("selectEx2", xmbb);
	}

	@Override
	public List<Excel_list> selectelist2(Xmbb xmbb) {
		// TODO Auto-generated method stub
		return queryList("selectelist2",xmbb);
	}

	@Override
	public List<Map<String, Object>> getYhxzqh(Xmbb xmbb) {
		
		return queryList("getYhxzqh", xmbb);
	}

	@Override
	public Excel_list getYhHj(Xmbb xmbb) {
		// TODO Auto-generated method stub
		return queryOne("getYhHj", xmbb);
	}

	@Override
	public List<Excel_list> getyhlist(Xmbb xmbb) {
		// TODO Auto-generated method stub
		return queryList("getyhlist", xmbb);
	}

	@Override
	public Excel_list getYhHj1(Xmbb xmbb) {
		// TODO Auto-generated method stub
		return queryOne("getYhHj1", xmbb);
	}

	@Override
	public List<Excel_list> getyhlist1(Xmbb xmbb) {
		// TODO Auto-generated method stub
		return queryList("getyhlist1", xmbb);
	}

	
}
