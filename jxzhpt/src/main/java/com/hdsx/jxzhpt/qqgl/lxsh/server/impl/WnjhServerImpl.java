package com.hdsx.jxzhpt.qqgl.lxsh.server.impl;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.xml.crypto.dsig.keyinfo.RetrievalMethod;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Wqbzbz;
import com.hdsx.jxzhpt.qqgl.lxsh.server.LxshServer;
import com.hdsx.jxzhpt.qqgl.lxsh.server.WnjhServer;
import com.hdsx.jxzhpt.utile.CalculateGrantsAndAwards;
import com.hdsx.jxzhpt.utile.MyUtil;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.server.DbyhServer;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.wjxt.server.ZdxxServer;
import com.hdsx.jxzhpt.wjxt.server.ZhqkServer;

import jsx3.gui.DatePicker;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class WnjhServerImpl extends BaseOperate implements WnjhServer {
	public WnjhServerImpl() {
		super("wnjh", "jdbc");
	}
	private List<Map<String,Object>> lm;
	private Map<String,Object> hm;
	@Override
	public List<Lxsh> selectGjwnjh(Lxsh lxsh) {
		return queryList("selectGjwnjh", lxsh);
	}
	@Override
	public int selectGjwnjhCount(Lxsh lxsh) {
		return queryOne("selectGjwnjhCount", lxsh);
	}
	@Override
	public List<Lxsh> selectGsdwnjh(Lxsh lxsh) {
		return queryList("selectGsdwnjh", lxsh);
	}
	@Override
	public int selectGsdwnjhCount(Lxsh lxsh) {
		return queryOne("selectGsdwnjhCount", lxsh);
	}
	@Override
	public List<Lxsh> wnjhGpsroad(Lxsh lxsh) {
		return queryList("wnjhGpsroad", lxsh);
	}
	@Override
	public Lxsh wnjhGpsroad1(Lxsh lxsh) {
		return queryOne("wnjhGpsroad1", lxsh);
	}
	@Override
	public boolean insertGjwnjh(Lxsh lxsh) {
		String id=MyUtil.getUuid();
		lxsh.setId(id);
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		return insert("insertGjwnjh", lxsh)==1&&insert("insertlx", lxsh)==1;
	}
	
	@Override
	public boolean insertMethd(String arg,Object obj){
		return insert(arg, obj)>0;
	}
	@Override
	public boolean insertLmwnjh(Lxsh lxsh) {
		String id=MyUtil.getUuid();
		lxsh.setId(id);
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		return insert("insertLmwnjh", lxsh)==1&&insert("insertlx", lxsh)==1;
	}
	@Override
	public boolean insertXjwnjh(Lxsh lxsh) {
		String id=MyUtil.getUuid();
		lxsh.setId(id);
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		return insert("insertXjwnjh", lxsh)==1&&insert("insertlx", lxsh)==1;
	}
	@Override
	public boolean importsjgzwnjh(List<Map> data) {
		if(insertBatch("importsjgzwnjhlx", data)==data.size()&&insertBatch("importsjgzwnjh", data)==data.size())
			return true;
			else return false;
	}
	@Override
	public boolean importlmgzwnjh(List<Map> data) {
		if(insertBatch("importlmgzwnjhlx", data)==data.size()&&insertBatch("importlmgzwnjh", data)==data.size())
			return true;
			else return false;
	}
	@Override
	public boolean importxjwnjh(List<Map> data) {
		if(insertBatch("importxjwnjhlx", data)==data.size()&&insertBatch("importxjwnjh", data)==data.size())
			return true;
			else return false;
	}
	@Override
	public List<Excel_list> querywnjhSjgz(Lxsh lxsh) {
		return queryList("querywnjhSjgz", lxsh);
	}
	@Override
	public List<Excel_list> querywnjhGsdgz(Lxsh lxsh) {
		return queryList("querywnjhGsdgz", lxsh);
	}
	@Override
	public List<Excel_list> querywnjhLmgz(Lxsh lxsh) {
		return queryList("querywnjhLmgz", lxsh);
	}
	@Override
	public List<Excel_list> querywnjhXj(Lxsh lxsh) {
		return queryList("querywnjhXj", lxsh);
	}
	@Override
	public boolean delwnjhSjgz(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delwnjhSjgz", lm)>0&&deleteBatch("delwnjhSjgzlx", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean delwnjhLmgz(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delwnjhLmgz", lm)>0&&deleteBatch("delwnjhSjgzlx", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean delwnjhXj(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delwnjhXj", lm)>0&&deleteBatch("delwnjhSjgzlx", lm)>0) return true;
		else return false;
	}
	@Override
	public Lxsh cxwnghsjByid(Lxsh lxsh) {
		return queryOne("cxwnghsjByid", lxsh);
	}
	@Override
	public Lxsh cxwnghlmByid(Lxsh lxsh) {
		return queryOne("cxwnghlmByid", lxsh);
	}
	@Override
	public Lxsh cxwnghxjByid(Lxsh lxsh) {
		return queryOne("cxwnghxjByid", lxsh);
	}
	@Override
	public boolean updatewnjhsj(Lxsh lxsh) {
		update("updateSjgzlx", lxsh);
		String id=queryOne("querywnjhlxid", lxsh);
		lxsh.setId(id);
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		if(update("updateSjgz", lxsh)>0){
			return true;
		}
		else
		return false;
	}
	@Override
	public boolean updatewnjhlm(Lxsh lxsh) {
		update("updateSjgzlx", lxsh);
		String id=queryOne("querywnjhlxid", lxsh);
		lxsh.setId(id);
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		
		if(update("updateLmgz", lxsh)>0){
			return true;
		}
		else
		return false;
	}
	@Override
	public boolean updatewnjhxj(Lxsh lxsh) {
		update("updateSjgzlx", lxsh);
		String id=queryOne("querywnjhlxid", lxsh);
		lxsh.setId(id);
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		if(update("updateXj", lxsh)>0){
			return true;
		}
		else
		return false;
	}
	@Override
	public void updateLx(Lx lx) {
		update("updateLx", lx);
	}
	@Override
	public List<Lxsh> selectlxbyxmid1(Lxsh lxsh) {
		return queryList("selectlxbyxmid1", lxsh);
	}
	@Override
	public Lxsh sfylx(Lxsh lxsh) {
		return queryOne("sfylx", lxsh);
	}
	@Override
	public List<Lxsh> selectSjgzlxList(Lxsh lxsh) {
		return queryList("selectSjgzlxList", lxsh);
	}
	@Override
	public int selectSjgzlxListCount(Lxsh lxsh) {
		return queryOne("selectSjgzlxListCount", lxsh);
	}
	@Override
	public List<Lxsh> selectLmwnjh(Lxsh lxsh) {
		return queryList("selectLmwnjh", lxsh);
	}
	@Override
	public int selectLmwnjhCount(Lxsh lxsh) {
		return queryOne("selectLmwnjhCount", lxsh);
	}
	@Override
	public Lxsh qqglGpszh(Lxsh lxsh) {
		return queryOne("qqglGpszh", lxsh);
	}
	@Override
	public List<Lxsh> selectXjwnjh(Lxsh lxsh) {
		return queryList("selectXjwnjh", lxsh);
	}
	@Override
	public int selectXjwnjhCount(Lxsh lxsh) {
		return queryOne("selectXjwnjhCount", lxsh);
	}
	@Override
	public Lxsh selectGjwnjhcf(Lxsh lxsh) {
		return queryOne("selectGjwnjhcf", lxsh);
	}
	@Override
	public Lxsh selectLmwnjhcf(Lxsh lxsh) {
		return queryOne("selectLmwnjhcf", lxsh);
	}
	@Override
	public Lxsh selectXjwnjhcf(Lxsh lxsh) {
		return queryOne("selectXjwnjhcf", lxsh);
	}
	@Override
	public boolean insertGjlxwnjh(Lxsh lxsh) {
		if("是".equals(lxsh.getLsjl())){
			update("updateGjlsjl", lxsh);
		}
		String id=MyUtil.getUuid();
		lxsh.setId(id);
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		return insert("insertGjlxwnjh", lxsh)==1;
	}
	@Override
	public boolean updatewnjhsjlx(Lxsh lxsh) {
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		return update("updatewnjhsjlx", lxsh)==1;
	}
	@Override
	public boolean deleteWnlx(Lxsh lxsh) {
		return update("deleteWnlx", lxsh)==1;
	}
	@Override
	public Lxsh showgjtj(Lxsh lxsh) {
		return queryOne("showgjtj", lxsh);
	}
	@Override
	public Lxsh showgsdtj(Lxsh lxsh) {
		return queryOne("showgsdtj", lxsh);
	}
	@Override
	public Lxsh showlmtj(Lxsh lxsh) {
		return queryOne("showlmtj", lxsh);
	}
	@Override
	public Lxsh showxjtj(Lxsh lxsh) {
		return queryOne("showxjtj", lxsh);
	}
	@Override
	public List<Lxsh> selectJxAndGj(Lxsh lxsh) {
		return queryList("selectJxAndGj",lxsh);
	}
	@Override
	public List<Map<String, Object>> selectYlx(Lxsh lxsh) {
		return queryList("selectYlx",lxsh);
	}
	@Override
	public List<Map<String, Object>> selectYSj(String xzqhdm,String xzqhmc) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("xzqhdm", xzqhdm);
		params.put("xzqhmc", xzqhmc);
		return queryList("selectYSj", params);
	}
	@Override
	public List<Map<String, Object>> selectGhSj(String xzqhdm,boolean qb) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("xzqhdm", xzqhdm);
		params.put("qb", qb);
		return queryList("selectGhSj", params);
	}
	@Override
	public Lxsh getWngjinfobyid(String xmbm) {
		return queryOne("getWngjinfobyid", xmbm);
	}
	@Override
	public Lxsh getWnlminfobyid(String xmbm) {
		return queryOne("getWnlminfobyid", xmbm);
	}
	@Override
	public Lxsh getWnxjinfobyid(String xmbm) {
		return queryOne("getWnxjinfobyid", xmbm);
	}
	@Override
	public boolean updateWnxmjd(Lxsh lxsh) {
		String tbname="";
		String tbname1="";
		if("1".equals(lxsh.getXmlx())){
			tbname="wnjh_sjgz";
			tbname1="lxsh_sjgz";
			lxsh.setBz(tbname);
			lxsh.setBzcs(tbname1);
			return update("updateWnxmjd_sjgz", lxsh)>0;
		}
		else {
			if("2".equals(lxsh.getXmlx())){
			tbname="wnjh_lmgz";
			tbname1="lxsh_lmgz";
			}
		    if("3".equals(lxsh.getXmlx())){
			tbname="wnjh_xj";
			tbname1="lxsh_xj";
			}
		lxsh.setBz(tbname);
		lxsh.setBzcs(tbname1);
		return update("updateWnxmjd", lxsh)>0;
		}
		
	}
	@Override
	public List<Excel_list> ckylwjg(Lxsh lxsh) {
		if("按地市".equals(lxsh.getTjfl())){
			return queryList("ckylwjgads",lxsh);
		}else{
			return queryList("ckylwjgalx",lxsh);
		}
	}
	@Override
	public List<Excel_list> ckxlwjg(Lxsh lxsh) {
		lxsh.setXmbm("'"+lxsh.getXmbm().replaceAll(",", "','")+"'");
		if("按地市".equals(lxsh.getTjfl())){
			return queryList("ckxlwjgads",lxsh);
		}else{
			return queryList("ckxlwjgalx",lxsh);
		}
		
		
	}
	@Override
	public List<Excel_list> xljgbh(Lxsh lxsh) {
		lxsh.setXmbm("'"+lxsh.getXmbm().replaceAll(",", "','")+"'");
		if("按地市".equals(lxsh.getTjfl())){
			return queryList("xljgbhads",lxsh);
		}else{
			return queryList("xljgbhalx",lxsh);
		}
	}
	
	@Override
	public List<Lxsh> selectGsdxzxm(Lxsh lxsh) {
		return queryList("selectGsdxzxm", lxsh);
	}
	@Override
	public List<Lxsh> selectGsdyxzxm(Lxsh lxsh) {
		return queryList("selectGsdyxzxm", lxsh);
	}
	@Override
	public Lxsh cxwnxmkbyxmbm(Lxsh lxsh) {
		return queryOne("cxwnxmkbyxmbm", lxsh);
	}
	@Override
	public List<Lxsh> queryTjbxx(Lxsh lxsh) {
		List<Lxsh> result = new ArrayList<Lxsh>();
		result = queryList("queryTjbxx", lxsh);
		for(int i = 0; i < result.size();i++) {
	        List<String> xzqhStr = new  ArrayList<String>();
			String buf = "";
			int a = result.get(i).getXzqh().indexOf("市")+1;
			
			if (result.get(i).getXzqh().contains(",")) {
				
				String[] strs=result.get(i).getXzqh().split(",");
				
				for(int j=0;j<strs.length;j++){
					xzqhStr.add(strs[j]);
		        }
	            List<String> newList = new ArrayList<String>(new HashSet<String>(xzqhStr));
	            for(int x = 0; x<newList.size(); x++) {
	            	buf=buf+newList.get(x).substring(a)+",";
					result.get(i).setXzqh(buf.substring(0, buf.length()-1));
				}
			}else {
				String subs = result.get(i).getXzqh().substring(a);
				result.get(i).setXzqh(subs);
			}
			
			if (result.get(i).getCgs() == null || result.get(i).getCgs()=="") {
				//计算部级补助标准
				String ministryGrants = String.valueOf(CalculateGrantsAndAwards.calculateGrantsFromMinistry(
						result.get(i).getGhlxbm(),result.get(i).getXzqhdm(),result.get(i).getXmklx(),result.get(i).getJsxz(),result.get(i).getTsdq(),
						result.get(i).getZtz(),result.get(i).getJaf(),result.get(i).getJhyilc(),result.get(i).getJherlc(),result.get(i).getJhsanlc()));
				result.get(i).setCgs(ministryGrants);
			}
			if (result.get(i).getSbzzj() == null || result.get(i).getSbzzj()=="") {
				//计算省级补助标准
				String provinceGrants = String.valueOf(CalculateGrantsAndAwards.calculateGrantsFromProvince(result.get(i).getGhlxbm(),result.get(i).getXmklx(),
    					result.get(i).getJsxz(),result.get(i).getZtz(),result.get(i).getJaf(),result.get(i).getJhyilc(),result.get(i).getJherlc(),result.get(i).getJhsanlc()));
				result.get(i).setSbzzj(provinceGrants);

			}
            if (result.get(i).getSjl() == null || result.get(i).getSjl()=="") {
    			//计算省级奖励
    			String provinceAwards = String.valueOf(CalculateGrantsAndAwards.calculateAwardsFromProvince(result.get(i).getGhlxbm(),result.get(i).getXmklx(),
    					result.get(i).getJsxz(),result.get(i).getJhyilc(),result.get(i).getJherlc(),result.get(i).getJhsanlc()));
    		    result.get(i).setSjl(provinceAwards);
			}
		}
		return result;
	}
		
	@Override
	public boolean insertOrUpdateWnqqtjb(String json) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			List<Lxsh> list = mapper.readValue(json,new TypeReference<List<Lxsh>>(){});
		    for(Lxsh lxsh : list){
				update("insertOrUpdateWnqqtjb", lxsh);
		    }			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	@Override
	public List<Excel_list> exportWnqqtjExcel(Lxsh lxsh){
		List<Excel_list> result = new ArrayList<Excel_list>();
		//ObjectMapper mapper = new ObjectMapper();
        try {
			//List<Lxsh> cgs = mapper.readValue(lxsh.getCgs(),new TypeReference<List<Lxsh>>() { });
			int rowNum = 0; 
			result = queryList("exportWnqqtjExcel", lxsh);
			for(int i = 0; i < result.size();i++) {
				rowNum ++;
				result.get(i).setV_0(rowNum+"");	
				/*if (result.get(i).getV_25()==""||result.get(i).getV_25()==null) {
					result.get(i).setV_25(cgs.get(i).getCgs());
				}*/
		        List<String> xzqhStr  =   new  ArrayList<String>();
				String buf = "";
				int a = result.get(i).getV_2().indexOf("市")+1;
				if (result.get(i).getV_2().contains(",")) {
					String[] strs=result.get(i).getV_2().split(",");
					for(int j=0;j<strs.length;j++){
						xzqhStr.add(strs[j]);
			           }
					List<String> newList = new ArrayList<String>(new HashSet<String>(xzqhStr));
		            for(int x = 0; x<newList.size(); x++) {
		            	buf=buf+newList.get(x).substring(a)+",";
						result.get(i).setV_2(buf.substring(0, buf.length()-1));
					}
				}else {
					String subs = result.get(i).getV_2().substring(a);
					result.get(i).setV_2(subs);
				}	
				
				if (result.get(i).getV_25() == null || result.get(i).getV_25()=="") {
					//计算部级补助标准
					String ministryGrants = String.valueOf(CalculateGrantsAndAwards.calculateGrantsFromMinistry(
							result.get(i).getV_3(),//规划路线编码
							result.get(i).getV_1(),//行政区划
							result.get(i).getV_46(),//项目库类型
							result.get(i).getV_10(),//建设性质
							result.get(i).getV_7(),//特殊地区
							result.get(i).getV_24(),//总投资
							result.get(i).getV_45(),//建安费
							result.get(i).getV_18(),//一级
							result.get(i).getV_19(),//二级
							result.get(i).getV_20()//三级
							));
					result.get(i).setV_25(ministryGrants);
				}
				if (result.get(i).getV_26() == null || result.get(i).getV_26()=="") {
					//计算省级补助标准
					String provinceGrants = String.valueOf(CalculateGrantsAndAwards.calculateGrantsFromProvince(result.get(i).getV_3(),result.get(i).getV_46(),
							result.get(i).getV_10(),result.get(i).getV_24(),result.get(i).getV_45(),result.get(i).getV_18(),result.get(i).getV_19(),result.get(i).getV_20()));
					result.get(i).setV_26(provinceGrants);

				}
	            if (result.get(i).getV_27() == null || result.get(i).getV_27()=="") {
	    			//计算省级奖励
	    			String provinceAwards = String.valueOf(CalculateGrantsAndAwards.calculateAwardsFromProvince(result.get(i).getV_3(),result.get(i).getV_46(),result.get(i).getV_10(),result.get(i).getV_18(),result.get(i).getV_19(),result.get(i).getV_20()));
	    		    result.get(i).setV_27(provinceAwards);
				}
			}
        } catch (Exception e) {
			e.printStackTrace();
		}	
		return result;
	}
	
	@Override
	public List<Excel_list> getSjgzjdhzb(Lxsh lxsh) {
		List<Excel_list> result = queryList("getSjgzjdhzbTotal",lxsh);
		List<Excel_list> detail = queryList("getSjgzjdhzb",lxsh);
		result.addAll(detail);
		return result;
	}
	@Override
	public List<Excel_list> queryXmQqjdhzb2(Lxsh lxsh) {
		List<Excel_list> result = queryList("queryXmQqjdhzb2Total",lxsh);
		List<Excel_list> detail = queryList("queryXmQqjdhzb2",lxsh);
		result.addAll(detail);
		return result;
	}
	@Override
	public List<Excel_list> queryXmQqjdhzb1(Lxsh lxsh) {
		List<Excel_list> result = queryList("queryXmQqjdhzb1Total",lxsh);
		List<Excel_list> detail = queryList("queryXmQqjdhzb1",lxsh);
		result.addAll(detail);
		return result;
	}
}
