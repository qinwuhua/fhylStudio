package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;

@Service
public class GcglzhfzServerImpl extends BaseOperate implements GcglzhfzServer {

	public GcglzhfzServerImpl() {
		super("gcglzhfz", "jdbc");
	}

	@Override
	public Boolean insertZhfzYb(Gcglzhfz gcglzhfz) {
		Gcglzhfz gcglzhfz1=queryOne("queryYbByYf", gcglzhfz);
		if(gcglzhfz1!=null){
			return false;
		}
		gcglzhfz.setShzt("未审核");
		if(insert("insertZhfzYb", gcglzhfz)>0){
			return true;
		}else{
			return false;
		}
		
	}

	@Override
	public int selectZhfzYbByJhidCount(Gcglzhfz gcglzhfz) {
		return queryOne("selectZhfzYbByJhidCount", gcglzhfz);
	}

	@Override
	public List<Gcglzhfz> selectZhfzYbByJhid(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("selectZhfzYbByJhid",gcglzhfz);
	}
	@Override
	public int selectZhfzYbByJhidCount1(Gcglzhfz gcglzhfz) {
		return queryOne("selectZhfzYbByJhidCount1", gcglzhfz);
	}

	@Override
	public List<Gcglzhfz> selectZhfzYbByJhid1(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("selectZhfzYbByJhid1",gcglzhfz);
	}

	
	@Override
	public Boolean updateZhfzYb(Gcglzhfz gcglzhfz) {
		Gcglzhfz gcglzhfz1=queryOne("queryYbByYf", gcglzhfz);
		if(gcglzhfz1!=null&&!gcglzhfz1.getId().equals(gcglzhfz.getId())){
			return false;
		}
		if(update("updateZhfzYb", gcglzhfz)>0){
		return true;
	}else{
		return false;
	}
	}

	@Override
	public Boolean deleteZhfzYb(Gcglzhfz gcglzhfz) {
		if(delete("deleteZhfzYb", gcglzhfz)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shZhfzYb(Gcglzhfz gcglzhfz) {
		if(update("shZhfzYb", gcglzhfz)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteZhfzCgs(Gcglzhfz gcglzhfz) {
		if(delete("deleteZhfzCgs", gcglzhfz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean updateZhfzCgs(Gcglzhfz gcglzhfz) {
		Gcglzhfz gcglwqgz1=queryOne("queryCGSByYf", gcglzhfz);
		if(gcglwqgz1!=null&&!gcglwqgz1.getId().equals(gcglzhfz.getId())){
			return false;
		}
		if(update("updateZhfzCgs", gcglzhfz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectZhfzCgsListCount(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryOne("selectZhfzCgsListCount", gcglzhfz);
	}

	@Override
	public List<Gcglabgc> selectZhfzCgsList(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("selectZhfzCgsList",gcglzhfz);
	}

	@Override
	public Boolean insertZhfzCgs(Gcglzhfz gcglzhfz) {
		Gcglzhfz gcglwqgz1=queryOne("queryCGSByYf", gcglzhfz);
		if(gcglwqgz1!=null){
			return false;
		}
		if(insert("insertZhfzCgs", gcglzhfz)>0){
			return true;
		}else{
			return false;
		}
	}

	
	@Override
	public boolean uploadWqgzFilesgxk(Gcglzhfz gcglwqgz) {
		if(update("uploadWqgzFilesgxk", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglzhfz gcglwqgz) {
		if(update("uploadWqgzFilejgtc", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglzhfz gcglwqgz) {
		if(update("uploadWqgzFilejgys", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglzhfz downWqgzFile(Gcglzhfz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("downWqgzFile", gcglwqgz);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglzhfz gcglwqgz) {
		if(update("insertWqgzwwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglzhfz gcglwqgz) {
		gcglwqgz.setJgzt("1");
		if(update("insertWqgzwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglzhfz gcglwqgz) {
		gcglwqgz.setKgzt("1");
		if(update("insertWqgzkg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglzhfz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListCount", gcglwqgz);
	}

	@Override
	public List<Gcglzhfz> selectWqgzjhList(Gcglzhfz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglwqgz);
	}

	@Override
	public Gcglzhfz selectWqgzjhFile(Gcglzhfz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhFile", gcglwqgz);
	}

	@Override
	public Boolean sbWqgzYb(Gcglzhfz gcglabgc) {
		if(update("sbWqgzYb", gcglabgc)>0){
			return true;
		}else{
			return false;
		}
	}
}
