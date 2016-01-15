package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhzx;
import com.hdsx.jxzhpt.gcgl.server.GcglyhzxServer;

@Service
public class GcglyhzxServerImpl extends BaseOperate implements GcglyhzxServer {

	public GcglyhzxServerImpl() {
		super("gcglyhzx", "jdbc");
	}

	@Override
	public Boolean insertYhdzxYb(Gcglyhzx Gcglyhzx) {
		Gcglyhzx gcglzhfz1=queryOne("queryYbByYf", Gcglyhzx);
		if(gcglzhfz1!=null){
			return false;
		}
		Gcglyhzx.setShzt("未审核");
		if(insert("insertYhdzxYb", Gcglyhzx)>0){
			if(Gcglyhzx.getSfsj()==9){
				Gcglyhzx.setSjzt("未上报");
				Gcglyhzx gcglwqgz3 =queryOne("querymaxybyf", Gcglyhzx);//查最大月份
				Gcglyhzx.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", Gcglyhzx);
				update("updateSjZT", Gcglyhzx);
			}
			if(Gcglyhzx.getSfsj()==11){
				Gcglyhzx.setXjzt("未上报");
				Gcglyhzx gcglwqgz3 =queryOne("querymaxybyf", Gcglyhzx);//查最大月份
				Gcglyhzx.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", Gcglyhzx);
				update("updateXjZT", Gcglyhzx);
			}
			if(Gcglyhzx.getSfsj()==7){
				Gcglyhzx.setSjsh("未审核");
				Gcglyhzx gcglwqgz3 =queryOne("querymaxybyf", Gcglyhzx);//查最大月份
				Gcglyhzx.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", Gcglyhzx);
				update("updateSJSH", Gcglyhzx);
			}
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectYhdzxYbByJhidCount(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		return queryOne("selectYhdzxYbByJhidCount", Gcglyhzx);
	}

	@Override
	public List<Gcglyhzx> selectYhdzxYbByJhid(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		return queryList("selectYhdzxYbByJhid",Gcglyhzx);
	}
	@Override
	public int selectYhdzxYbByJhidCount1(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		return queryOne("selectYhdzxYbByJhidCount1", Gcglyhzx);
	}

	@Override
	public List<Gcglyhzx> selectYhdzxYbByJhid1(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		return queryList("selectYhdzxYbByJhid1",Gcglyhzx);
	}
	
	@Override
	public Boolean updateYhdzxYb(Gcglyhzx Gcglyhzx) {
		Gcglyhzx gcglzhfz1=queryOne("queryYbByYf", Gcglyhzx);
		if(gcglzhfz1!=null&&!gcglzhfz1.getId().equals(Gcglyhzx.getId())){
			return false;
		}
		if(update("updateYhdzxYb", Gcglyhzx)>0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public Boolean deleteYhdzxYb(Gcglyhzx Gcglyhzx) {
		if(delete("deleteYhdzxYb", Gcglyhzx)>0){
			Gcglyhzx gcglwqgz3 =queryOne("querymaxybyf", Gcglyhzx);//查最大月份
			if(gcglwqgz3!=null)
				Gcglyhzx.setSbyf(gcglwqgz3.getSbyf());
			else
				Gcglyhzx.setSbyf("");
			update("updatezdyf", Gcglyhzx);
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shYhdzxYb(Gcglyhzx Gcglyhzx) {
		if(update("shYhdzxYb", Gcglyhzx)>0){
			Gcglyhzx.setYhtype("7");
			int num3=queryOne("selectnumbyyh", Gcglyhzx);
			if(num3>0){
				Gcglyhzx.setSjsh("未审核");
				update("updateSJSH", Gcglyhzx);
			}else{
				Gcglyhzx.setSjsh("已审核");
				update("updateSJSH", Gcglyhzx);
			}
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertYhdzxCgs(Gcglyhzx Gcglyhzx) {
		/*Gcglyhzx gcglwqgz1=queryOne("queryCGSByYf", Gcglyhzx);
		if(gcglwqgz1!=null){
			return false;
		}*/
		if(insert("insertYhdzxCgs", Gcglyhzx)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectYhdzxCgsListCount(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		return queryOne("selectYhdzxCgsListCount", Gcglyhzx);
	}

	@Override
	public List<Gcglabgc> selectYhdzxCgsList(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		return queryList("selectYhdzxCgsList",Gcglyhzx);
	}

	@Override
	public Boolean updateYhdzxCgs(Gcglyhzx Gcglyhzx) {
		Gcglyhzx gcglwqgz1=queryOne("queryCGSByYf", Gcglyhzx);
		if(gcglwqgz1!=null&&!gcglwqgz1.getId().equals(Gcglyhzx.getId())){
			return false;
		}
		if(update("updateYhdzxCgs", Gcglyhzx)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteYhdzxCgs(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		if(delete("deleteYhdzxCgs", Gcglyhzx)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilesgxk(Gcglyhzx gcglwqgz) {
		if(update("uploadWqgzFilesgxk", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglyhzx gcglwqgz) {
		if(update("uploadWqgzFilejgtc", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglyhzx gcglwqgz) {
		if(update("uploadWqgzFilejgys", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglyhzx downWqgzFile(Gcglyhzx gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("downWqgzFile", gcglwqgz);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglyhzx gcglwqgz) {
		if(update("insertWqgzwwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglyhzx gcglwqgz) {
		gcglwqgz.setJgzt("1");
		if(update("insertWqgzwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglyhzx gcglwqgz) {
		gcglwqgz.setKgzt("1");
		if(update("insertWqgzkg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglyhzx gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListCount", gcglwqgz);
	}

	@Override
	public List<Gcglyhzx> selectWqgzjhList(Gcglyhzx gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglwqgz);
	}

	@Override
	public Gcglyhzx selectWqgzjhFile(Gcglyhzx gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhFile", gcglwqgz);
	}
	@Override
	public Boolean sbWqgzYb(Gcglyhzx gcglabgc) {
		if(update("sbWqgzYb", gcglabgc)>0){
			int num1=queryOne("selectnumbyyh", gcglabgc);
			if(num1>0){
				gcglabgc.setXjzt("未上报");
				update("updateXjZT", gcglabgc);
			}else{
				gcglabgc.setXjzt("已上报");
				update("updateXjZT", gcglabgc);
			}
			gcglabgc.setYhtype("9");
			int num2=queryOne("selectnumbyyh", gcglabgc);
			if(num2>0){
				gcglabgc.setSjzt("未上报");
				update("updateSjZT", gcglabgc);
			}else{
				gcglabgc.setSjzt("已上报");
				update("updateSjZT", gcglabgc);
			}
			gcglabgc.setYhtype("7");
			int num3=queryOne("selectnumbyyh", gcglabgc);
			if(num3>0){
				gcglabgc.setSjsh("未审核");
				update("updateSJSH", gcglabgc);
			}
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglyhzx queryCGSByYf(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		return queryOne("queryCGSByYf", Gcglyhzx);
	}

	@Override
	public List<Map<String, Object>> queryGcgjList(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		return queryList("queryGcgjList", Gcglyhzx);
	}

	@Override
	public int queryGcgjListCount(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		return queryOne("queryGcgjListCount", Gcglyhzx);
	}

	@Override
	public List<Map<String, Object>> selectWqgzjhList2(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList2", Gcglyhzx);
	}

	@Override
	public int selectWqgzjhListcount1(Gcglyhzx Gcglyhzx) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListcount1", Gcglyhzx);
	}
}
