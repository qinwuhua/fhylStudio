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
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.utile.MyUtil;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.ibm.icu.math.BigDecimal;

@Service
public class JhshServerImpl extends BaseOperate implements JhshServer {
	public JhshServerImpl() {
		super("jhsh", "jdbc");
	}

	private Map<String, Object> params = new HashMap<String, Object>();

	@Override
	public boolean insertJhshLmsjFromCbsj(String xmbm) {
		String[] split = xmbm.split(",");
		List<Cbsj> list = new ArrayList<Cbsj>();
		for (int j = 0; j < split.length; j++) {
			Cbsj obj = new Cbsj();
			obj.setXmbm(split[j]);
			list.add(obj);
		}
		return insertBatch("insertJhshLmsjFromCbsj", list) == list.size();
	}

	@Override
	public boolean insertJhshLmgzFromCbsj(String xmbm) {
		String[] split = xmbm.split(",");
		List<Cbsj> list = new ArrayList<Cbsj>();
		for (int j = 0; j < split.length; j++) {
			Cbsj obj = new Cbsj();
			obj.setXmbm(split[j]);
			list.add(obj);
		}
		return insertBatch("insertJhshLmgzFromCbsj", list) == list.size();
	}

	@Override
	public boolean insertJhshXjFromCbsj(String xmbm) {
		String[] split = xmbm.split(",");
		List<Cbsj> list = new ArrayList<Cbsj>();
		for (int j = 0; j < split.length; j++) {
			Cbsj obj = new Cbsj();
			obj.setXmbm(split[j]);
			list.add(obj);
		}
		return insertBatch("insertJhshXjFromCbsj", list) == list.size();
	}

	@Override
	public List<Jhsh> queryJhshLmsj(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshLmsj", params);
	}

	@Override
	public List<Jhsh> queryJhshLmsj1(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshLmsj1", params);
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
		return queryList("queryJhshLmgz", params);
	}

	@Override
	public List<Jhsh> queryJhshLmgz1(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshLmgz1", params);
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
		return queryList("queryJhshXj", params);
	}

	@Override
	public List<Jhsh> queryJhshXj1(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshXj1", params);
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
		return updateBatch("updateJhshxxLmsj", jhshs) == jhshs.size();
	}

	@Override
	public boolean updateJhshxxLmgz(List<Jhsh> list) {
		return updateBatch("updateJhshxxLmgz", list) == list.size();
	}

	@Override
	public boolean updateJhshxxXj(List<Jhsh> list) {
		return updateBatch("updateJhshxxXj", list) == list.size();
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
	public Lxsh queryLxshLmsjqxByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryLxshLmsjqxByXmbm", params);
	}

