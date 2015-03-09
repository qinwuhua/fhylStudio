package com.hdsx.jxzhpt.wjxt.server.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;

@Service
public class TrqkServerImpl extends BaseOperate implements TrqkServer {

	public TrqkServerImpl() {
		super("trqk", "jdbc");
	}

	@Override
	public Boolean insertTrqk(Trqk trqk) {
		if(insert("insertTrqk", trqk)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectTrqkListCount(Trqk trqk) {
		// TODO Auto-generated method stub
		return queryOne("selectTrqkListCount", trqk);
	}

	@Override
	public List<Trqk> selectTrqkList(Trqk trqk) {
		// TODO Auto-generated method stub
		return queryList("selectTrqkList",trqk);
	}

	@Override
	public boolean insertLqpdmxb(Lkmxb lkmxb1) {
		if(insert("insertLqpdmxb", lkmxb1)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean insertLqpdmxbdata(List<Map> data) {
		// TODO Auto-generated method stub
		return insertBatch("insertLqpdmxbdata", data)==data.size();
	}

	@Override
	public List<Lkmxb> selectMxbList(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryList("selectMxbList",lkmxb);
	}

	@Override
	public List<Lkmxb> getMxbDataList(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryList("getMxbDataList",lkmxb);
	}

	@Override
	public Lkmxb getMxbDataList1(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryOne("getMxbDataList1", lkmxb);
	}

	@Override
	public Boolean deletemxb(Lkmxb lkmxb) {
		if(delete("deletemxb", lkmxb)>0 && delete("deletemxb1", lkmxb)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean insertLktjb(Lktjb lktjb1) {
		if(insert("insertLktjb", lktjb1)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean insertLktjbData(List<Map> data) {
		// TODO Auto-generated method stub
		return insertBatch("insertLktjbData", data)==data.size();
	}

	@Override
	public List<Lktjb> selectTjbList(Lktjb lktjb) {
		// TODO Auto-generated method stub
		return queryList("selectTjbList", lktjb);
	}

	@Override
	public List<Lktjb> getTjbDataList(Lktjb lktjb) {
		// TODO Auto-generated method stub
		return queryList("getTjbDataList",lktjb);
	}

	@Override
	public Lktjb getTjbDataList1(Lktjb lktjb) {
		// TODO Auto-generated method stub
		return queryOne("getTjbDataList1", lktjb);
	}

	
}
