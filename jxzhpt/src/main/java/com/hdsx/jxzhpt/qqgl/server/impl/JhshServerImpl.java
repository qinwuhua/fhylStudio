package com.hdsx.jxzhpt.qqgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh2;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
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
	@Override
	public List<Jhsh> queryJhshYhdzx(Jhsh jhsh,int page,int rows) {
		params.put("jhsh2", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshYhdzx",params);
	}
	@Override
	public int queryJhshYhdzxCount(Jhsh jhsh) {
		params.put("jhsh2", jhsh);
		return queryOne("queryJhshYhdzxCount", params);
	}
	@Override
	public boolean updateJhshxxYhdzx(Jhsh jhsh) {
		return update("updateJhshxxYhdzx",jhsh)>0;
	}
	@Override
	public boolean updateJhshxxSh(Jhsh jhsh) {
		return update("updateJhshxxSh",jhsh)>0;
	}
	@Override
	public Jhsh queryJhshxxYhdzxByXmbm(Jhsh jhsh) {
		return queryOne("queryJhshxxYhdzxByXmbm",jhsh);
	}
	@Override
	public Jhsh queryJhshxxShByXmbm(Jhsh jhsh) {
		return queryOne("queryJhshxxShByXmbm",jhsh);
	}
	@Override
	public List<Jhsh> queryJhshSh(Jhsh jhsh, int page, int rows) {
		params.put("jhsh2", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshSh",params);
	}
	@Override
	public int queryJhshShCount(Jhsh jhsh) {
		params.put("jhsh2", jhsh);
		return queryOne("queryJhshShCount",params);
	}
	@Override
	public boolean insertJhshYhdzxFromCbsj(String xmbm) {
		Cbsj cbsj=new Cbsj();
		cbsj.setXmbm(xmbm);
		String[] split = xmbm.split(",");
		return insert("insertJhshYhdzxFromCbsj", cbsj)==split.length;
	}
	@Override
	public boolean insertJhshShFromCbsj(String xmbm) {
		Cbsj cbsj=new Cbsj();
		cbsj.setXmbm(xmbm);
		String[] split = xmbm.split(",");
		return insert("insertJhshShFromCbsj", cbsj)==split.length;
	}
	@Override
	public boolean updateLx(Lx lx) {
		return update("updateLx",lx)>0;
	}
	@Override
	public boolean insertLx(Lx lx) {
		return insert("insertLx",lx)>0;
	}
	@Override
	public boolean deleteLx(Lx lx) {
		return delete("deleteLx",lx)>0;
	}
	@Override
	public List<Lx> selectlxList(Lx lx) {
		return queryList("selectlxList",lx);
	}
	@Override
	public List<Lx> selectlxbgList(Lx lx) {
		return queryList("selectlxbgList",lx);
	}
	@Override
	public boolean insertLxJdbs(Lx lx) {
		return insert("insertLxJdbs",lx)>0;
	}
	@Override
	public Lx queryHaveLx(Lx lx) {
		return queryOne("queryHaveLx", lx);
	}
	@Override
	public List<Lx> queryLsxx(Jhsh jhsh) {
		Lx lx=new Lx();
		lx.setXmid(jhsh.getXmbm());
		//返回结果
		List<Lx> result =new ArrayList<Lx>();
		//查询此计划所有的路线信息
		List<Lx> lxList=queryList("queryLxMaxJdbs",lx);
		for (Lx item : lxList) {
			queryLsjlList(result, item);
		}
		return result;
	}
	
	@Override
	public List<Lx> queryLsxx1(Jhsh jhsh) {
		Lx lx=new Lx();
		lx.setXmid(jhsh.getXmbm());
		//返回结果
		List<Lx> result =new ArrayList<Lx>();
		//查询此计划所有的路线信息
		List<Lx> lxList=queryList("queryLxMaxJdbs1",lx);
		for (Lx item : lxList) {
			queryLsjlList(result, item);
		}
		return result;
	}
	
	@Override
	public List<Lx> queryLsxx2(Lx lx) {
		List<Lx> result=new ArrayList<Lx>();
		queryLsjlList(result, lx);
		return result;
	}
	/**
	 * 根据路线和原路线查询历史记录
	 * @param result 返回结果
	 * @param item 路线
	 */
	private void queryLsjlList(List<Lx> result, Lx item) {
		//查询原路线信息
		List<Lx> ylx = queryList("queryYLx",item);
		params.put("lx", item);
		params.put("ylx", ylx);
		List<Lx> queryList = queryList("queryLsjlList",params);
		result.addAll(queryList);
	}
	@Override
	public Kxxyj queryLmsjKxxyjByXmbm(Jhsh jhsh) {
		return queryOne("queryLmsjKxxyjByXmbm",jhsh);
	}
	@Override
	public Kxxyj queryLmgzKxxyjByXmbm(Jhsh jhsh) {
		return queryOne("queryLmgzKxxyjByXmbm",jhsh);
	}
	@Override
	public Kxxyj queryXjKxxyjByXmbm(Jhsh jhsh) {
		return queryOne("queryXjKxxyjByXmbm",jhsh);
	}
	@Override
	public boolean updateLx(List<Lx> lx) {
		return updateBatch("updateLx", lx)==lx.size();
	}
	@Override
	public boolean updateJhshxxYhdzx(List<Jhsh> readerExcel) {
		return updateBatch("updateJhshxxYhdzx",readerExcel)==readerExcel.size();
	}
	@Override
	public boolean updateJhshxxSh(List<Jhsh> readerExcel) {
		return updateBatch("updateJhshxxSh",readerExcel)==readerExcel.size();
	}
	@Override
	public Lx queryJsdjAndLcByStartAndEnd(Lx lx) {
		return queryOne("queryJsdjAndLcByStartAndEnd",lx);
	}
	@Override
	public List<Map<String, String>> zdyQueryLmsj(String filed,Jhsh jhsh,int page,int rows) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		params.put("page",page);
		params.put("rows", rows);
		return queryList("zdyQueryLmsj",params);
	}
	@Override
	public List<Map<String, String>> zdyQueryLmgz(String filed, Jhsh jhsh,int page,int rows) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		params.put("page",page);
		params.put("rows", rows);
		return queryList("zdyQueryLmgz",params);
	}
	@Override
	public List<Map<String, String>> zdyQueryXj(String filed, Jhsh jhsh,int page,int rows) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		params.put("page",page);
		params.put("rows", rows);
		return queryList("zdyQueryXj",params);
	}
	@Override
	public List<Map<String, String>> zdyQueryYhdzx(String filed, Jhsh jhsh,int page,int rows) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		params.put("page",page);
		params.put("rows", rows);
		return queryList("zdyQueryYhdzx",params);
	}
	@Override
	public List<Map<String, String>> zdyQuerySh(String filed, Jhsh jhsh,int page,int rows) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		params.put("page",page);
		params.put("rows", rows);
		return queryList("zdyQuerySh",params);
	}
	@Override
	public int zdyQueryLmsjTotal(String filed, Jhsh jhsh) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		return queryOne("zdyQueryLmsjTotal",params);
	}
	@Override
	public int zdyQueryLmgzTotal(String filed, Jhsh jhsh) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		return queryOne("zdyQueryLmgzTotal",params);
	}
	@Override
	public int zdyQueryXjTotal(String filed, Jhsh jhsh) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		return queryOne("zdyQueryXjTotal",params);
	}
	@Override
	public int zdyQueryYhdzxTotal(String filed, Jhsh jhsh) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		return queryOne("zdyQueryYhdzxTotal",params);
	}
	@Override
	public int zdyQueryShTotal(String filed, Jhsh jhsh) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		return queryOne("zdyQueryShTotal",params);
	}
	@Override
	public Map<String, String> queryJhshLjLmsj(Jhsh jhsh) {
		return queryOne("queryJhshLjLmsj",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjLmgz(Jhsh jhsh) {
		return queryOne("queryJhshLjLmgz",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjXj(Jhsh jhsh) {
		return queryOne("queryJhshLjXj",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjYhdzx(Jhsh jhsh) {
		return queryOne("queryJhshLjYhdzx",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjSh(Jhsh jhsh) {
		return queryOne("queryJhshLjSh",jhsh);
	}
	
	@Override
	public List<Jhsh> queryJhshYhzx(Jhsh jhsh,int page,int rows) {
		params.put("jhsh2", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshYhzx",params);
	}
	
	@Override
	public int queryJhshYhzxCount(Jhsh jhsh) {
		params.put("jhsh2", jhsh);
		return queryOne("queryJhshYhzxCount", params);
	}
	
	@Override
	public Map<String, String> queryJhshLjYhzx(Jhsh jhsh) {
		return queryOne("queryJhshLjYhzx",jhsh);
	}
	
	@Override
	public Jhsh queryJhshxxYhzxByXmbm(Jhsh jhsh) {
		return queryOne("queryJhshxxYhzxByXmbm",jhsh);
	}
	
	@Override
	public boolean updateJhshYhzx(Jhsh jhsh) {
		return update("updateJhshYhzx",jhsh)>0;
	}
	
}
