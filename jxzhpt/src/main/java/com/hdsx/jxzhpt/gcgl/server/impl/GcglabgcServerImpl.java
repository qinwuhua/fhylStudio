package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;

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
			return true;
		}else{
			return false;
		}
	}

}
