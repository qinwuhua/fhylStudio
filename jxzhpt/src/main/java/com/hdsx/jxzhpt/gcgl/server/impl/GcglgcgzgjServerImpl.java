package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglgcgzgjServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;

@Service
public class GcglgcgzgjServerImpl extends BaseOperate implements GcglgcgzgjServer {

	public GcglgcgzgjServerImpl() {
		super("gcglgcgzgj", "jdbc");
	}

	@Override
	public Boolean insertgcgzgjYb(Gcglgcgzgj gcglgcgzgj) {
		Gcglgcgzgj gcglzhfz1=queryOne("queryYbByYf", gcglgcgzgj);
		if(gcglzhfz1!=null){
			return false;
		}
		gcglgcgzgj.setShzt("未审核");
		if(insert("insertgcgzgjYb", gcglgcgzgj)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectgcgzgjYbByJhidCount(Gcglgcgzgj gcglgcgzgj) {
		// TODO Auto-generated method stub
		return queryOne("selectgcgzgjYbByJhidCount", gcglgcgzgj);
	}

	@Override
	public List<Gcglgcgzgj> selectgcgzgjYbByJhid(Gcglgcgzgj gcglgcgzgj) {
		// TODO Auto-generated method stub
		return queryList("selectgcgzgjYbByJhid",gcglgcgzgj);
	}

	@Override
	public Boolean updategcgzgjYb(Gcglgcgzgj gcglgcgzgj) {
		if(update("updategcgzgjYb", gcglgcgzgj)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deletegcgzgjYb(Gcglgcgzgj gcglgcgzgj) {
		if(delete("deletegcgzgjYb", gcglgcgzgj)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shgcgzgjYb(Gcglgcgzgj gcglgcgzgj) {
		if(update("shgcgzgjYb", gcglgcgzgj)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertGcgzgjCgs(Gcglgcgzgj gcglgcgzgj) {
		Gcglgcgzgj gcglwqgz1=queryOne("queryCGSByYf", gcglgcgzgj);
		if(gcglwqgz1!=null){
			return false;
		}
		if(insert("insertGcgzgjCgs", gcglgcgzgj)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectGcgzgjCgsListCount(Gcglgcgzgj gcglgcgzgj) {
		// TODO Auto-generated method stub
		return queryOne("selectGcgzgjCgsListCount", gcglgcgzgj);
	}

	@Override
	public List<Gcglgcgzgj> selectGcgzgjCgsList(Gcglgcgzgj gcglgcgzgj) {
		// TODO Auto-generated method stub
		return queryList("selectGcgzgjCgsList",gcglgcgzgj);
	}

	@Override
	public Boolean updateGcgzgjCgs(Gcglgcgzgj gcglgcgzgj) {
		if(update("updateGcgzgjCgs", gcglgcgzgj)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteGcgzgjCgs(Gcglgcgzgj gcglgcgzgj) {
		if(delete("deleteGcgzgjCgs", gcglgcgzgj)>0){
			return true;
		}else{
			return false;
		}
	}

	
	@Override
	public boolean uploadWqgzFilesgxk(Gcglgcgzgj gcglwqgz) {
		if(update("uploadWqgzFilesgxk", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglgcgzgj gcglwqgz) {
		if(update("uploadWqgzFilejgtc", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglgcgzgj gcglwqgz) {
		if(update("uploadWqgzFilejgys", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglgcgzgj downWqgzFile(Gcglgcgzgj gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("downWqgzFile", gcglwqgz);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglgcgzgj gcglwqgz) {
		if(update("insertWqgzwwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglgcgzgj gcglwqgz) {
		gcglwqgz.setJgzt("1");
		if(update("insertWqgzwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglgcgzgj gcglwqgz) {
		gcglwqgz.setKgzt("1");
		if(update("insertWqgzkg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglgcgzgj gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListCount", gcglwqgz);
	}

	@Override
	public List<Gcglgcgzgj> selectWqgzjhList(Gcglgcgzgj gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglwqgz);
	}

	@Override
	public Gcglgcgzgj selectWqgzjhFile(Gcglgcgzgj gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhFile", gcglwqgz);
	}
}