	@Override
	public Lxsh queryLxshLmgzqxByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryLxshLmgzqxByXmbm", params);
	}

	@Override
	public Lxsh queryLxshXjqxByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryLxshXjqxByXmbm", params);
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
		return queryList("queryJhshYhdzx", jhsh);
	}

	@Override
	public List<Jhsh> queryJhshYhdzx_qx(Jhsh jhsh) {
		return queryList("queryJhshYhdzx_qx", jhsh);
	}

	@Override
	public List<Jhsh> queryJhshYhdzx1(Jhsh jhsh, int page, int rows) {
		params.put("jhsh2", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshYhdzx1", params);
	}

	@Override
	public int queryJhshYhdzxCount(Jhsh jhsh) {
		return queryOne("queryJhshYhdzxCount", jhsh);
	}

	@Override
	public int queryJhshYhdzx_qxCount(Jhsh jhsh) {
		return queryOne("queryJhshYhdzx_qxCount", jhsh);
	}

	@Override
	public int queryJhshYhdzxCount1(Jhsh jhsh) {
		params.put("jhsh2", jhsh);
		return queryOne("queryJhshYhdzxCount1", params);
	}

	@Override
	public boolean updateJhshxxYhdzx(Jhsh jhsh) {
		return update("updateJhshxxYhdzx", jhsh) > 0;
	}

	@Override
	public boolean updateJhshxxSh(Jhsh jhsh) {
		return update("updateJhshxxSh", jhsh) > 0;
	}

	@Override
	public Jhsh queryJhshxxYhdzxByXmbm(Jhsh jhsh) {
		return queryOne("queryJhshxxYhdzxByXmbm", jhsh);
	}

	@Override
	public Jhsh queryJhshxxShByXmbm(Jhsh jhsh) {
		return queryOne("queryJhshxxShByXmbm", jhsh);
	}

	@Override
	public List<Jhsh> queryJhshSh(Jhsh jhsh) {
		return queryList("queryJhshSh", jhsh);
	}

	@Override
	public List<Jhsh> queryJhshSh_qx(Jhsh jhsh) {
		return queryList("queryJhshSh_qx", jhsh);
	}

	@Override
	public List<Jhsh> queryJhshSh1(Jhsh jhsh, int page, int rows) {
		params.put("jhsh2", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshSh1", params);
	}

	@Override
	public int queryJhshShCount(Jhsh jhsh) {
		return queryOne("queryJhshShCount", jhsh);
	}

	@Override
	public int queryJhshSh_qxCount(Jhsh jhsh) {
		return queryOne("queryJhshSh_qxCount", jhsh);
	}

	@Override
	public int queryJhshShCount1(Jhsh jhsh) {
		params.put("jhsh2", jhsh);
		return queryOne("queryJhshShCount1", params);
	}

	@Override
	public boolean insertJhshYhdzxFromCbsj(String xmbm) {
		Cbsj cbsj = new Cbsj();
		cbsj.setXmbm(xmbm);
		String[] split = xmbm.split(",");
		return insert("insertJhshYhdzxFromCbsj", cbsj) == split.length;
	}

	@Override
	public boolean insertJhshShFromCbsj(String xmbm) {
		Cbsj cbsj = new Cbsj();
		cbsj.setXmbm(xmbm);
		String[] split = xmbm.split(",");
		return insert("insertJhshShFromCbsj", cbsj) == split.length;
	}

	@Override
	public boolean updateLx(Lx lx) {
		if ("1".equals(lx.getSffirst())) {
			String id = queryOne("querylxshlxid", lx);
			lx.setId(id);
		}
		if (!"".equals(lx.getGxlxbm()) && lx.getGxlxbm() != null
				&& !"".equals(lx.getId()) && lx.getId() != null) {
			Lxsh lxsh = new Lxsh();
			lxsh.setId(lx.getId());
			lxsh.setGhlxbm(lx.getGhlxbm());
			lxsh.setGhqdzh(lx.getGhqdzh());
			lxsh.setGhzdzh(lx.getGhzdzh());
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}

		return update("updateLx", lx) > 0;
	}

	@Override
	public boolean updateLxqwh(Lx lx) {

		if ("1".equals(lx.getSffirst())) {
			String id = queryOne("querylxshlxid", lx);
			lx.setId(id);
		}
		if (!"".equals(lx.getGxlxbm()) && lx.getGxlxbm() != null
				&& !"".equals(lx.getId()) && lx.getId() != null) {
			Lxsh lxsh = new Lxsh();
			lxsh.setId(lx.getId());
			lxsh.setGhlxbm(lx.getGhlxbm());
			lxsh.setGhqdzh(lx.getGhqdzh());
			lxsh.setGhzdzh(lx.getGhzdzh());
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}

		if (update("updateLxqwh", lx) > 0) {
			update("updateLxqwhxmbm", lx);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateLx(Lx lx, Xmsq xmsq) {
		if ("1".equals(lx.getSffirst())) {
			String id = queryOne("querylxshlxid", lx);
			lx.setId(id);
		}
		if (!"".equals(lx.getGxlxbm()) && lx.getGxlxbm() != null
				&& !"".equals(lx.getId()) && lx.getId() != null) {
			Lxsh lxsh = new Lxsh();
			lxsh.setId(lx.getId());
			lxsh.setGhlxbm(lx.getGhlxbm());
			lxsh.setGhqdzh(lx.getGhqdzh());
			lxsh.setGhzdzh(lx.getGhzdzh());
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		params.put("lx", lx);
		params.put("xmsq", xmsq);
		// System.out.println(xmsq.getSnhntmchbmj());
		return update("updateyhdzxLx", params) > 0;
	}

	@Override
	public boolean updateLxshm(Lx lx, Xmsq xmsq) {
		if ("1".equals(lx.getSffirst())) {
			String id = queryOne("querylxshlxid", lx);
			lx.setId(id);
		}
		if (!"".equals(lx.getGxlxbm()) && lx.getGxlxbm() != null
				&& !"".equals(lx.getId()) && lx.getId() != null) {
			Lxsh lxsh = new Lxsh();
			lxsh.setId(lx.getId());
			lxsh.setGhlxbm(lx.getGhlxbm());
			lxsh.setGhqdzh(lx.getGhqdzh());
			lxsh.setGhzdzh(lx.getGhzdzh());
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		params.put("lx", lx);
		params.put("xmsq", xmsq);
		// System.out.println(xmsq.getSnhntmchbmj());
		if (update("updateLxshm", params) > 0) {
			update("updateLxqwhxmbm", lx);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateLx(Lx lx, Cbsj cbsj) {
		if ("1".equals(lx.getSffirst())) {
			String id = queryOne("querylxshlxid", lx);
			lx.setId(id);
		}
		if (!"".equals(lx.getGxlxbm()) && lx.getGxlxbm() != null
				&& !"".equals(lx.getId()) && lx.getId() != null) {
			Lxsh lxsh = new Lxsh();
			lxsh.setId(lx.getId());
			lxsh.setGhlxbm(lx.getGhlxbm());
			lxsh.setGhqdzh(lx.getGhqdzh());
			lxsh.setGhzdzh(lx.getGhzdzh());
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		params.put("lx", lx);
		params.put("cbsj", cbsj);
		System.out.println(cbsj.getSnhntmchbmj());
		return update("updateyhdzxcbsjLx", params) > 0;
	}

	@Override
	public boolean insertLx(Lx lx) {

		if (!"".equals(lx.getGxlxbm()) && lx.getGxlxbm() != null) {
			Lxsh lxsh = new Lxsh();
			String id = MyUtil.getUuid();
			lxsh.setId(id);
			lxsh.setGhlxbm(lx.getGhlxbm());
			lxsh.setGhqdzh(lx.getGhqdzh());
			lxsh.setGhzdzh(lx.getGhzdzh());
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		return insert("insertLx", lx) > 0;
	}

	@Override
	public boolean deleteLx(Lx lx) {
		return delete("deleteLx", lx) > 0;
	}

	@Override
	public List<Lx> selectlxList(Lx lx) {
		return queryList("selectlxList", lx);
	}

	@Override
	public List<Lx> selectlxbgList(Lx lx) {
		return queryList("selectlxbgList", lx);
	}

	@Override
	public boolean insertLxJdbs(Lx lx) {

		return insert("insertLxJdbs", lx) > 0;
	}

	@Override
	public Lx queryHaveLx(Lx lx) {
		return queryOne("queryHaveLx", lx);
	}

	@Override
	public List<Lx> queryLsxx(Jhsh jhsh) {
		Lx lx = new Lx();
		lx.setXmid(jhsh.getXmbm());
		// 返回结果
		List<Lx> result = new ArrayList<Lx>();
		// 查询此计划所有的路线信息
		List<Lx> lxList = queryList("queryLxMaxJdbs", lx);
		for (Lx item : lxList) {
			queryLsjlList(result, item);
		}
		return result;
	}

	@Override
	public List<Lx> querywnxx(Jhsh jhsh) {
		Lx lx = new Lx();
		lx.setXmid(jhsh.getXmbm());
		// 返回结果
		List<Lx> result = new ArrayList<Lx>();
		// 查询此计划所有的路线信息
		List<Lx> lxList = queryList("queryLxMaxJdbs", lx);
		for (Lx item : lxList) {
			querywnxxList(result, item);
		}
		return result;
	}

	private void querywnxxList(List<Lx> result, Lx item) {
		// 查询原路线信息
		List<Lx> ylx = queryList("queryYLx", item);
		params.put("lx", item);
		params.put("ylx", ylx);
		// insert("getwnlxview", "");

		List<Lx> queryList = queryList("queryLsjlListwnxmk", params);
		boolean flag = true;
		if (result.size() > 0 && queryList.size() > 0) {
			for (Lx l1 : queryList) {
				flag = true;
				for (Lx l2 : result) {
					if (l1.getXmid().equals(l2.getXmid()))
						flag = false;
				}
				if (flag)
					result.add(l1);
			}
		}
		if (result.size() == 0) {
			for (int i = 0; i < queryList.size(); i++) {
				flag = true;
				for (int j = i + 1; j < queryList.size(); j++) {
					if (queryList.get(i).getXmid()
							.equals(queryList.get(j).getXmid())) {
						flag = false;
					}
				}
				if (flag) {
					result.add(queryList.get(i));
				}
			}
		}

	}

	@Override
	public List<Lx> queryLsxx1(Jhsh jhsh) {
		Lx lx = new Lx();
		lx.setXmid(jhsh.getXmbm());
		// 返回结果
		List<Lx> result = new ArrayList<Lx>();
		// 查询此计划所有的路线信息
		List<Lx> lxList = queryList("queryLxMaxJdbs1", lx);
		for (Lx item : lxList) {
			queryLsjlList(result, item);
		}
		return result;
	}

	@Override
	public List<Lx> querywnLsxx(Jhsh jhsh) {

		String lsxmbm = queryOne("querywnLsxxxmbm", jhsh);

		// 返回结果
		List<Lx> result = queryList("querywnLsxx", lsxmbm);
		// 查询此计划所有的路线信息

		return result;
	}

	@Override
	public List<Lx> querylxLsxx(Jhsh jhsh) {
		// System.out.println(jhsh.getLsxmlx());
		String lsxmbm = queryOne("querylxLsxxxmbm", jhsh);
		jhsh.setLsxmbm(lsxmbm);
		jhsh.setLsxmlx(MyUtil.getQueryTJ(jhsh.getLsxmlx(), "xmlx"));
		jhsh.setLsxmnf(MyUtil.getQueryTJ(jhsh.getLsxmnf(), "xmnf"));
		// 返回结果
		List<Lx> result = queryList("querylxLsxx", jhsh);
		// 查询此计划所有的路线信息

		return result;
	}

	@Override
	public List<Lx> querywnxmxx(Jhsh jhsh) {

		String lsxmbm = queryOne("querywnxmxxxmbm", jhsh);
		// 返回结果
		List<Lx> result = queryList("querywnxmxx", lsxmbm);
		// 查询此计划所有的路线信息

		return result;
	}

	@Override
	public List<Lx> queryLsxx2(Lx lx) {
		List<Lx> result = new ArrayList<Lx>();
		queryLsjlList(result, lx);
		return result;
	}

	@Override
	public List<Lx> queryLsxx2new(Lx lx) {
		List<Lx> result = new ArrayList<Lx>();
		result = queryList("queryLsxx2new", lx);
		
		if (!"".equals(lx.getGhlxbm())) {
			if ("".equals(lx.getGhqdzh()))
				lx.setGhqdzh("0");
			if ("".equals(lx.getGhzdzh()))
				lx.setGhzdzh("9999");
			
			List<Lx> l = queryList("getgxlxbyzh", lx);
			
			if (l.size() > 0)
				for (Lx lx2 : l) {
					lx.setLxbm(null);
					lx.setQdzh(null);
					lx.setZdzh(null);
					lx.setGhlxbm(lx2.getLxbm());
					lx.setGhqdzh(lx2.getQdzh());
					lx.setGhzdzh(lx2.getZdzh());
					List<Lx> l2 = queryList("queryLsxx2new", lx);
					result.addAll(l2);
				}
		}
		
		
		// queryLsjlListnew(result, lx);
		return result;
	}

	/**
	 * 根据路线和原路线查询历史记录
	 * 
	 * @param result
	 *            返回结果
	 * @param item
	 *            路线
	 */
	private void queryLsjlList(List<Lx> result, Lx item) {
		// 查询原路线信息
		// List<Lx> ylx = queryList("queryYLx",item);
		List<Lx> ylx = new ArrayList<Lx>();
		// ylx = queryList("queryYlx",item);
		params.put("lx", item);
		params.put("ylx", ylx);
		List<Lx> queryList = queryList("queryLsjlList", params);
		boolean flag = true;
		if (result.size() > 0 && queryList.size() > 0) {
			for (Lx l1 : queryList) {
				flag = true;
				for (Lx l2 : result) {
					if (l1.getXmid().equals(l2.getXmid()))
						flag = false;
				}
				if (flag)
					result.add(l1);
			}
		}
		if (result.size() == 0) {
			for (int i = 0; i < queryList.size(); i++) {
				flag = true;
				for (int j = i + 1; j < queryList.size(); j++) {
					if (queryList.get(i).getXmid()
							.equals(queryList.get(j).getXmid())) {
						flag = true;
					}
				}
				if (flag) {
					result.add(queryList.get(i));
				}
			}
		}

		// List<Lx> queryList1 = queryList("queryLsjlListnew",params);
		// result.addAll(queryList1);

	}

	private void queryLsjlListnew(List<Lx> result, Lx item) {
		// 查询原路线信息
		List<Lx> ylx = new ArrayList<Lx>();
		if (item.getGhlxbm() != null && !"".equals(item.getGhlxbm())) {
			if ("".equals(item.getGhqdzh().trim()))
				item.setGhqdzh("0");
			if ("".equals(item.getGhzdzh().trim()))
				item.setGhzdzh("90000");
			ylx = queryList("queryYlxnew", item);
			for (Lx lx : ylx) {
				lx.setXmlx(item.getXmlx());
				lx.setXzdzh(item.getXzdzh());
			}
		}
		if (item.getLxbm() != null && !"".equals(item.getLxbm())) {
			if ("".equals(item.getQdzh().trim()))
				item.setQdzh("0");
			if ("".equals(item.getZdzh().trim()))
				item.setZdzh("90000");
			// ylx.add(item);
		}
		if (ylx.size() <= 1) {
			if (ylx.size() == 1) {
				if (ylx.get(0).getLxbm() == null || "".equals(item.getLxbm())) {
					return;
				}
			} else {
				return;
			}
		}

		params.put("lx", ylx);
		List<Lx> queryList = queryList("queryLsjlListqwh", params);
		boolean flag = true;
		if (result.size() > 0 && queryList.size() > 0) {
			for (Lx l1 : queryList) {
				flag = true;
				for (Lx l2 : result) {
					if (l1.getXmid().equals(l2.getXmid()))
						flag = false;
				}
				if (flag)
					result.add(l1);
			}
		}
		if (result.size() == 0) {
			for (int i = 0; i < queryList.size(); i++) {
				flag = true;
				for (int j = i + 1; j < queryList.size(); j++) {
					if (queryList.get(i).getXmid()
							.equals(queryList.get(j).getXmid())) {
						flag = true;
					}
				}
				if (flag) {
					result.add(queryList.get(i));
				}
			}
		}

	}

	@Override
	public Kxxyj queryLmsjKxxyjByXmbm(Jhsh jhsh) {
		return queryOne("queryLmsjKxxyjByXmbm", jhsh);
	}

	@Override
	public Kxxyj queryLmgzKxxyjByXmbm(Jhsh jhsh) {
		return queryOne("queryLmgzKxxyjByXmbm", jhsh);
	}

	@Override
	public Kxxyj queryLmsjKxxyjqxByXmbm(Jhsh jhsh) {
		return queryOne("queryLmsjKxxyjqxByXmbm", jhsh);
	}

	@Override
	public Kxxyj queryLmgzKxxyjqxByXmbm(Jhsh jhsh) {
		return queryOne("queryLmgzKxxyjqxByXmbm", jhsh);
	}

	@Override
	public Kxxyj queryShKxxyjByXmbm(Jhsh jhsh) {
		return queryOne("queryShKxxyjByXmbm", jhsh);
	}

	@Override
	public Kxxyj queryXjKxxyjByXmbm(Jhsh jhsh) {
		return queryOne("queryXjKxxyjByXmbm", jhsh);
	}

	@Override
	public Kxxyj queryXjKxxyjqxByXmbm(Jhsh jhsh) {
		return queryOne("queryXjKxxyjqxByXmbm", jhsh);
	}

	@Override
	public boolean updateLx(List<Lx> lx) {
		return updateBatch("updateLx", lx) == lx.size();
	}

	@Override
	public boolean updateJhshxxYhdzx(List<Jhsh> readerExcel) {
		return updateBatch("updateJhshxxYhdzx", readerExcel) == readerExcel
				.size();
	}

	@Override
	public boolean updateJhshxxSh(List<Jhsh> readerExcel) {
		return updateBatch("updateJhshxxSh", readerExcel) == readerExcel.size();
	}

	@Override
	public Lx queryJsdjAndLcByStartAndEnd(Lx lx) {
		return queryOne("queryJsdjAndLcByStartAndEnd", lx);
	}

	@Override
	public List<Map<String, String>> zdyQueryLmsj(String filed, Jhsh jhsh,
			int page, int rows) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("zdyQueryLmsj", params);
	}

	@Override
	public List<Map<String, String>> zdyQueryLmgz(String filed, Jhsh jhsh,
			int page, int rows) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("zdyQueryLmgz", params);
	}

	@Override
	public List<Map<String, String>> zdyQueryXj(String filed, Jhsh jhsh,
			int page, int rows) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("zdyQueryXj", params);
	}

	@Override
	public List<Map<String, String>> zdyQueryYhdzx(String filed, Jhsh jhsh,
			int page, int rows) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("zdyQueryYhdzx", params);
	}

	@Override
	public List<Map<String, String>> zdyQuerySh(String filed, Jhsh jhsh,
			int page, int rows) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("zdyQuerySh", params);
	}

	@Override
	public int zdyQueryLmsjTotal(String filed, Jhsh jhsh) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		return queryOne("zdyQueryLmsjTotal", params);
	}

	@Override
	public int zdyQueryLmgzTotal(String filed, Jhsh jhsh) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		return queryOne("zdyQueryLmgzTotal", params);
	}

	@Override
	public int zdyQueryXjTotal(String filed, Jhsh jhsh) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		return queryOne("zdyQueryXjTotal", params);
	}

	@Override
	public int zdyQueryYhdzxTotal(String filed, Jhsh jhsh) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		return queryOne("zdyQueryYhdzxTotal", params);
	}

	@Override
	public int zdyQueryShTotal(String filed, Jhsh jhsh) {
		params.put("filed", filed);
		params.put("jhsh", jhsh);
		return queryOne("zdyQueryShTotal", params);
	}

	@Override
	public Map<String, String> queryJhshLjLmsj(Jhsh jhsh) {
		return queryOne("queryJhshLjLmsj", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjLmsj1(Jhsh jhsh) {
		return queryOne("queryJhshLjLmsj1", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjLmgz(Jhsh jhsh) {
		return queryOne("queryJhshLjLmgz", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjLmgz1(Jhsh jhsh) {
		return queryOne("queryJhshLjLmgz1", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjXj(Jhsh jhsh) {
		return queryOne("queryJhshLjXj", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjXj1(Jhsh jhsh) {
		return queryOne("queryJhshLjXj1", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjYhdzx(Jhsh jhsh) {
		return queryOne("queryJhshLjYhdzx", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjYhdzx_qx(Jhsh jhsh) {
		return queryOne("queryJhshLjYhdzx_qx", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjYhdzx1(Jhsh jhsh) {
		return queryOne("queryJhshLjYhdzx1", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjSh(Jhsh jhsh) {
		return queryOne("queryJhshLjSh", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjSh_qx(Jhsh jhsh) {
		return queryOne("queryJhshLjSh_qx", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjSh1(Jhsh jhsh) {
		return queryOne("queryJhshLjSh1", jhsh);
	}

	@Override
	public List<Jhsh> queryJhshYhzx(Jhsh jhsh, int page, int rows) {
		params.put("jhsh2", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryJhshYhzx", params);
	}

	@Override
	public int queryJhshYhzxCount(Jhsh jhsh) {
		params.put("jhsh2", jhsh);
		return queryOne("queryJhshYhzxCount", params);
	}

	@Override
	public Map<String, String> queryJhshLjYhzx(Jhsh jhsh) {
		return queryOne("queryJhshLjYhzx", jhsh);
	}

	@Override
	public Jhsh queryJhshxxYhzxByXmbm(Jhsh jhsh) {
		return queryOne("queryJhshxxYhzxByXmbm", jhsh);
	}

	@Override
	public boolean updateJhshYhzx(Jhsh jhsh) {
		return update("updateJhshYhzx", jhsh) > 0;
	}

	@Override
	public boolean updateSflgc(Jhsh jhsh) {
		return update("updateJhshSflgc", jhsh) > 0;
	}

	@Override
	public List<Jhsh> queryGsdgz(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryGsdgz", params);
	}

	@Override
	public int queryGsdgzCount(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryGsdgzCount", params);
	}

	@Override
	public List<Jhsh> queryGsdgz_qx(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryGsdgz_qx", params);
	}

	@Override
	public int queryGsdgz_qxCount(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryGsdgz_qxCount", params);
	}

	@Override
	public List<Jhsh> queryGsdgzxd(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryGsdgzxd", params);
	}

	@Override
	public int queryGsdgzxdCount(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryGsdgzxdCount", params);
	}

	@Override
	public Map<String, String> queryJhshLjgsdgz(Jhsh jhsh) {
		return queryOne("queryJhshLjgsdgz", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjgsdgz_qx(Jhsh jhsh) {
		return queryOne("queryJhshLjgsdgz_qx", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjgsdxd(Jhsh jhsh) {
		return queryOne("queryJhshLjgsdxd", jhsh);
	}

	@Override
	public List<Jhsh> queryGsdgzxdbz(Jhsh jhsh) {
		return queryList("queryGsdgzxdbz", jhsh);
	}

	@Override
	public List<Jhsh> queryGsdgzxd_qxbz(Jhsh jhsh) {
		return queryList("queryGsdgzxd_qxbz", jhsh);
	}

	@Override
	public boolean planxdAll(List<Jhsh> list) {
		return insertBatch("planxdAll", list) == list.size()
				&& updateBatch("planxdAllmc", list) == list.size();
	}
	
	@Override
	public boolean planxdAllSzxm(List<Map<String, String>> list) {
		
		
		return insertBatch("planxdAllSzxm", list) == list.size()
				&& updateBatch("planxdAllSzxmmc", list) == list.size();
		
	}
	
	@Override
	public boolean planxdAll_qx(List<Jhsh> list) {
		return insertBatch("planxdAll", list) == list.size()
				&& updateBatch("planxdAllmc_qx", list) == list.size()
				&& updateBatch("planxdAllcbwh_qx", list) == list.size();
	}

	@Override
	public List<Jhsh> queryshxd(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryshxd", params);
	}

	@Override
	public int queryshxdCount(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryshxdCount", params);
	}

	@Override
	public Map<String, String> queryJhbzshLj(Jhsh jhsh) {
		return queryOne("queryJhbzshLj", jhsh);
	}

	@Override
	public List<Jhsh> queryshxdbz(Jhsh jhsh) {
		return queryList("queryshxdbz", jhsh);
	}

	@Override
	public List<Jhsh> queryshxd_qxbz(Jhsh jhsh) {
		return queryList("queryshxd_qxbz", jhsh);
	}

	@Override
	public List<Jhsh> queryjhxdyh(Jhsh jhsh, int page, int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryjhxdyh", params);
	}

	@Override
	public int queryjhxdyhCount(Jhsh jhsh) {
		params.put("jhsh", jhsh);
		return queryOne("queryjhxdyhCount", params);
	}

	@Override
	public Map<String, String> queryJhbzyhLj(Jhsh jhsh) {
		return queryOne("queryJhbzyhLj", jhsh);
	}

	@Override
	public List<Jhsh> queryyhxdbz(Jhsh jhsh) {
		return queryList("queryyhxdbz", jhsh);
	}

	@Override
	public List<Jhsh> queryyhxd_qxbz(Jhsh jhsh) {
		return queryList("queryyhxd_qxbz", jhsh);
	}

	@Override
	public boolean planxdhzadd(List<Jhsh> list) {
		delete("planxdhzdelete");
		try {
			BigDecimal ztz = new BigDecimal("0");
			BigDecimal rys = new BigDecimal("0");
			BigDecimal cgs = new BigDecimal("0");
			BigDecimal gz = new BigDecimal("0");
			BigDecimal sz = new BigDecimal("0");
			BigDecimal zq = new BigDecimal("0");
			BigDecimal dk = new BigDecimal("0");
			BigDecimal jl = new BigDecimal("0");
			BigDecimal qt = new BigDecimal("0");

			// bzpfztz,bzrys,bzcgs,bzgz,bzsz,bzzq,bzdk,bzjl,bzqt
			for (Jhsh jhsh : list) {
				System.out.println(jhsh.getBzpfztz() + "  ztz");
				System.out.println(jhsh.getBzrys() + "  rys");
				System.out.println(jhsh.getBzcgs() + "cgs");
				System.out.println(jhsh.getBzgz() + "  gz");
				System.out.println(jhsh.getBzsz() + "  sz");
				System.out.println(jhsh.getBzzq() + "  zq");
				System.out.println(jhsh.getBzdk() + "  dk");
				System.out.println(jhsh.getBzjl() + "  jl");
				System.out.println(jhsh.getBzqt() + "  qt");
				System.out.println(!"".equals(jhsh.getBzcgs()));
				ztz = jhsh.getBzpfztz() != null
						&& !"".equals(jhsh.getBzpfztz()) ? new BigDecimal(
						jhsh.getBzpfztz()) : new BigDecimal("0");
				rys = jhsh.getBzrys() != null && !"".equals(jhsh.getBzrys()) ? new BigDecimal(
						jhsh.getBzrys()) : new BigDecimal("0");
				cgs = jhsh.getBzcgs() != null && !"".equals(jhsh.getBzcgs()) ? new BigDecimal(
						jhsh.getBzcgs()) : new BigDecimal("0");
				gz = jhsh.getBzgz() != null && !"".equals(jhsh.getBzgz()) ? new BigDecimal(
						jhsh.getBzgz()) : new BigDecimal("0");
				sz = jhsh.getBzsz() != null && !"".equals(jhsh.getBzsz()) ? new BigDecimal(
						jhsh.getBzsz()) : new BigDecimal("0");
				zq = jhsh.getBzzq() != null && !"".equals(jhsh.getBzzq()) ? new BigDecimal(
						jhsh.getBzzq()) : new BigDecimal("0");
				dk = jhsh.getBzdk() != null && !"".equals(jhsh.getBzdk()) ? new BigDecimal(
						jhsh.getBzdk()) : new BigDecimal("0");
				jl = jhsh.getBzjl() != null && !"".equals(jhsh.getBzjl()) ? new BigDecimal(
						jhsh.getBzjl()) : new BigDecimal("0");
				qt = jhsh.getBzqt() != null && !"".equals(jhsh.getBzqt()) ? new BigDecimal(
						jhsh.getBzqt()) : new BigDecimal("0");
				jhsh.setZtz(ztz.add(rys).add(gz).add(sz).add(cgs).add(zq)
						.add(dk).add(jl).add(qt).toString());
			}

			return insertBatch("planxdhzadd", list) == list.size();
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
		return update("plansbgj", jhsh) == 1;
	}

	@Override
	public boolean plansblm(Jhsh jhsh) {
		return update("plansblm", jhsh) == 1;
	}

	@Override
	public boolean plansbxj(Jhsh jhsh) {
		return update("plansbxj", jhsh) == 1;
	}

	@Override
	public boolean plansbyh(Jhsh jhsh) {
		return update("plansbyh", jhsh) == 1;
	}

	@Override
	public boolean plansbsh(Jhsh jhsh) {
		return update("plansbsh", jhsh) == 1;
	}

	@Override
	public boolean planshgj(Jhsh jhsh) {
		return update("planshgj", jhsh) > 0;
	}

	public boolean thwshjh(Jhsh jhsh) {
		String table = "";
		if (jhsh.getXmlx() == 1) {
			table = "jhsh_sjgz";
		}
		if (jhsh.getXmlx() == 2) {
			table = "jhsh_lmgz";
		}
		if (jhsh.getXmlx() == 3) {
			table = "jhsh_xj";
		}
		if (jhsh.getXmlx() == 4) {
			table = "jhsh_sh";
		}
		if (jhsh.getXmlx() == 5) {
			table = "jhsh_yhdzx";
		}
		jhsh.setZq(table);
		return update("thwshjh", jhsh) > 0;
	}

	@Override
	public boolean planshlm(Jhsh jhsh) {
		return update("planshlm", jhsh) > 0;
	}

	@Override
	public boolean planshxj(Jhsh jhsh) {
		return update("planshxj", jhsh) > 0;
	}

	@Override
	public boolean planshyh(Jhsh jhsh) {
		return update("planshyh", jhsh) > 0;
	}

	@Override
	public boolean planshsh(Jhsh jhsh) {
		return update("planshsh", jhsh) > 0;
	}

	@Override
	public Collection<? extends Object> queryGsdgz_dc(Jhsh jhsh, int page,
			int rows) {
		params.put("jhsh", jhsh);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryGsdgz_dc", params);
	}

	@Override
	public Collection<? extends Object> queryJhshSh_dc(Jhsh jhsh) {
		return queryList("queryJhshSh_dc", jhsh);
	}

	@Override
	public Collection<? extends Object> queryJhshYhdzx_dc(Jhsh jhsh) {
		return queryList("queryJhshYhdzx_dc", jhsh);
	}

	@Override
	public String queryylmlx(Lx lx) {
		return queryOne("queryylmlx", lx);
	}

	@Override
	public List<Excel_list> queryGsdgz_dc(Jhsh jhsh) {
		return queryList("queryGsdgz_dcexcel1", jhsh);
	}

	@Override
	public List<Excel_list> queryZhhf_dc(Jhsh jhsh) {
		return queryList("queryZhhf_dcexcel1", jhsh);
	}

	@Override
	public List<Excel_list> queryYhdzx_dc(Jhsh jhsh) {
		return queryList("queryYhdzx_dcexcel", jhsh);
	}

	@Override
	public List<Excel_list> queryYhdzxDetail_dc(Jhsh jhsh) {
		return queryList("queryYhdzxDetail_dcexcel", jhsh);
	}

	@Override
	public List<Excel_list> queryYhdzx_dc1(Jhsh jhsh) {
		return queryList("queryYhdzx_dcexcel1", jhsh);
	}

	@Override
	public List<Excel_list> queryYhdzxDetail_dc1(Jhsh jhsh) {
		return queryList("queryYhdzxDetail_dcexcel1", jhsh);
	}

	@Override
	public List<Lx> queryylxbxmbm(Jhsh jhsh) {
		return queryList("queryylxbxmbm", jhsh);
	}

	@Override
	public Jhsh queryJhshxxLmsjqxByXmbm(Jhsh jhsh) {

		return queryOne("queryJhshxxLmsjqxByXmbm", jhsh);
	}

	@Override
	public Jhsh queryJhshxxLmgzqxByXmbm(Jhsh jhsh) {

		return queryOne("queryJhshxxLmgzqxByXmbm", jhsh);
	}

	@Override
	public Jhsh queryJhshxxXjqxByXmbm(Jhsh jhsh) {

		return queryOne("queryJhshxxXjqxByXmbm", jhsh);
	}

	@Override
	public Jhsh queryJhshxxYhdzxqxByXmbm(Jhsh jhsh) {

		return queryOne("queryJhshxxYhdzxqxByXmbm", jhsh);
	}

	@Override
	public Jhsh queryJhshxxShqxByXmbm(Jhsh jhsh) {

		return queryOne("queryJhshxxShqxByXmbm", jhsh);
	}

	@Override
	public List<Lx> queryLxbyGhlxbm(String string) {
		return queryList("queryLxbyGhlxbm", string);
	}

	@Override
	public List<Jhsh> queryChildGydw(Jhsh jhsh) {
		return queryList("queryChildGydw", jhsh);
	}

	@Override
	public List<Jhsh> queryZjByGydwdm(Jhsh jhsh) {
		return queryList("queryZjByGydwdm", jhsh);
	}

	@Override
	public Jhsh queryShqxByOne(Jhsh xm) {
		return queryOne("queryShqxByOne", xm);
	}

	@Override
	public int insertShqx(List<Jhsh> save) {
		return insertBatch("insertShqx", save);
	}

	@Override
	public int updateShqx(List<Jhsh> update) {
		return updateBatch("updateShqx", update);
	}

	@Override
	public List<Jhsh> queryXmlistshqx(Jhsh jhsh) {
		return queryList("queryXmlistshqx", jhsh);
	}

	@Override
	public int queryXmlistshqxCount(Jhsh jhsh) {
		return queryOne("queryXmlistshqxCount", jhsh);
	}

	@Override
	public List<Lx> queryLxidbyGhlxbm(String string) {
		return queryList("queryLxidbyGhlxbm", string);
	}

	@Override
	public List<Jhsh> queryJhshSflgc(Jhsh jhsh) {
		return queryList("querySflgc", jhsh);
	}

	@Override
	public int queryJhshSflgcCount(Jhsh jhsh) {
		return queryOne("querySflgcCount", jhsh);
	}
	
	@Override
	public Map<String, String> queryJhshLjsyf(Jhsh jhsh) {
		if("sflsb".equals(jhsh.getXmlx1()))
		return queryOne("queryJhshLjsflsb", jhsh);
		
		
		//服务区
		if("fwqsb".equals(jhsh.getXmlx1()))
			return queryOne("queryJhshLjfwqsb", jhsh);
		if("fwqsh".equals(jhsh.getXmlx1()))
			return queryOne("queryJhshLjfwqsh", jhsh);
		if("fwqxd".equals(jhsh.getXmlx1()))
			return queryOne("queryJhshLjfwqxd", jhsh);
		
		
		else
			return null;
	}
	
	
	@Override
	public Jhsh querySflgcByXmbm(Jhsh jhsh) {
		return queryOne("querySflgcByXmbm", jhsh);
	}

	@Override
	public boolean plansflgc(Jhsh jhsh) {
		return update("plansflgc", jhsh) == 1;
	}

	@Override
	public boolean planshSflgc(Jhsh jhsh) {
		// TODO Auto-generated method stub
		return update("planshSflgc", jhsh) > 0;
	}

	@Override
	public List<Jhsh> querySflgcYap(Jhsh jhsh) {
		return queryList("querySflgcYap", jhsh);
	}

	@Override
	public List<Jhsh> querySflgcXdXmlb(Jhsh jhsh) {
		return queryList("querySflgcXdXmlb", jhsh);
	}

	@Override
	public List<Jhsh> querySflgcXdJhbz(Jhsh jhsh) {
		return queryList("querySflgcXdJhbz", jhsh);

	}

	@Override
	public boolean sflgcXmth(Jhsh jhsh) {
		return update("sflgcXmth", jhsh) > 0;
	}

	@Override
	public boolean updateSflgcXdzt(Jhsh jhsh) {
		return update("updateSflgcXdzt", jhsh) > 0;
	}

	@Override
	public List<Jhsh> queryYhzxshSb(Jhsh jhsh) {
		return queryList("queryYhzxshSb", jhsh);
	}

	@Override
	public Jhsh queryYhzxshById(Jhsh jhsh) {
		return queryOne("queryYhzxshById", jhsh);
	}

	@Override
	public boolean updateZhzxsh(Jhsh jhsh) {
		return update("updateZhzxsh", jhsh) > 0;
	}

	@Override
	public boolean yhzxshXmth(Jhsh jhsh) {
		return update("yhzxshXmth", jhsh) > 0;
	}

	@Override
	public List<Jhsh> queryYhzxshYap(Jhsh jhsh) {
		return queryList("queryYhzxshYap", jhsh);
	}

	@Override
	public List<Jhsh> queryYhzxshJhxd(Jhsh jhsh) {
		return queryList("queryYhzxshJhxd", jhsh);
	}
    
	@Override
	public List<Jhsh> listFwq(Jhsh jhsh) {
		return queryList("listFwq", jhsh);
	}
	@Override
	public int listFwqCount(Jhsh jhsh) {
		return queryOne("listFwqCount", jhsh);
	}
	
	
	@Override
	public List<Jhsh> listFwqSbzt(Jhsh jhsh) {
		return queryList("listFwqSbzt", jhsh);
	}
	
	@Override
	public int listFwqSbztCount(Jhsh jhsh) {
		return queryOne("listFwqSbztCount", jhsh);
	}
	
	@Override
	public List<Jhsh> listFwqXdzt(Jhsh jhsh) {
		return queryList("listFwqXdzt", jhsh);
	}

	@Override
	public boolean updateFwq(Jhsh jhsh) {
		return update("updateFwq", jhsh) > 0;
	}

	@Override
	public Jhsh queryFwqById(Jhsh jhsh) {
		return queryOne("queryFwqById", jhsh);
	}

	@Override
	public boolean fwqXmth(Jhsh jhsh) {
		return update("fwqXmth", jhsh) > 0;
	}

	@Override
	public List<Map<String, String>> queryszxm(Jhsh jhsh) {
		if("sflsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from SFLJH_SEW s where 1=1 ");
		}
		if("sflsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from SFLJH_SEW s where 1=1 and sbzt='1'");
		}
		if("sflxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from SFLJH_SEW s where 1=1 and shzt='1'");
		}
		if("sflcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from SFLJH_SEW s where 1=1 and xdzt='2'");
		}
		
		//养护中心
		
		if("yhzxsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from YHZXJH_SEW s where 1=1 ");
		}
		if("yhzxsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from YHZXJH_SEW s where 1=1 and sbzt='1'");
		}
		if("yhzxxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from YHZXJH_SEW s where 1=1 and shzt='1'");
		}
		if("yhzxcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from YHZXJH_SEW s where 1=1 and xdzt='2'");
		}
		
		
		//服务区
		
		if("fwqsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from FWQJH_SEW s where 1=1 ");
		}
		if("fwqsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from FWQJH_SEW s where 1=1 and sbzt='1'");
		}
		if("fwqxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from FWQJH_SEW s where 1=1 and shzt='1'");
		}
		if("fwqcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from FWQJH_SEW s where 1=1 and xdzt='2'");
		}
		
		
		return queryList("queryszxm",jhsh);
	}

	@Override
	public int queryszxmCount(Jhsh jhsh) {
		if("sflsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from SFLJH_SEW s where 1=1 ");
		}
		if("sflsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from SFLJH_SEW s where 1=1 and sbzt='1'");
		}
		if("sflxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from SFLJH_SEW s where 1=1 and shzt='1'");
		}
		if("sflcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from SFLJH_SEW s where 1=1 and xdzt='2'");
		}
		
		//养护中心
		
		if("yhzxsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from YHZXJH_SEW s where 1=1 ");
		}
		if("yhzxsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from YHZXJH_SEW s where 1=1 and sbzt='1'");
		}
		if("yhzxxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from YHZXJH_SEW s where 1=1 and shzt='1'");
		}
		if("yhzxcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from YHZXJH_SEW s where 1=1 and xdzt='2'");
		}
		
		//服务区
		
		if("fwqsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from FWQJH_SEW s where 1=1 ");
		}
		if("fwqsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from FWQJH_SEW s where 1=1 and sbzt='1'");
		}
		if("fwqxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from FWQJH_SEW s where 1=1 and shzt='1'");
		}
		if("fwqcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("from FWQJH_SEW s where 1=1 and xdzt='2'");
		}
		
		return queryOne("queryszxmCount", jhsh);
	}

	@Override
	public Map<String, String> queryJhshLjsyfs2w(Jhsh jhsh) {
		if("sflsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(tbzhj,0)),2) zbz,fun_char(sum(nvl(yxd,0)),2) yxd,fun_char(sum(nvl(bcxd,0)),2) bcxd,0 bccgs,fun_char(sum(nvl(bcxd,0)),2) bcsb,0 bcjl from SFLJH_SEW s where 1=1 ");
		}
		if("sflsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(tbzhj,0)),2) zbz,fun_char(sum(nvl(yxd,0)),2) yxd,fun_char(sum(nvl(bcxd,0)),2) bcxd,0 bccgs,fun_char(sum(nvl(bcxd,0)),2) bcsb,0 bcjl from SFLJH_SEW s where 1=1 and sbzt='1'");
		}
		if("sflxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(tbzhj,0)),2) zbz,fun_char(sum(nvl(yxd,0)),2) yxd,fun_char(sum(nvl(bcxd,0)),2) bcxd,0 bccgs,fun_char(sum(nvl(bcxd,0)),2) bcsb,0 bcjl from SFLJH_SEW s where 1=1 and shzt='1'");
		}
		if("sflcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(tbzhj,0)),2) zbz,fun_char(sum(nvl(yxd,0)),2) yxd,fun_char(sum(nvl(bcxd,0)),2) bcxd,0 bccgs,fun_char(sum(nvl(bcxd,0)),2) bcsb,0 bcjl from SFLJH_SEW s where 1=1 and xdzt='2'");
		}
		
		//养护中心
		
		if("yhzxsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(zbz,0)),2) zbz,fun_char(sum(nvl(yxd,0)),2) yxd,fun_char(sum(nvl(bcxdhj,0)),2) bcxd,0 bccgs,fun_char(sum(nvl(bcsbz,0)),2) bcsb,fun_char(sum(nvl(bcjl,0)),2) bcjl from YHZXJH_SEW s where 1=1 ");
		}
		if("yhzxsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(zbz,0)),2) zbz,fun_char(sum(nvl(yxd,0)),2) yxd,fun_char(sum(nvl(bcxdhj,0)),2) bcxd,0 bccgs,fun_char(sum(nvl(bcsbz,0)),2) bcsb,fun_char(sum(nvl(bcjl,0)),2) bcjl from YHZXJH_SEW s where 1=1 and sbzt='1'");
		}
		if("yhzxxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(zbz,0)),2) zbz,fun_char(sum(nvl(yxd,0)),2) yxd,fun_char(sum(nvl(bcxdhj,0)),2) bcxd,0 bccgs,fun_char(sum(nvl(bcsbz,0)),2) bcsb,fun_char(sum(nvl(bcjl,0)),2) bcjl from YHZXJH_SEW s where 1=1 and shzt='1'");
		}
		if("yhzxcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(zbz,0)),2) zbz,fun_char(sum(nvl(yxd,0)),2) yxd,fun_char(sum(nvl(bcxdhj,0)),2) bcxd,0 bccgs,fun_char(sum(nvl(bcsbz,0)),2) bcsb,fun_char(sum(nvl(bcjl,0)),2) bcjl from YHZXJH_SEW s where 1=1 and xdzt='2'");
		}
		
		
		//服务区
		
		if("fwqsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(ztz,0))-sum(nvl(dfzc,0)),2) zbz,0 yxd,fun_char(sum(nvl(cgs,0)),2) bcxd,fun_char(sum(nvl(cgs,0)),2) bccgs,0 bcsb,0 bcjl from FWQJH_SEW s where 1=1 ");
		}
		if("fwqsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(ztz,0))-sum(nvl(dfzc,0)),2) zbz,0 yxd,fun_char(sum(nvl(cgs,0)),2) bcxd,fun_char(sum(nvl(cgs,0)),2) bccgs,0 bcsb,0 bcjl from FWQJH_SEW s where 1=1 and sbzt='1'");
		}
		if("fwqxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(ztz,0))-sum(nvl(dfzc,0)),2) zbz,0 yxd,fun_char(sum(nvl(cgs,0)),2) bcxd,fun_char(sum(nvl(cgs,0)),2) bccgs,0 bcsb,0 bcjl from FWQJH_SEW s where 1=1 and shzt='1'");
		}
		if("fwqcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",fun_char(sum(nvl(ztz,0)),2) ztz,fun_char(sum(nvl(ztz,0))-sum(nvl(dfzc,0)),2) zbz,0 yxd,fun_char(sum(nvl(cgs,0)),2) bcxd,fun_char(sum(nvl(cgs,0)),2) bccgs,0 bcsb,0 bcjl from FWQJH_SEW s where 1=1 and xdzt='2'");
		}
		
		return queryOne("queryszxmlj", jhsh);
	}

	@Override
	public int listFwqXdztCount(Jhsh jhsh) {
		return queryOne("listFwqXdztCount", jhsh);
	}
	
	//jhsh.setTiaojian("FROM JHSH_SFL JH LEFT JOIN SGT_SFL ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID WHERE 1=1 ");

	
	@Override
	public List<Map<String, String>> querySzxmList(Jhsh jhsh) {
		//示范路
		if("sflsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1 ");
		}
		if("sflsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.sbzt='1'");
		}
		if("sflxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1'");
		}
		if("sflcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1' and fun_scxdnf(jh.xmbm) is not null");
		}
		
		//养护中心
		if("yhzxsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",wn.jsxz,sg.xmnf FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1 ");
		}
		if("yhzxsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",wn.jsxz,sg.xmnf FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.sbzt='1'");
		}
		if("yhzxxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",wn.jsxz,sg.xmnf FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1'");
		}
		if("yhzxcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",wn.jsxz,sg.xmnf FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1' and fun_scxdnf(jh.xmbm) is not null");
		}
		
		
		//服务区
		if("fwqsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1 ");
		}
		if("fwqsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.sbzt='1'");
		}
		if("fwqxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1'");
		}
		if("fwqcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1' and fun_scxdnf(jh.xmbm) is not null");
		}
		
		
		return queryList("querySzxmList",jhsh);
	}

	@Override
	public int querySzxmListCount(Jhsh jhsh) {
		//示范路
		if("sflsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1 ");
		}
		if("sflsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.sbzt='1'");
		}
		if("sflxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1'");
		}
		if("sflcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1' and fun_scxdnf(jh.xmbm) is not null");
		}
		
		//养护中心
		if("yhzxsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1 ");
		}
		if("yhzxsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.sbzt='1'");
		}
		if("yhzxxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1'");
		}
		if("yhzxcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1' and fun_scxdnf(jh.xmbm) is not null");
		}
		
		
		//服务区
		if("fwqsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1 ");
		}
		if("fwqsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.sbzt='1'");
		}
		if("fwqxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1'");
		}
		if("fwqcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1' and fun_scxdnf(jh.xmbm) is not null");
		}
		
		
		return queryOne("querySzxmListCount", jhsh);
	}

	
	@Override
	public Map<String, String> queryJhshLjSzxm(Jhsh jhsh) {
		//示范路
		if("sflsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.tbz,0)),2),0) zbz FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1 ");
		}
		if("sflsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.tbz,0)),2),0) zbz FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.sbzt='1'");
		}
		if("sflxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.tbz,0)),2),0) zbz,nvl(fun_char(sum(nvl(xdztz, 0)), 2), 0) xdztz, nvl(fun_char(sum(nvl(xdstz, 0)), 2), 0) xdstz,nvl(fun_char(sum(nvl(xddfzc, 0)), 2), 0) xddfzc FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid left join (select xmid,sum(ztz) xdztz,sum(stz) xdstz,sum(dfzc) xddfzc from plan_zjxd p where jhxdwh is not null group by xmid) xd on jh.xmbm=xd.xmid WHERE 1=1  and jh.shzt='1'");
		}
		if("sflcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.tbz,0)),2),0) zbz,nvl(fun_char(sum(nvl(xdztz, 0)), 2), 0) xdztz, nvl(fun_char(sum(nvl(xdstz, 0)), 2), 0) xdstz,nvl(fun_char(sum(nvl(xddfzc, 0)), 2), 0) xddfzc FROM JHSH_SFL JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid left join (select xmid,sum(ztz) xdztz,sum(stz) xdstz,sum(dfzc) xddfzc from plan_zjxd p where jhxdwh is not null group by xmid) xd on jh.xmbm=xd.xmid WHERE 1=1  and jh.shzt='1' and fun_scxdnf(jh.xmbm) is not null");
		}
		
		//养护中心
		if("yhzxsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.jbzj,0)),2),0) zbz FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1 ");
		}
		if("yhzxsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.jbzj,0)),2),0) zbz FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.sbzt='1'");
		}
		if("yhzxxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.jbzj,0)),2),0) zbz,nvl(fun_char(sum(nvl(xdztz, 0)), 2), 0) xdztz, nvl(fun_char(sum(nvl(xdjl, 0)), 2)-sum(nvl(xdstz, 0)), 0) xdstz,nvl(fun_char(sum(nvl(xdjl, 0)), 2), 0) xdjl,nvl(fun_char(sum(nvl(xddfzc, 0)), 2), 0) xddfzc FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid left join (select xmid,sum(ztz) xdztz,sum(stz) xdstz,sum(zddzjl) xdjl,sum(dfzc) xddfzc from plan_zjxd p where jhxdwh is not null group by xmid) xd on jh.xmbm=xd.xmid WHERE 1=1  and jh.shzt='1'");
		}
		if("yhzxcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.jbzj,0)),2),0) zbz,nvl(fun_char(sum(nvl(xdztz, 0)), 2), 0) xdztz, nvl(fun_char(sum(nvl(xdjl, 0)), 2)-sum(nvl(xdstz, 0)), 0) xdstz,nvl(fun_char(sum(nvl(xdjl, 0)), 2), 0) xdjl,nvl(fun_char(sum(nvl(xddfzc, 0)), 2), 0) xddfzc FROM JHSH_YHZX JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid left join (select xmid,sum(ztz) xdztz,sum(stz) xdstz,sum(zddzjl) xdjl,sum(dfzc) xddfzc from plan_zjxd p where jhxdwh is not null group by xmid) xd on jh.xmbm=xd.xmid WHERE 1=1  and jh.shzt='1' and fun_scxdnf(jh.xmbm) is not null");
		}
		
		
		//服务区
		if("fwqsb".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.cgs,0)),2),0) zbz FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1 ");
		}
		if("fwqsh".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.cgs,0)),2),0) zbz FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.sbzt='1'");
		}
		if("fwqxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.cgs,0)),2),0) zbz,nvl(fun_char(sum(nvl(xdztz, 0)), 2), 0) xdztz, nvl(fun_char(sum(nvl(xdcgs, 0)), 2), 0) xdcgs,nvl(fun_char(sum(nvl(xddfzc, 0)), 2), 0) xddfzc FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid left join (select xmid,sum(ztz) xdztz,sum(btzzj) xdcgs,sum(dfzc) xddfzc from plan_zjxd p where jhxdwh is not null group by xmid) xd on jh.xmbm=xd.xmid WHERE 1=1  and jh.shzt='1'");
		}
		if("fwqcx".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian(",nvl(fun_char(sum(nvl(jh.ztz,0)),2),0) ztz,nvl(fun_char(sum(nvl(jh.cgs,0)),2),0) zbz,nvl(fun_char(sum(nvl(xdztz, 0)), 2), 0) xdztz, nvl(fun_char(sum(nvl(xdcgs, 0)), 2), 0) xdcgs,nvl(fun_char(sum(nvl(xddfzc, 0)), 2), 0) xddfzc FROM JHSH_FWQ JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid left join (select xmid,sum(ztz) xdztz,sum(btzzj) xdcgs,sum(dfzc) xddfzc from plan_zjxd p where jhxdwh is not null group by xmid) xd on jh.xmbm=xd.xmid WHERE 1=1  and jh.shzt='1' and fun_scxdnf(jh.xmbm) is not null");
		}
		
		
		return queryOne("queryJhshLjSzxm",jhsh);
	}
	
	@Override
	public List<Map<String, String>> querySzxmxdbz(Jhsh jhsh) {
		//示范路
		if("sflxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM jhxd_sfl JH LEFT JOIN SGT_SFL sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_SFL WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1' AND JH.XDZTTJ!='已完成'");
		}
		
		//养护中心
		if("yhzxxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM jhxd_yhzx JH LEFT JOIN SGT_YHZX sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_YHZX WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1' AND JH.XDZTTJ!='已完成'");
		}
		
		//服务区
		if("fwqxd".equals(jhsh.getXmlx1())) {
			jhsh.setTiaojian("FROM jhxd_fwq JH LEFT JOIN SGT_FWQ sg ON JH.XMBM=SG.XMBM LEFT JOIN WNJH_FWQ WN ON SG.XMKID=WN.ID left join szxmzd sz on wn.id=sz.xmkid WHERE 1=1  and jh.shzt='1' AND JH.XDZTTJ!='已完成'");
		}
		
		return queryList("querySzxmxdbz",jhsh);
	}
	
	
	
	@Override
	public boolean updateJhshInfo(Jhsh jhsh) {
		if("sfl".equals(jhsh.getXmlxs()))
		return update("updateJhshSflInfo",jhsh)==1;
		else if("yhzx".equals(jhsh.getXmlxs()))
			return update("updateJhshYhzxInfo",jhsh)==1;
		else if("fwq".equals(jhsh.getXmlxs()))
			return update("updateJhshFwqInfo",jhsh)==1;
		else
			return false;
	}

	@Override
	public boolean sbshSzxm(Jhsh jhsh) {
		if("sfl".equals(jhsh.getXmlxs()))
			return update("sbshSzxmsfl",jhsh)>=1;
			else if("yhzx".equals(jhsh.getXmlxs()))
				return update("sbshSzxmyhzx",jhsh)>=1;
			else if("fwq".equals(jhsh.getXmlxs()))
				return update("sbshSzxmfwq",jhsh)>=1;
			else
				return false;
	}

	@Override
	public List<Excel_list> exportSflgcExcel(Jhsh jhsh) {
		return queryList("exportSflgcExcel", jhsh);
	}

	@Override
	public List<Excel_list> exportFwqjhExcel(Jhsh jhsh) {
		return queryList("exportFwqjhExcel", jhsh);
	}

	@Override
	public List<Excel_list> exportYhzxjhExcel(Jhsh jhsh) {
		return queryList("exportYhzxjhExcel", jhsh);
	}

	@Override
	public List<Excel_list> exportLsjlSearchExcel(Lx lx) {
		
		List<Excel_list> result = new ArrayList<Excel_list>();
		
		result = queryList("exportLsjlSearchExcel", lx);
		
		int rowNum = result.size();
		
		if (!"".equals(lx.getGhlxbm())) {
			if ("".equals(lx.getGhqdzh()))
				lx.setGhqdzh("0");
			if ("".equals(lx.getGhzdzh()))
				lx.setGhzdzh("9999");
			
			List<Lx> l = queryList("getgxlxbyzh", lx);
			
			if (l.size() > 0)
				for (Lx lx2 : l) {
					lx.setLxbm(null);
					lx.setQdzh(null);
					lx.setZdzh(null);
					lx.setGhlxbm(lx2.getLxbm());
					lx.setGhqdzh(lx2.getQdzh());
					lx.setGhzdzh(lx2.getZdzh());
					
					List<Excel_list> l2 = queryList("exportLsjlSearchExcel", lx);
					
					for(int i = 0; i < l2.size();i++) {
						rowNum ++;
						l2.get(i).setV_0(rowNum+"");
					}	
					result.addAll(l2);
				}
		}
		// queryLsjlListnew(result, lx);
		
		
		return result;
	}

	@Override
	public List<Excel_list> exportJhshShSbExcel(Jhsh jhsh) {
		List<Excel_list> result = new ArrayList<Excel_list>();                                                                                                                                                              
		result = queryList("exportJhshShSbTotalExcel", jhsh);
		int rowNum = 0;
		List<Excel_list> l2 = queryList("exportJhshShSbExcel", jhsh);
		for(int i = 0; i < l2.size();i++) {
			rowNum ++;
			l2.get(i).setV_0(rowNum+"");
		}
		result.addAll(l2);		
		return result;
	}

	@Override
	public List<Excel_list> queryJhshYhdzx_dcExcel(Jhsh jhsh) {
		List<Excel_list> result = new ArrayList<Excel_list>();                                                                                                                                                              
        result = queryList("exportJhshYhdzxTotalExcel", jhsh);
        int rowNum = 0;
		List<Excel_list> l2 = queryList("exportJhshYhdzxDetailExcel", jhsh);
		for(int i = 0; i < l2.size();i++) {
			rowNum ++;
			l2.get(i).setV_0(rowNum+"");
		}	
		result.addAll(l2);
		return result;
	}
}
