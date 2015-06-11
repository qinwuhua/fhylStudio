package com.hdsx.jxzhpt.qqgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
@Service
public class JhshServerImpl extends BaseOperate implements JhshServer {
	public JhshServerImpl(){
		super("jhsh", "jdbc");
	}
	private Map<String, Object> params=new HashMap<String, Object>();
	@Override
	public boolean insertJhshLmsjFromCbsj(String xmbm) {
		String[] split = xmbm.split(",");
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (int j = 0; j < split.length; j++) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(split[j]);
			list.add(obj);
		}
		return insertBatch("insertJhshLmsjFromCbsj", list)==list.size();
	}
	@Override
	public boolean insertJhshLmgzFromCbsj(String xmbm) {
		String[] split = xmbm.split(",");
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (int j = 0; j < split.length; j++) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(split[j]);
			list.add(obj);
		}
		return insertBatch("insertJhshLmgzFromCbsj", list)==list.size();
	}
	@Override
	public boolean insertJhshXjFromCbsj(String xmbm) {
		String[] split = xmbm.split(",");
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (int j = 0; j < split.length; j++) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(split[j]);
			list.add(obj);
		}
		return insertBatch("insertJhshXjFromCbsj", list)==list.size();
	}
	@Override
	public List<Jhsh> queryJhshLmsj(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshLmsj",params);
	}
	@Override
	public int queryJhshCountLmsj(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryJhshCountLmsj", params);
	}
	@Override
	public List<Jhsh> queryJhshLmgz(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshLmgz",params);
	}
	@Override
	public int queryJhshCountLmgz(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryJhshCountLmgz", params);
	}
	@Override
	public List<Jhsh> queryJhshXj(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshXj",params);
	}
	@Override
	public int queryJhshCountXj(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryJhshCountXj", params);
	}
	@Override
	public boolean updateJhshxxLmsj(List<Jhsh> jhshs) {
		return updateBatch("updateJhshxxLmsj", jhshs)==jhshs.size();
	}
	@Override
	public boolean updateJhshxxLmgz(List<Jhsh> list) {
		return updateBatch("updateJhshxxLmgz", list)==list.size();
	}
	@Override
	public boolean updateJhshxxXj(List<Jhsh> list) {
		return updateBatch("updateJhshxxXj", list)==list.size();
	}
	@Override
	public Lxsh queryLxshLmsjByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryLxshLmsjByXmbm", params);
	}
	@Override
	public Lxsh queryLxshLmgzByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryLxshLmgzByXmbm", params);
	}
	@Override
	public Lxsh queryLxshXjByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryLxshXjByXmbm", params);
	}
	@Override
	public Jhsh queryJhshxxLmsjByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryJhshxxLmsjByXmbm", params);
	}
	@Override
	public Jhsh queryJhshxxLmgzByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryJhshxxLmgzByXmbm", params);
	}
	@Override
	public Jhsh queryJhshxxXjByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryJhshxxXjByXmbm", params);
	}

}
