package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

@Service
public class GcglabgcServerImpl extends BaseOperate implements GcglabgcServer {

	public GcglabgcServerImpl() {
		super("gcglabgc", "jdbc");
	}

	@Override
	public Boolean insertAbgcYb(Gcglabgc gcglabgc) {
		Gcglabgc gcglabgc1=queryOne("queryYbByYf", gcglabgc);
		if(gcglabgc1!=null){
			return false;
		}
		gcglabgc.setShzt("未审核");
		if(insert("insertAbgcYb", gcglabgc)>0){
			if(gcglabgc.getSfsj()==9){
				gcglabgc.setSjzt("未上报");
				update("updateSjZT", gcglabgc);
			}
			if(gcglabgc.getSfsj()==11){
				gcglabgc.setXjzt("未上报");
				update("updateXjZT", gcglabgc);
			}
			if(gcglabgc.getSfsj()==7){
				gcglabgc.setSjsh("未审核");
				update("updateSJSH", gcglabgc);
			}
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectAbgcYbByJhidCount(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryOne("selectAbgcYbByJhidCount", gcglabgc);
	}

	@Override
	public List<Gcglabgc> selectAbgcYbByJhid(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("selectAbgcYbByJhid",gcglabgc);
	}

	@Override
	public int selectAbgcYbByJhidCount1(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryOne("selectAbgcYbByJhidCount1", gcglabgc);
	}

	@Override
	public List<Gcglabgc> selectAbgcYbByJhid1(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("selectAbgcYbByJhid1",gcglabgc);
	}
	@Override
	public Boolean updateAbgcYb(Gcglabgc gcglabgc) {
		Gcglabgc gcglabgc1=queryOne("queryYbByYf", gcglabgc);
		if(gcglabgc1!=null&&!gcglabgc1.getId().equals(gcglabgc.getId())){
			return false;
		}
		if(update("updateAbgcYb", gcglabgc)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteAbgcYb(Gcglabgc gcglabgc) {
		if(delete("deleteAbgcYb", gcglabgc)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shAbgcYb(Gcglabgc gcglabgc) {
		if(update("shAbgcYb", gcglabgc)>0){
			gcglabgc.setYhtype("7");
			int num3=queryOne("selectnumbyyh", gcglabgc);
			if(num3>0){
				gcglabgc.setSjsh("未审核");
				update("updateSJSH", gcglabgc);
			}else{
				gcglabgc.setSjsh("已审核");
				update("updateSJSH", gcglabgc);
			}
		return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectAbgcCgsListCount(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryOne("selectAbgcCgsListCount", gcglabgc);
	}

	@Override
	public List<Gcglabgc> selectAbgcCgsList(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("selectAbgcCgsList",gcglabgc);
	}

	@Override
	public Boolean updateAbgcCgs(Gcglabgc gcglabgc) {
		Gcglabgc gcglwqgz1=queryOne("queryCGSByYf", gcglabgc);
		if(gcglwqgz1!=null&&!gcglwqgz1.getId().equals(gcglabgc.getId())){
			return false;
		}
		if(update("updateAbgcCgs", gcglabgc)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteabgcCgs(Gcglabgc gcglabgc) {
		if(delete("deleteabgcCgs", gcglabgc)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertAbgcCgs(Gcglabgc gcglabgc) {
		Gcglabgc gcglwqgz1=queryOne("queryCGSByYf", gcglabgc);
		if(gcglwqgz1!=null){
			return false;
		}
		if(insert("insertAbgcCgs", gcglabgc)>0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public boolean uploadWqgzFilesgxk(Gcglabgc gcglwqgz) {
		if(update("uploadWqgzFilesgxk", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglabgc gcglwqgz) {
		if(update("uploadWqgzFilejgtc", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglabgc gcglwqgz) {
		if(update("uploadWqgzFilejgys", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglabgc downWqgzFile(Gcglabgc gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("downWqgzFile", gcglwqgz);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglabgc gcglwqgz) {
		if(update("insertWqgzwwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglabgc gcglwqgz) {
		gcglwqgz.setJgzt("1");
		if(update("insertWqgzwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglabgc gcglwqgz) {
		gcglwqgz.setKgzt("1");
		if(update("insertWqgzkg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglabgc gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListCount", gcglwqgz);
	}

	@Override
	public List<Gcglabgc> selectWqgzjhList(Gcglabgc gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglwqgz);
	}

	@Override
	public Gcglabgc selectWqgzjhFile(Gcglabgc gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhFile", gcglwqgz);
	}

	@Override
	public Boolean sbWqgzYb(Gcglabgc gcglabgc) {
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
	public List<Excel_list> exportAbyb(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("exportAbyb", gcglabgc);
	}
	@Override
	public List<Excel_list> exportAbyb1(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("exportAbyb1", gcglabgc);
	}

	@Override
	public Gcglabgc queryCGSByYf(Gcglabgc gcglabgc) {
		return queryOne("queryCGSByYf", gcglabgc);
	}

	@Override
	public List<Excel_list> exportgjyb(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("exportgjyb", gcglabgc);
	}
	@Override
	public List<Excel_list> exportsjyb(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("exportsjyb", gcglabgc);
	}

	@Override
	public List<Excel_list> exporthsyb(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("exporthsyb", gcglabgc);
	}
	
	@Override
	public List<Excel_list> exportshyb(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("exportshyb", gcglabgc);
	}

	@Override
	public List<Excel_list> exportyhyb(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("exportyhyb", gcglabgc);
	}
	@Override
	public List<Excel_list> exportzhyb(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("exportzhyb", gcglabgc);
	}
	@Override
	public List<Excel_list> exportwqyb(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("exportwqyb", gcglabgc);
	}

	@Override
	public Gcglabgc selectabgcxx(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryOne("selectabgcxx", gcglabgc);
	}

	@Override
	public List<Gcglgcgzgj> selectWqgzjhListid1(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhListid1", gcglabgc);
	}

	@Override
	public List<Gcglabgc> selectWqgzjhList1(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList1", gcglabgc);
	}

	@Override
	public int selectWqgzjhListcount1(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListcount1", gcglabgc);
	}

}
