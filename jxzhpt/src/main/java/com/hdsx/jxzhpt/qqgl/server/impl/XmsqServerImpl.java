package com.hdsx.jxzhpt.qqgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.qqgl.server.XmsqServer;
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
		return queryOne("queryShNextXmbm", null);
	}
	@Override
	public List<Lx> queryAutoList(Xmsq xmsq) {
		return queryList("queryAutoList",xmsq);
	}
	@Override
	public int queryLsjl(String ylxbh, String qdzh, String zdzh,String xmbm) {
		params.put("lxbm", ylxbh);
		params.put("qdzh", qdzh);
		params.put("zdzh", zdzh);
		params.put("xmbm", xmbm);
		return queryOne("queryLsjl", params);
	}
	@Override
	public boolean insertLx(Lx lx) {
		return insert("insertLx", lx)>0;
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
		String[] split = xmsq.getXmbm().split(",");
		List<Xmsq> list=new ArrayList<Xmsq>();
		for (String x : split) {
			Xmsq item =new Xmsq();
			item.setXmbm(x);
			item.setSqzt(xmsq.getSqzt());
			list.add(item);
		}
		return updateBatch("updateYhdzxSqzt", list)==list.size();
	}
	@Override
	public boolean updateShSqzt(Xmsq xmsq) {
		String[] split = xmsq.getXmbm().split(",");
		List<Xmsq> list=new ArrayList<Xmsq>();
		for (String x : split) {
			Xmsq item =new Xmsq();
			item.setXmbm(x);
			item.setSqzt(xmsq.getSqzt());
			list.add(item);
		}
		return updateBatch("updateShSqzt", list)==list.size();
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

}
