package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzsj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglgcgzsjServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;

@Service
public class GcglgcgzsjServerImpl extends BaseOperate implements GcglgcgzsjServer {

	public GcglgcgzsjServerImpl() {
		super("gcglgcglsj", "jdbc");
	}

	@Override
	public Boolean insertgcgzsjYb(Gcglgcgzsj gcglgcgzsj) {
		Gcglgcgzsj gcglzhfz1=queryOne("queryYbByYf", gcglgcgzsj);
		if(gcglzhfz1!=null){
			return false;
		}
		gcglgcgzsj.setShzt("未审核");
		if(insert("insertgcgzsjYb", gcglgcgzsj)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectgcgzsjYbByJhidCount(Gcglgcgzsj gcglgcgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectgcgzsjYbByJhidCount", gcglgcgzsj);
	}

	@Override
	public List<Gcglgcgzsj> selectgcgzsjYbByJhid(Gcglgcgzsj gcglgcgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectgcgzsjYbByJhid",gcglgcgzsj);
	}
	@Override
	public int selectgcgzsjYbByJhidCount1(Gcglgcgzsj gcglgcgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectgcgzsjYbByJhidCount1", gcglgcgzsj);
	}

	@Override
	public List<Gcglgcgzsj> selectgcgzsjYbByJhid1(Gcglgcgzsj gcglgcgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectgcgzsjYbByJhid1",gcglgcgzsj);
	}

	@Override
	public Boolean updategcgzsjYb(Gcglgcgzsj gcglgcgzsj) {
		Gcglgcgzsj gcglzhfz1=queryOne("queryYbByYf", gcglgcgzsj);
		if(gcglzhfz1!=null&&gcglzhfz1.getId().equals(gcglgcgzsj.getId())){
			return false;
		}
		if(update("updategcgzsjYb", gcglgcgzsj)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deletegcgzsjYb(Gcglgcgzsj gcglgcgzsj) {
		if(delete("deletegcgzsjYb", gcglgcgzsj)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shgcgzsjyb(Gcglgcgzsj gcglgcgzsj) {
		if(update("shgcgzsjyb", gcglgcgzsj)>0){
		return true;
		}else{
			return false;
		}
	}
	
	@Override
	public Boolean insertGcgzsjCgs(Gcglgcgzsj gcglgcgzsj) {
		Gcglgcgzsj gcglwqgz1=queryOne("queryCGSByYf", gcglgcgzsj);
		if(gcglwqgz1!=null){
			return false;
		}
		if(insert("insertGcgzsjCgs", gcglgcgzsj)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectGcgzsjCgsListCount(Gcglgcgzsj gcglgcgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectGcgzsjCgsListCount", gcglgcgzsj);
	}

	@Override
	public List<Gcglgcgzsj> selectGcgzsjCgsList(Gcglgcgzsj gcglgcgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectGcgzsjCgsList",gcglgcgzsj);
	}

	@Override
	public Boolean updateGcgzsjCgs(Gcglgcgzsj gcglgcgzsj) {
		Gcglgcgzsj gcglwqgz1=queryOne("queryCGSByYf", gcglgcgzsj);
		if(gcglwqgz1!=null&&!gcglwqgz1.getId().equals(gcglgcgzsj.getId())){
			return false;
		}
		if(update("updateGcgzsjCgs", gcglgcgzsj)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteGcgzsjCgs(Gcglgcgzsj gcglgcgzsj) {
		if(delete("deleteGcgzsjCgs", gcglgcgzsj)>0){
			return true;
		}else{
			return false;
		}
	}
	
	@Override
	public boolean uploadWqgzFilesgxk(Gcglgcgzsj gcglwqgz) {
		if(update("uploadWqgzFilesgxk", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglgcgzsj gcglwqgz) {
		if(update("uploadWqgzFilejgtc", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglgcgzsj gcglwqgz) {
		if(update("uploadWqgzFilejgys", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglgcgzsj downWqgzFile(Gcglgcgzsj gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("downWqgzFile", gcglwqgz);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglgcgzsj gcglwqgz) {
		if(update("insertWqgzwwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglgcgzsj gcglwqgz) {
		gcglwqgz.setJgzt("1");
		if(update("insertWqgzwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglgcgzsj gcglwqgz) {
		gcglwqgz.setKgzt("1");
		if(update("insertWqgzkg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglgcgzsj gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListCount", gcglwqgz);
	}

	@Override
	public List<Gcglgcgzsj> selectWqgzjhList(Gcglgcgzsj gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglwqgz);
	}

	@Override
	public Gcglgcgzsj selectWqgzjhFile(Gcglgcgzsj gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhFile", gcglwqgz);
	}
	@Override
	public Boolean sbWqgzYb(Gcglgcgzsj gcglabgc) {
		if(update("sbWqgzYb", gcglabgc)>0){
			return true;
		}else{
			return false;
		}
	}
}
