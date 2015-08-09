package com.hdsx.jxzhpt.wjxt.server.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Wjgl;
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
	public boolean insertLqpdmxbdata1(List<Map> data) {
		// TODO Auto-generated method stub
		return insertBatch("insertLqpdmxbdata1", data)==data.size();
	}
	@Override
	public List<Lkmxb> selectMxbList(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryList("selectMxbList",lkmxb);
	}
	@Override
	public List<Lkmxb> selectMxbList1(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryList("selectMxbList1",lkmxb);
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
	public List<Lkmxb> getMxbDataList2(Lkmxb lkmxb) {
		return queryList("getMxbDataList2",lkmxb);
	}

	@Override
	public Lkmxb getMxbDataList3(Lkmxb lkmxb) {
		return queryOne("getMxbDataList3", lkmxb);
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
	public Boolean deletemxb1(Lkmxb lkmxb) {
		if(delete("deletemxb2", lkmxb)>0 && delete("deletemxb3", lkmxb)>0){
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
	
	@Override
	public Boolean deletetjb(Lktjb lktjb) {
		if(delete("deletetjb", lktjb)>0 && delete("deletetjb1", lktjb)>0){
			return true;
		}else{
			return false;
		}
	}
	
	@Override
	public boolean insertJtlhz(Jtlhz jtlhz1) {
		if(insert("insertJtlhz", jtlhz1)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean insertJtlhzdata(List<Map> data) {
		// TODO Auto-generated method stub
		return insertBatch("insertJtlhzdata", data)==data.size();
	}

	@Override
	public List<Jtlhz> selectJtlList(Jtlhz jtlhz) {
		// TODO Auto-generated method stub
		return queryList("selectJtlList",jtlhz);
	}

	@Override
	public List<Jtlhz> getJtlDataList(Jtlhz jtlhz) {
		// TODO Auto-generated method stub
		return queryList("getJtlDataList", jtlhz);
	}

	@Override
	public Jtlhz getJtlDataList1(Jtlhz jtlhz) {
		// TODO Auto-generated method stub
		return queryOne("getJtlDataList1", jtlhz);
	}

	@Override
	public Boolean deletejtl(Jtlhz jtlhz) {
		if(delete("deletejtl", jtlhz)>0 && delete("deletejtl1", jtlhz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean insertJtlhzgd(Jtlhzgd jtlhz1) {
		if(insert("insertJtlhzgd", jtlhz1)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean insertJtlhzgddata(List<Map> data) {
		// TODO Auto-generated method stub
		return insertBatch("insertJtlhzgddata", data)==data.size();
	}

	@Override
	public List<Jtlhzgd> selectJtlgdList(Jtlhzgd jtlhzgd) {
		// TODO Auto-generated method stub
		return queryList("selectJtlgdList", jtlhzgd);
	}

	@Override
	public List<Jtlhzgd> getJtlgdDataList(Jtlhzgd jtlhzgd) {
		// TODO Auto-generated method stub
		return queryList("getJtlgdDataList",jtlhzgd);
	}

	@Override
	public Jtlhzgd getJtlgdDataList1(Jtlhzgd jtlhzgd) {
		// TODO Auto-generated method stub
		return queryOne("getJtlgdDataList1", jtlhzgd);
	}

	@Override
	public Boolean deletejtlgd(Jtlhzgd jtlhzgd) {
		if(delete("deletejtlgd", jtlhzgd)>0 && delete("deletejtlgd1", jtlhzgd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean insertJtlhzsd(Jtlhzgd jtlhz1) {
		if(insert("insertJtlhzsd", jtlhz1)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean insertJtlhzsddata(List<Map> data) {
		// TODO Auto-generated method stub
		return insertBatch("insertJtlhzsddata", data)==data.size();
	}

	@Override
	public List<Jtlhzgd> selectJtlsdList(Jtlhzgd jtlhzgd) {
		// TODO Auto-generated method stub
		return queryList("selectJtlsdList", jtlhzgd);
	}

	@Override
	public List<Jtlhzgd> getJtlsdDataList(Jtlhzgd jtlhzgd) {
		// TODO Auto-generated method stub
		return queryList("getJtlsdDataList",jtlhzgd);
	}

	@Override
	public Jtlhzgd getJtlsdDataList1(Jtlhzgd jtlhzgd) {
		// TODO Auto-generated method stub
		return queryOne("getJtlsdDataList1", jtlhzgd);
	}

	@Override
	public Boolean deletejtlsd(Jtlhzgd jtlhzgd) {
		if(delete("deletejtlsd", jtlhzgd)>0 && delete("deletejtlsd1", jtlhzgd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean updateTrqk(Trqk trqk) {
		if(update("updateTrqk", trqk)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean deletetrqk(Trqk trqk) {
		if(delete("deletetrqk", trqk)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Trqk> selectTrqkList1(Trqk trqk) {
		// TODO Auto-generated method stub
		return queryList("selectTrqkList1", trqk);
	}

	@Override
	public List<Lkmxb> getPqiList(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryList("getPqiList", lkmxb);
	}

	@Override
	public Lkmxb selectLqpdmxbdata(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryOne("selectLqpdmxbdata", lkmxb);
	}
	@Override
	public Lkmxb selectLqpdmxbdata1(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryOne("selectLqpdmxbdata1", lkmxb);
	}
	@Override
	public Lktjb selectLktjbdata(Lktjb lktjb) {
		// TODO Auto-generated method stub
		return queryOne("selectLktjbdata", lktjb);
	}

	@Override
	public Jtlhz selectJtlhzdata(Jtlhz jtlhz) {
		// TODO Auto-generated method stub
		return queryOne("selectJtlhzdata", jtlhz);
	}

	@Override
	public Jtlhzgd selectJtlhzgddata(Jtlhzgd jtlhz) {
		// TODO Auto-generated method stub
		return queryOne("selectJtlhzgddata", jtlhz);
	}

	@Override
	public Jtlhzgd selectJtlhzsddata(Jtlhzgd jtlhz) {
		// TODO Auto-generated method stub
		return queryOne("selectJtlhzsddata", jtlhz);
	}

	@Override
	public Wjgl downLkpdmxbFile(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryOne("downLkpdmxbFile", lkmxb);
	}
	@Override
	public Wjgl downLkpdmxbFile1(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryOne("downLkpdmxbFile1", lkmxb);
	}
	@Override
	public Wjgl downLkpdtjbFile(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryOne("downLkpdtjbFile", lkmxb);
	}
	@Override
	public Wjgl downjtqkhzbFile(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryOne("downjtqkhzbFile", lkmxb);
	}
	@Override
	public Wjgl downjtqkhzbgdFile(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryOne("downjtqkhzbgdFile", lkmxb);
	}
	@Override
	public Wjgl downjtqkhzbsdFile(Lkmxb lkmxb) {
		// TODO Auto-generated method stub
		return queryOne("downjtqkhzbsdFile", lkmxb);
	}

	@Override
	public boolean insertLqpdmxb1(Lkmxb lkmxb1) {
		return insert("insertLqpdmxb1", lkmxb1)==1;
	}

}
