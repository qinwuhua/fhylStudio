package com.hdsx.jxzhpt.xtgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.jxzhpt.xtgl.bean.Param;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.jxzhpt.xtgl.bean.Unit;
import com.hdsx.jxzhpt.xtgl.server.XtglServer;

@Service
public class XtglServerImpl extends BaseOperate  implements XtglServer{

	public XtglServerImpl() {
		super("xtgl", "jdbc");
	}
	
	@Override
	public boolean czPassword(Master master) {
		int i = update("czPassword",master);
		if(i>=0) return true;
		return false;
	}

	@Override
	public List<TreeNode> seldw(String yhdw) {
		return  queryList("seldw",yhdw);
	}

	@Override
	public List<TreeNode> selchildedw(String yhdw) {
		return  queryList("selchildedw",yhdw);
	}

	@Override
	public boolean updatePassword(HashMap hm) {
		if (update("updatePassword", hm) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public HashMap<String, String> login(HashMap hm) {
		HashMap lhm=queryOne("loginnum",hm);
		return lhm;
	}

	@Override
	public List<TreeNode> selAllXzqh2(String yhdw) {
		return queryList("selAllXzqh2",yhdw);
	}

	@Override
	public List<TreeNode> selAllXzqh(String yhdw) {
		return queryList("selAllXzqh",yhdw);
	}

	@Override
	public int selectYhListCount(HashMap hm) {
		return queryOne("selectYhListCount", hm);
	}

	@Override
	public List<Master> selectYhList(HashMap hm) {
		return queryList("selectYhList", hm);
	}

	@Override
	public List<HashMap> selQxList(HashMap hm) {
		return queryList("selQxList", hm);
	}

	@Override
	public boolean insertYh(Master master) {
		int b=insert("insertYh", master);
		return b>0?true:false;
	}

	@Override
	public boolean updatezt(HashMap hm) {
		int b=update("updatezt", hm);
		return b>0?true:false;
	}

	@Override
	public boolean deleteYh(String id) {
		int b=delete("deleteYh",id);
		return b>0?true:false;
	}

	@Override
	public boolean mimareset(HashMap hm) {
		int b=update("mimareset", hm);
		return b>0?true:false;
	}

	@Override
	public boolean updateYh(Master master) {
		int b=update("updateYh", master);
		return b>0?true:false;
	}

	@Override
	public List<Param> selectJsList(Param param) {
		return queryList("selectJsList", param);
	}

	@Override
	public boolean insertJs(Param param) {
		UUID uuid = UUID.randomUUID();
		param.setId(uuid.toString());
		List<Param> l=new ArrayList<Param>();
		String[] s=param.getSource().split(";");
		for (int i=0;i<s.length;i++){
			Param p=new Param();
			p.setRoleid(uuid.toString());
			p.setSourceid(s[i]);
			l.add(p);
		}
		if (insert("insertJs", param) > 0) {
			if(insertBatch("insertRoleSourceBatch", l)>0) return true;
			else return false;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteJsById(Param param) {
		if (delete("deleteJsById",param) > 0) {
			if(delete("deleteRoleSourceById",param)>0) return true;
			else return false;
		} else {
			return false;
		}
	}

	@Override
	
	public int selectDwListCount(Unit unit) {
		return queryOne("selectDwListCount", unit);
	}

	@Override
	public List<Unit> selectDwList(Unit unit) {
		return queryList("selectDwList", unit);
	}

	@Override
	public List<TreeNode> getBmbmTreeByName(HashMap<String, String> hm) {
		return queryList("getBmbmTreeByName", hm);
	}

	@Override
	public boolean insertDw(Unit unit) {
		int b=insert("insertDw", unit);
		int b2;
		if(b>0){
			if("1.企业".equals(unit.getJglx())) b2=insert("insertQY", unit);
			else if("2.事业单位".equals(unit.getJglx())||"9.其它组织机构".equals(unit.getJglx())) b2=insert("insertXzsy", unit);
		}
		return b>0?true:false;
	}

	@Override
	public boolean deleteDwById(Unit unit) {
		int b=delete("deleteDwById", unit);
		return b>0?true:false;
	}

	@Override
	public List<Unit> selectDwById(Unit unit) {
		return queryList("selectDwById", unit);
	}

	@Override
	public boolean updateDw(Unit unit) {
		int b=update("updateDw", unit);
		return b>0?true:false;
	}

	@Override
	public int selectBmbmListCount(Unit unit) {
		return queryOne("selectBmbmListCount", unit);
	}

	@Override
	public List<Unit> selectBmbmList(Unit unit) {
		return queryList("selectBmbmList", unit);
	}

	@Override
	public boolean insertBmbm(Unit unit) {
		int b=insert("insertBmbm", unit);
		return b>0?true:false;
	}

	@Override
	public boolean updateBmbm(Unit unit) {
		int b=update("updateBmbm", unit);
		return b>0?true:false;
	}

	@Override
	public boolean deleteBmbmById(Unit unit) {
		int b=delete("deleteBmbmById", unit);
		return b>0?true:false;
	}

	@Override
	public List<Master> checkname(HashMap hm) {
		return queryList("checkname",hm);
	}
}
