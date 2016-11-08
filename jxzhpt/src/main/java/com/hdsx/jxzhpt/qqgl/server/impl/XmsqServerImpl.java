package com.hdsx.jxzhpt.qqgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import oracle.net.aso.q;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.qqgl.server.XmsqServer;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class XmsqServerImpl extends BaseOperate implements XmsqServer {
	public XmsqServerImpl(){
		super("xmsq", "jdbc");
	}
	private Map<String, Object> params=new HashMap<String, Object>();
	@Override
	public boolean insertXmsqYhdzx(List<Xmsq> list) {
		return insertBatch("insertXmsqYhdzx",list)==list.size();
	}
	@Override
	public boolean insertXmsqSh(List<Xmsq> list) {
		return insertBatch("insertXmsqSh",list)==list.size();
	}
	@Override
	public String queryYhdzxNextXmbm(Xmsq xmsq) {
		return queryOne("queryYhdzxNextXmbm", xmsq);
	}
	@Override
	public String queryShNextXmbm(Xmsq xmsq) {
		return queryOne("queryShNextXmbm", xmsq);
	}
	@Override
	public String querySjgzNextXmbm(Xmsq xmsq) {
		return queryOne("querySjgzNextXmbm", xmsq);
	}
	@Override
	public String queryLmgzNextXmbm(Xmsq xmsq) {
		return queryOne("queryLmgzNextXmbm", xmsq);
	}
	@Override
	public String queryXjNextXmbm(Xmsq xmsq) {
		return queryOne("queryXjNextXmbm", xmsq);
	}
	
	@Override
	public List<Lx> queryAutoList(Xmsq xmsq) {
		return queryList("queryAutoList",xmsq);
	}
	@Override
	public List<Lx> queryAutoghList(Xmsq xmsq) {
		return queryList("queryAutoghList",xmsq);
	}
	
	@Override
	public Lx queryAutoList1(Xmsq xmsq) {
		return queryOne("queryAutoList1",xmsq);
	}
	@Override
	public int queryLsjl(String ylxbh, String qdzh, String zdzh,String xmbm) {
		params.put("lxbm", ylxbh);
		params.put("qdzh", qdzh);
		params.put("zdzh", zdzh);
		params.put("xmbm", xmbm);
		int x=queryOne("querysfyLsjl", params);
		return x;
		//return queryOne("queryLsjl", params);
	}
	@Override
	public boolean insertLx(Lx lx) {
		return insert("insertLx", lx)>0;
	}
	@Override
	public boolean insertLx(Lx lx,Xmsq xmsq) {
		params.put("lx", lx);
		params.put("xmsq", xmsq);
		return insert("insertYhdzxlx", params)>0;
	}
	@Override
	public List<String> queryTsdq(Xmsq xmsq) {
		return queryList("queryTsdq",xmsq);
	}
	@Override
	public List<Xmsq> queryYhdzxXmsq(Xmsq xmsq,int page,int rows) {
		params.put("xmsq", xmsq);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryYhdzxXmsq",params);
	}
	@Override
	public List<Xmsq> queryShXmsq(Xmsq xmsq,int page,int rows) {
		params.put("xmsq", xmsq);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryShXmsq",params);
	}
	
	@Override
	public int queryYhdzxCount(Xmsq xmsq) {
		return queryOne("queryYhdzxCount", xmsq);
	}
	@Override
	public int queryShCount(Xmsq xmsq) {
		return queryOne("queryShCount", xmsq);
	}
	@Override
	public boolean deleteYhdzxByXmbm(String xmbm) {
		String[] split = xmbm.split(",");
		List<Xmsq> list=new ArrayList<Xmsq>();
		for (String x : split) {
			Xmsq xmsq=new Xmsq();
			xmsq.setXmbm(x);
			list.add(xmsq);
		}
		deleteBatch("deleteLxByXmbm", list);
		return deleteBatch("deleteYhdzxByXmbm", list)==list.size();
	}
	@Override
	public boolean deleteShByXmbm(String xmbm) {
		String[] split = xmbm.split(",");
		List<Xmsq> list=new ArrayList<Xmsq>();
		for (String x : split) {
			Xmsq xmsq=new Xmsq();
			xmsq.setXmbm(x);
			list.add(xmsq);
		}
		deleteBatch("deleteLxByXmbm", list);
		return deleteBatch("deleteShByXmbm", list)==list.size();
	}
	@Override
	public boolean updateYhdzxSqzt(Xmsq xmsq) {

		return update("updateYhdzxSqzt", xmsq)>0;
	}
	
	@Override
	public boolean updateShSqzt(Xmsq xmsq) {
		
		return update("updateShSqzt", xmsq)>0;
	}
	@Override
	public boolean insertJhshYhdzx(Xmsq xmsq) {
		String[] split = xmsq.getXmbm().split(",");
		return insert("insertJhshYhdzx", xmsq)==split.length;
	}
	@Override
	public boolean insertJhshSh(Xmsq xmsq) {
		String[] split = xmsq.getXmbm().split(",");
		return insert("insertJhshSh", xmsq)==split.length;
	}
	@Override
	public Xmsq queryYhdzxByXmbm(Xmsq xmsq) {
		return queryOne("queryYhdzxByXmbm", xmsq);
	}
	@Override
	public Xmsq queryShByXmbm(Xmsq xmsq) {
		return queryOne("queryShByXmbm", xmsq);
	}
	@Override
	public boolean updateYhdzx(Xmsq xmsq) {
		return update("updateYhdzx", xmsq)>0;
	}
	@Override
	public boolean updateYhdzx(List<Xmsq> xmsq) {
		return updateBatch("updateYhdzx", xmsq)==xmsq.size();
	}
	@Override
	public boolean updateSh(Xmsq xmsq) {
		return update("updateSh", xmsq)>0;
	}
	@Override
	public boolean insertCbsjYhdzx(Xmsq xmsq) {
		return insert("insertCbsjYhdzx", xmsq)==xmsq.getXmbm().split(",").length;
	}
	@Override
	public boolean insertCbsjSh(Xmsq xmsq) {
		return insert("insertCbsjSh", xmsq)==xmsq.getXmbm().split(",").length;
	}
	@Override
	public boolean insertCbsjShls(Xmsq xmsq) {
		return insert("insertCbsjShls", xmsq)==xmsq.getXmbm().split(",").length;
	}
	@Override
	public List<Object> queryYhdzxExport(Xmsq xmsq) {
		return queryList("queryYhdzxExport",xmsq);
	}
	@Override
	public List<Object> queryShExport(Xmsq xmsq) {
		return queryList("queryShExport",xmsq);
	}
	@Override
	public boolean insertLx(List<Lx> lxlist) {
		return insertBatch("insertLx", lxlist)==lxlist.size();
	}
	@Override
	public List<TreeNode> queryAllXzqh(String xzqhdm) {
		return queryList("queryAllXzqh",xzqhdm);
	}
	@Override
	public List<TreeNode> queryAllGydw(String gydwdm) {
		return queryList("queryAllGydw",gydwdm);
	}
	@Override
	public Map<String, String> queryLjYhdzx(Xmsq xmsq) {
		return queryOne("queryLjYhdzx", xmsq);
	}
	@Override
	public Map<String, String> queryLjSh(Xmsq xmsq) {
		return queryOne("queryLjSh", xmsq);
	}
	@Override
	public List<Map<String, String>> queryLxFromGpsroadByLevel(String level,String xzqhdm) {
		params.put("level", level);
		params.put("xzqhdm", xzqhdm);
		return queryList("queryLxFromGpsroadByLevel", params);
	}

	@Override
	public List<Xmsq> queryYhzxXmsq(Xmsq xmsq,int page,int rows) {
		params.put("xmsq", xmsq);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryYhzxXmsq",params);
	}
	@Override
	public int queryYhzxCount(Xmsq xmsq) {
		return queryOne("queryYhzxCount", xmsq);
	}
	
	@Override
	public String queryYhzxNextXmbm(Xmsq xmsq) {
		return queryOne("queryYhzxNextXmbm", xmsq);
	}
	
	@Override
	public boolean insertXmsqYhzx(List<Xmsq> list) {
		return insertBatch("insertXmsqYhzx",list)==list.size();
	}
	
	@Override
	public boolean deleteYhzxByXmbm(String xmbm) {
		String[] split = xmbm.split(",");
		List<Xmsq> list=new ArrayList<Xmsq>();
		for (String x : split) {
			Xmsq xmsq=new Xmsq();
			xmsq.setXmbm(x);
			list.add(xmsq);
		}
		return deleteBatch("deleteYhzxByXmbm", list)==list.size();
	}
	
	@Override
	public Xmsq queryYhzxByXmbm(Xmsq xmsq) {
		return queryOne("queryYhzxByXmbm", xmsq);
	}
	
	@Override
	public boolean updateYhzx(Xmsq xmsq) {
		return update("updateYhzx", xmsq)>0;
	}
	
	@Override
	public boolean updateYhzxSqzt(Xmsq xmsq) {
		String[] split = xmsq.getXmbm().split(",");
		List<Xmsq> list=new ArrayList<Xmsq>();
		for (String x : split) {
			Xmsq item =new Xmsq();
			item.setXmbm(x);
			item.setSqzt(xmsq.getSqzt());
			list.add(item);
		}
		return updateBatch("updateYhzxSqzt", list)==list.size();
	}
	
	@Override
	public Map<String, String> queryLjYhzx(Xmsq xmsq) {
		return queryOne("queryLjYhzx", xmsq);
	}
	
	@Override
	public boolean insertJhshYhzx(Xmsq xmsq) {
		return insert("insertJhshYhzx",xmsq)==xmsq.getXmbm().split(",").length;
	}
	
	@Override
	public List<Object> queryYhzxExport(Xmsq xmsq) {
		return queryList("queryYhzxExport",xmsq);
	}
	@Override
	public List<Lx> queryLslist(Xmsq xmsq) {
		List<Lx> result =new ArrayList<Lx>();
		Lx lx=new Lx();
		lx.setLxbm(xmsq.getYlxbh());
		lx.setQdzh(xmsq.getQdzh());
		lx.setZdzh(xmsq.getZdzh());
		queryLsjlList(result, lx);
		return result;
	}
	
	@Override
	public List<Lx> queryLslistwnxmk(Xmsq xmsq) {
		List<Lx> result =new ArrayList<Lx>();
		Lx lx=new Lx();
		lx.setXmid(xmsq.getXmbm());
		lx.setLxbm(xmsq.getYlxbh());
		lx.setQdzh(xmsq.getQdzh());
		lx.setZdzh(xmsq.getZdzh());
		queryLsjlListwnxmk(result, lx);
		return result;
	}
	
	@Override
	public List<Lx> queryLslistserw(Xmsq xmsq) {
		List<Lx> result =new ArrayList<Lx>();
		Lx lx=new Lx();
		//System.out.println(xmsq.getXmbm());
		lx.setXmid(xmsq.getXmbm());
		lx.setLxbm(xmsq.getYlxbh());
		lx.setQdzh(xmsq.getQdzh());
		lx.setZdzh(xmsq.getZdzh());
		queryLsjlListserw(result, lx);
		return result;
	}
	
	
	private void queryLsjlListwnxmk(List<Lx> result, Lx item) {
		//查询原路线信息
		//List<Lx> ylx = queryList("queryYLx",item);
		//查询项目编码下的其他路线
		List<Lx> qtlx = queryList("queryQTLx",item);
		/*if(qtlx.size()>0){
			for (Lx lx : qtlx) {
				List<Lx> qtylx = queryList("queryYLx",lx);
				ylx.addAll(qtylx);
			}
		}*/
		
		params.put("lx", item);
		params.put("ylx", qtlx);
		try {
			List<Lx> queryList = queryList("queryLsjlListwnxmk", params);
			boolean flag = true;
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void queryLsjlListserw(List<Lx> result, Lx item) {
		//查询原路线信息
		//List<Lx> ylx = queryList("queryYLx",item);
		List<Lx> qtlx = queryList("queryQTLx",item);
		/*if(qtlx.size()>0){
			for (Lx lx : qtlx) {
				List<Lx> qtylx = queryList("queryYLx",lx);
				ylx.addAll(qtylx);
			}
		}*/
		params.put("lx", item);
		params.put("ylx", qtlx);
		try {
			List<Lx> queryList = queryList("queryLsjlListserw", params);
			boolean flag = true;
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	private void queryLsjlList(List<Lx> result, Lx item) {
		//查询原路线信息
		List<Lx> ylx = queryList("queryYLx",item);
		params.put("lx", item);
		params.put("ylx", ylx);
		try {
			List<Lx> queryList = queryList("queryLsjlList", params);
			boolean flag = true;
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public List<Xmsq> queryyhdzxcb(Xmsq xmsq) {
		return queryList("queryyhdzxcb", xmsq);
	}
	@Override
	public Xmsq queryyhdzxsfdj() {
		return queryOne("queryyhdzxsfdj", "");
	}
	@Override
	public List<Excel_list> queryYhdzxExport1(Xmsq xmsq) {
		
		return queryList("queryYhdzxExport1", xmsq);
	}
	@Override
	public Xmsq getghxx(Xmsq xmsq) {
		if("wn".equals(xmsq.getJsxz()))
		return queryOne("getghxx1", xmsq);
		if("jh".equals(xmsq.getJsxz()))
			return queryOne("getghxx2", xmsq);
		return null;
	}
	@Override
	public Xmsq getghxxbyone(Xmsq xmsq) {
		if("wn".equals(xmsq.getJsxz()))
			return queryOne("getghxxbyone1", xmsq);
			if("jh".equals(xmsq.getJsxz()))
				return queryOne("getghxxbyone2", xmsq);
			return null;
	}
	@Override
	public List<Xmsq> getghlxinfo(Xmsq xmsq) {
		return queryList("getghlxinfo", xmsq);
	}
	@Override
	public Xmsq getylxinfo(Xmsq xmsq) {
		List<Xmsq> l=queryList("getylxinfo", xmsq);
		if(l.size()>0)
			return l.get(0);
			else
				return null;
	}
	@Override
	public Lx getylxlminfo(Xmsq xmsq) {
		List<Lx> l=queryList("getylxlminfo", xmsq);
		if(l.size()>0)
		return l.get(0);
		else
			return null;
	}
	@Override
	public List<Xmsq> getgxlxinfo(Xmsq xmsq) {
		try {
			List<Xmsq> x = queryList("getylxinfo1", xmsq);
			//List<Xmsq> ll = queryList("getgxlxinfo", x);
			List<Xmsq> ll = new ArrayList<Xmsq>();
			for (Xmsq xmsq2 : x) {
				List<Xmsq> ll1 = queryList("getgxlxinfo", xmsq2);
				ll.addAll(ll1);
			}
			//List<Xmsq> l = queryList("getgxlxinfo", x);
			return ll;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
