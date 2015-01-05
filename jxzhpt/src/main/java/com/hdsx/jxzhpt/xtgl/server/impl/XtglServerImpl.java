package com.hdsx.jxzhpt.xtgl.server.impl;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.utile.AnyChartUtil;
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

	@Override
	public List<Param> selectTsdqList(Param param) {
		return queryList("selectTsdqList", param);
	}

	@Override
	public int selectXzqhListCount(Unit unit) {
		return queryOne("selectXzqhListCount", unit);
	}

	@Override
	public List<Unit> selectXzqhList(Unit unit) {
		return queryList("selectXzqhList", unit);
	}

	@Override
	public String createGsAnyChartXml(Param param) {
		
		Map<String,Object> parameter=new HashMap<String,Object>();
		List<HashMap<String, String>> l=new ArrayList<HashMap<String,String>>();
		String[] arr={"安保","水毁","工程改造"};
		int[] arr2={10,23,45};
		for(int i=0;i<3;i++){
			HashMap<String, String> hm=new HashMap<String, String>();
			hm.put("name", arr[i]);
			hm.put("size", arr2[i]+"");
			l.add(hm);
		}
		parameter.put("chart_title", "项目数量统计");//title
		String yName="里程";//y单位
		int precision=0;//小数的位数
		parameter.put("yName", yName);
		parameter.put("precision",precision);
		parameter.put("list",l);
		String chartType = "";
		chartType="pie.ftl";
		return AnyChartUtil.getAnyChartXml(chartType, parameter);
	}

	@Override
	public List<Unit> checkXzqhCfById(Unit unit) {
		return queryList("checkXzqhCfById", unit);
	}

	@Override
	public boolean insertXzqh(Unit unit) {
		int b=insert("insertXzqh", unit);
		return b>0?true:false;
	}

	@Override
	public boolean updateXzqh(Unit unit) {
		int b=update("updateXzqh", unit);
		return b>0?true:false;
	}

	@Override
	public boolean deleteXzqhById(Unit unit) {
		int b=delete("deleteXzqhById", unit);
		return b>0?true:false;
	}

	@Override
	public boolean updateTsdqZt(Param param) {
		int b=update("updateTsdqZt", param);
		return b>0?true:false;
	}

	@Override
	public List<TreeNode> selAllTsdq2(String yhdw) {
		return queryList("selAllTsdq2", yhdw);
	}

	@Override
	public List<TreeNode> selAllTsdq(String yhdw) {
		return queryList("selAllTsdq", yhdw);
	}

	@Override
	public boolean insertTsdq(Param param) {
		String id=UUID.randomUUID().toString();
		param.setId(id);
		List<HashMap<String, String>> nl=new ArrayList<HashMap<String,String>>();
		String[] arr=param.getXzqhdm().split(",");
		String[] arr2=param.getXzqh().split(",");
		for(int i=0;i<arr.length;i++){
			HashMap<String, String> hm=new HashMap<String, String>();
			hm.put("parent", id);
			hm.put("xzqhdm", arr[i]);
			hm.put("xzqh", arr2[i]);
			nl.add(hm);
		}
		if(insert("insertTsdq", param)>0){
			if(insertBatch("insertTsdqList", nl)>0){
				return true;
			}else return false;
		}else return false;
	}
}
