package com.hdsx.jxzhpt.qqgl.server.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.weaver.ast.Var;
import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh2;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.ibm.icu.math.BigDecimal;
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
	public List<Jhsh> queryJhshLmsj1(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshLmsj1",params);
	}
	@Override
	public int queryJhshCountLmsj(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryJhshCountLmsj", params);
	}
	@Override
	public int queryJhshCountLmsj1(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryJhshCountLmsj1", params);
	}
	@Override
	public List<Jhsh> queryJhshLmgz(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshLmgz",params);
	}
	@Override
	public List<Jhsh> queryJhshLmgz1(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshLmgz1",params);
	}
	@Override
	public int queryJhshCountLmgz(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryJhshCountLmgz", params);
	}
	@Override
	public int queryJhshCountLmgz1(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryJhshCountLmgz1", params);
	}
	@Override
	public List<Jhsh> queryJhshXj(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshXj",params);
	}
	@Override
	public List<Jhsh> queryJhshXj1(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshXj1",params);
	}
	@Override
	public int queryJhshCountXj(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryJhshCountXj", params);
	}
	@Override
	public int queryJhshCountXj1(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryJhshCountXj1", params);
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
	public List<Jhsh> queryJhshYhdzx(Jhsh jhsh) {
		return queryList("queryJhshYhdzx",jhsh);
	}
	@Override
	public List<Jhsh> queryJhshYhdzx1(Jhsh jhsh,int page,int rows) {
		params.put("jhsh2", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshYhdzx1",params);
	}
	@Override
	public int queryJhshYhdzxCount(Jhsh jhsh) {
		return queryOne("queryJhshYhdzxCount", jhsh);
	}
	@Override
	public int queryJhshYhdzxCount1(Jhsh jhsh) {
		params.put("jhsh2", jhsh);
		return queryOne("queryJhshYhdzxCount1", params);
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
	public List<Jhsh> queryJhshSh(Jhsh jhsh) {
		return queryList("queryJhshSh",jhsh);
	}
	@Override
	public List<Jhsh> queryJhshSh1(Jhsh jhsh, int page, int rows) {
		params.put("jhsh2", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshSh1",params);
	}
	@Override
	public int queryJhshShCount(Jhsh jhsh) {
		return queryOne("queryJhshShCount",jhsh);
	}
	@Override
	public int queryJhshShCount1(Jhsh jhsh) {
		params.put("jhsh2", jhsh);
		return queryOne("queryJhshShCount1",params);
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
	public List<Lx> querywnxx(Jhsh jhsh) {
		Lx lx=new Lx();
		lx.setXmid(jhsh.getXmbm());
		//返回结果
		List<Lx> result =new ArrayList<Lx>();
		//查询此计划所有的路线信息
		List<Lx> lxList=queryList("queryLxMaxJdbs",lx);
		for (Lx item : lxList) {
			querywnxxList(result, item);
		}
		return result;
	}
	
	
	private void querywnxxList(List<Lx> result, Lx item) {
		//查询原路线信息
		List<Lx> ylx = queryList("queryYLx",item);
		params.put("lx", item);
		params.put("ylx", ylx);
		List<Lx> queryList = queryList("queryLsjlListwnxmk",params);
		boolean flag=true;
		if(result.size()>0&&queryList.size()>0){
			for (Lx l1 : queryList) {
				flag=true;
				for (Lx l2 : result) {
					if(l1.getXmid().equals(l2.getXmid()))
						flag=false;
				}
				if(flag)
					result.add(l1);
			}
		}
		if(result.size()==0){
			for (int i = 0; i < queryList.size(); i++) {
				flag = true;
				for (int j = i+1; j < queryList.size(); j++) {
					if(queryList.get(i).getXmid().equals(queryList.get(j).getXmid())){
						flag = false;
					}
				}
				if (flag){
					result.add(queryList.get(i));
				}
			}
		}
		
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
		boolean flag=true;
		if(result.size()>0&&queryList.size()>0){
			for (Lx l1 : queryList) {
				flag=true;
				for (Lx l2 : result) {
					if(l1.getXmid().equals(l2.getXmid()))
						flag=false;
				}
				if(flag)
					result.add(l1);
			}
		}
		if(result.size()==0){
			for (int i = 0; i < queryList.size(); i++) {
				flag = true;
				for (int j = i+1; j < queryList.size(); j++) {
					if(queryList.get(i).getXmid().equals(queryList.get(j).getXmid())){
						flag = false;
					}
				}
				if (flag){
					result.add(queryList.get(i));
				}
			}
		}
		
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
	public Kxxyj queryShKxxyjByXmbm(Jhsh jhsh) {
		return queryOne("queryShKxxyjByXmbm",jhsh);
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
	public Map<String, String> queryJhshLjLmsj1(Jhsh jhsh) {
		return queryOne("queryJhshLjLmsj1",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjLmgz(Jhsh jhsh) {
		return queryOne("queryJhshLjLmgz",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjLmgz1(Jhsh jhsh) {
		return queryOne("queryJhshLjLmgz1",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjXj(Jhsh jhsh) {
		return queryOne("queryJhshLjXj",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjXj1(Jhsh jhsh) {
		return queryOne("queryJhshLjXj1",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjYhdzx(Jhsh jhsh) {
		return queryOne("queryJhshLjYhdzx",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjYhdzx1(Jhsh jhsh) {
		return queryOne("queryJhshLjYhdzx1",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjSh(Jhsh jhsh) {
		return queryOne("queryJhshLjSh",jhsh);
	}
	@Override
	public Map<String, String> queryJhshLjSh1(Jhsh jhsh) {
		return queryOne("queryJhshLjSh1",jhsh);
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
	@Override
	public List<Jhsh> queryGsdgz(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryGsdgz",params);
	}
	@Override
	public int queryGsdgzCount(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryGsdgzCount", params);
	}
	@Override
	public List<Jhsh> queryGsdgzxd(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryGsdgzxd",params);
	}
	@Override
	public int queryGsdgzxdCount(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryGsdgzxdCount", params);
	}
	
	@Override
	public Map<String, String> queryJhshLjgsdgz(Jhsh jhsh) {
		return queryOne("queryJhshLjgsdgz",jhsh);
	}
	
	@Override
	public Map<String, String> queryJhshLjgsdxd(Jhsh jhsh) {
		return queryOne("queryJhshLjgsdxd",jhsh);
	}
	@Override
	public List<Jhsh> queryGsdgzxdbz(Jhsh jhsh) {
		return queryList("queryGsdgzxdbz", jhsh);
	}
	@Override
	public boolean planxdAll(List<Jhsh> list) {
		return insertBatch("planxdAll", list)==list.size();
	}
	@Override
	public List<Jhsh> queryshxd(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryshxd",params);
	}
	@Override
	public int queryshxdCount(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryshxdCount", params);
	}
	@Override
	public Map<String, String> queryJhbzshLj(Jhsh jhsh) {
		return queryOne("queryJhbzshLj",jhsh);
	}
	@Override
	public List<Jhsh> queryshxdbz(Jhsh jhsh) {
		return queryList("queryshxdbz", jhsh);
	}
	@Override
	public List<Jhsh> queryjhxdyh(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryjhxdyh",params);
	}
	@Override
	public int queryjhxdyhCount(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryjhxdyhCount", params);
	}
	@Override
	public Map<String, String> queryJhbzyhLj(Jhsh jhsh) {
		return queryOne("queryJhbzyhLj",jhsh);
	}
	@Override
	public List<Jhsh> queryyhxdbz(Jhsh jhsh) {
		return queryList("queryyhxdbz", jhsh);
	}
	@Override
	public boolean planxdhzadd(List<Jhsh> list) {
		delete("planxdhzdelete");
		try {
			BigDecimal ztz=new BigDecimal("0");
			BigDecimal rys=new BigDecimal("0");
			BigDecimal cgs=new BigDecimal("0");
			BigDecimal gz=new BigDecimal("0");
			BigDecimal sz=new BigDecimal("0");
			BigDecimal zq=new BigDecimal("0");
			BigDecimal dk=new BigDecimal("0");
			BigDecimal jl=new BigDecimal("0");
			BigDecimal qt=new BigDecimal("0");
			
			
			//bzpfztz,bzrys,bzcgs,bzgz,bzsz,bzzq,bzdk,bzjl,bzqt
			for (Jhsh jhsh : list) {
				System.out.println(jhsh.getBzpfztz()+"  ztz");
				System.out.println(jhsh.getBzrys()+"  rys");
				System.out.println(jhsh.getBzcgs()+"cgs");
				System.out.println(jhsh.getBzgz()+"  gz");
				System.out.println(jhsh.getBzsz()+"  sz");
				System.out.println(jhsh.getBzzq()+"  zq");
				System.out.println(jhsh.getBzdk()+"  dk");
				System.out.println(jhsh.getBzjl()+"  jl");
				System.out.println(jhsh.getBzqt()+"  qt");
				System.out.println(!"".equals(jhsh.getBzcgs()));
				ztz=jhsh.getBzpfztz()!=null && !"".equals(jhsh.getBzpfztz()) ? new BigDecimal(jhsh.getBzpfztz()):new BigDecimal("0");
				rys=jhsh.getBzrys()!=null && !"".equals(jhsh.getBzrys()) ? new BigDecimal(jhsh.getBzrys()):new BigDecimal("0");
				cgs=jhsh.getBzcgs()!=null && !"".equals(jhsh.getBzcgs()) ? new BigDecimal(jhsh.getBzcgs()):new BigDecimal("0");
				gz=jhsh.getBzgz()!=null && !"".equals(jhsh.getBzgz()) ? new BigDecimal(jhsh.getBzgz()):new BigDecimal("0");
				sz=jhsh.getBzsz()!=null && !"".equals(jhsh.getBzsz()) ? new BigDecimal(jhsh.getBzsz()):new BigDecimal("0");
				zq=jhsh.getBzzq()!=null && !"".equals(jhsh.getBzzq()) ? new BigDecimal(jhsh.getBzzq()):new BigDecimal("0");
				dk=jhsh.getBzdk()!=null && !"".equals(jhsh.getBzdk()) ? new BigDecimal(jhsh.getBzdk()):new BigDecimal("0");
				jl=jhsh.getBzjl()!=null && !"".equals(jhsh.getBzjl()) ? new BigDecimal(jhsh.getBzjl()):new BigDecimal("0");
				qt=jhsh.getBzqt()!=null && !"".equals(jhsh.getBzqt()) ? new BigDecimal(jhsh.getBzqt()):new BigDecimal("0");
				jhsh.setZtz(ztz.add(rys).add(gz).add(sz).add(cgs).add(zq).add(dk).add(jl).add(qt).toString());
			}
			
			return insertBatch("planxdhzadd", list)==list.size();
		} catch (Exception e) {
			e.printStackTrace();
				return false;
		}
	}
	@Override
	public List<Map<String, String>> getbzyhhzb() {
		return queryList("getbzyhhzb");
	}
	@Override
	public boolean plansbgj(Jhsh jhsh) {
		return update("plansbgj", jhsh)==1;
	}
	@Override
	public boolean plansblm(Jhsh jhsh) {
		return update("plansblm", jhsh)==1;
	}
	@Override
	public boolean plansbxj(Jhsh jhsh) {
		return update("plansbxj", jhsh)==1;
	}
	@Override
	public boolean plansbyh(Jhsh jhsh) {
		return update("plansbyh", jhsh)==1;
	}
	@Override
	public boolean plansbsh(Jhsh jhsh) {
		return update("plansbsh", jhsh)==1;
	}
	@Override
	public boolean planshgj(Jhsh jhsh) {
		return update("planshgj", jhsh)==1;
	}
	@Override
	public boolean planshlm(Jhsh jhsh) {
		return update("planshlm", jhsh)==1;
	}
	@Override
	public boolean planshxj(Jhsh jhsh) {
		return update("planshxj", jhsh)==1;
	}
	@Override
	public boolean planshyh(Jhsh jhsh) {
		return update("planshyh", jhsh)==1;
	}
	@Override
	public boolean planshsh(Jhsh jhsh) {
		return update("planshsh", jhsh)==1;
	}
	@Override
	public Collection<? extends Object> queryGsdgz_dc(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryGsdgz_dc",params);
	}
	@Override
	public Collection<? extends Object> queryJhshSh_dc(Jhsh jhsh) {
		return queryList("queryJhshSh_dc",jhsh);
	}
	@Override
	public Collection<? extends Object> queryJhshYhdzx_dc(Jhsh jhsh) {
		return queryList("queryJhshYhdzx_dc",jhsh);
	}
	@Override
	public String queryylmlx(Lx lx) {
		return queryOne("queryylmlx", lx);
	}
	
}
