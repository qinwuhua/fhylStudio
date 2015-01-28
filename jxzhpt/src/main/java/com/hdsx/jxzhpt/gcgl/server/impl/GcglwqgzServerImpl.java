package com.hdsx.jxzhpt.gcgl.server.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
@Service
public class GcglwqgzServerImpl extends BaseOperate implements GcglwqgzServer {

	public GcglwqgzServerImpl() {
		super("gcglwqgz", "jdbc");
	}

	@Override
	public Boolean insertWqgzYb(Gcglwqgz gcglwqgz) {
		Gcglwqgz gcglwqgz1=queryOne("queryYbByYf", gcglwqgz);
		if(gcglwqgz1!=null){
			return false;
		}
		gcglwqgz.setShzt("未审核");
		if(insert("insertWqgzYb", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzYbByJhidCount(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzYbByJhidCount", gcglwqgz);
	}

	@Override
	public List<Gcglwqgz> selectWqgzYbByJhid(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzYbByJhid",gcglwqgz);
	}
	@Override
	public int selectWqgzYbByJhidCount1(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzYbByJhidCount1", gcglwqgz);
	}

	@Override
	public List<Gcglwqgz> selectWqgzYbByJhid1(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzYbByJhid1",gcglwqgz);
	}
	
	
	@Override
	public Boolean updateWqgzYb(Gcglwqgz gcglwqgz) {
		Gcglwqgz gcglwqgz1=queryOne("queryYbByYf", gcglwqgz);
		if(gcglwqgz1!=null&&!gcglwqgz1.getId().equals(gcglwqgz.getId())){
			return false;
		}
		if(insert("updateWqgzYb", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteWqgzYb(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		if(delete("deleteWqgzYb", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shwqgzyb(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		if(update("shwqgzyb", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzCgs(Gcglwqgz gcglwqgz) {
		Gcglwqgz gcglwqgz1=queryOne("queryCGSByYf", gcglwqgz);
		if(gcglwqgz1!=null){
			return false;
		}
		if(insert("insertWqgzCgs", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzCgsListCount(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzCgsListCount", gcglwqgz);
	}

	@Override
	public List<Gcglwqgz> selectWqgzCgsList(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzCgsList",gcglwqgz);
	}

	@Override
	public Boolean updateWqgzCgs(Gcglwqgz gcglwqgz) {
		Gcglwqgz gcglwqgz1=queryOne("queryCGSByYf", gcglwqgz);
		if(gcglwqgz1!=null&&!gcglwqgz1.getId().equals(gcglwqgz.getId())){
			return false;
		}
		if(update("updateWqgzCgs", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deletewqgzCgs(Gcglwqgz gcglwqgz) {
		if(delete("deletewqgzCgs", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilesgxk(Gcglwqgz gcglwqgz) {
		if(update("uploadWqgzFilesgxk", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglwqgz gcglwqgz) {
		if(update("uploadWqgzFilejgtc", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglwqgz gcglwqgz) {
		if(update("uploadWqgzFilejgys", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglwqgz downWqgzFile(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("downWqgzFile", gcglwqgz);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglwqgz gcglwqgz) {
		if(update("insertWqgzwwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglwqgz gcglwqgz) {
		gcglwqgz.setJgzt("1");
		if(update("insertWqgzwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglwqgz gcglwqgz) {
		gcglwqgz.setKgzt("1");
		if(update("insertWqgzkg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListCount", gcglwqgz);
	}

	@Override
	public List<Gcglwqgz> selectWqgzjhList(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglwqgz);
	}

	@Override
	public Gcglwqgz selectWqgzjhFile(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhFile", gcglwqgz);
	}

	@Override
	public Boolean deleteWqgzFile(Gcglwqgz gcglwqgz) {
		if(delete("deleteWqgzFile", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean sbWqgzYb(Gcglwqgz gcglwqgz) {
		if(update("sbWqgzYb", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

}
