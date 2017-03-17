package com.hdsx.jxzhpt.wjxt.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Wjgl;

public interface TrqkServer {

	Boolean insertTrqk(Trqk trqk);

	int selectTrqkListCount(Trqk trqk);

	List<Trqk> selectTrqkList(Trqk trqk);

	boolean insertLqpdmxb(Lkmxb lkmxb1);

	boolean insertLqpdmxbdata(List<Map> data);

	List<Lkmxb> selectMxbList(Lkmxb lkmxb);

	List<Lkmxb> getMxbDataList(Lkmxb lkmxb);

	Lkmxb getMxbDataList1(Lkmxb lkmxb);

	Boolean deletemxb(Lkmxb lkmxb);

	boolean insertLktjb(Lktjb lktjb1);

	boolean insertLktjbData(List<Map> data);

	List<Lktjb> selectTjbList(Lktjb lktjb);

	List<Lktjb> getTjbDataList(Lktjb lktjb);

	Lktjb getTjbDataList1(Lktjb lktjb);

	boolean insertJtlhz(Jtlhz jtlhz1);

	boolean insertJtlhzdata(List<Map> data);

	Boolean deletetjb(Lktjb lktjb);

	List<Jtlhz> selectJtlList(Jtlhz jtlhz);

	List<Jtlhz> getJtlDataList(Jtlhz jtlhz);

	Jtlhz getJtlDataList1(Jtlhz jtlhz);

	Boolean deletejtl(Jtlhz jtlhz);

	boolean insertJtlhzgd(Jtlhzgd jtlhz1);

	boolean insertJtlhzgddata(List<Map> data);

	List<Jtlhzgd> selectJtlgdList(Jtlhzgd jtlhzgd);

	List<Jtlhzgd> getJtlgdDataList(Jtlhzgd jtlhzgd);

	Jtlhzgd getJtlgdDataList1(Jtlhzgd jtlhzgd);

	Boolean deletejtlgd(Jtlhzgd jtlhzgd);

	boolean insertJtlhzsd(Jtlhzgd jtlhz1);

	boolean insertJtlhzsddata(List<Map> data);

	List<Jtlhzgd> selectJtlsdList(Jtlhzgd jtlhzgd);

	List<Jtlhzgd> getJtlsdDataList(Jtlhzgd jtlhzgd);

	Jtlhzgd getJtlsdDataList1(Jtlhzgd jtlhzgd);

	Boolean deletejtlsd(Jtlhzgd jtlhzgd);

	boolean updateTrqk(Trqk trqk);

	boolean deletetrqk(Trqk trqk);

	List<Trqk> selectTrqkList1(Trqk trqk);

	List<Lkmxb> getPqiList(Lkmxb lkmxb);

	Lkmxb selectLqpdmxbdata(Lkmxb lkmxb);

	Lktjb selectLktjbdata(Lktjb lktjb);

	Jtlhz selectJtlhzdata(Jtlhz jtlhz);

	Jtlhzgd selectJtlhzgddata(Jtlhzgd jtlhz);

	Jtlhzgd selectJtlhzsddata(Jtlhzgd jtlhz);

	Wjgl downLkpdmxbFile(Lkmxb lkmxb);

	Wjgl downLkpdtjbFile(Lkmxb lkmxb);

	Wjgl downjtqkhzbFile(Lkmxb lkmxb);

	Wjgl downjtqkhzbsdFile(Lkmxb lkmxb);

	Wjgl downjtqkhzbgdFile(Lkmxb lkmxb);

	Lkmxb selectLqpdmxbdata1(Lkmxb lkmxb1);

	boolean insertLqpdmxb1(Lkmxb lkmxb1);

	boolean insertLqpdmxbdata1(List<Map> data);

	List<Lkmxb> selectMxbList1(Lkmxb lkmxb);

	Wjgl downLkpdmxbFile1(Lkmxb lkmxb);

	Boolean deletemxb1(Lkmxb lkmxb);

	List<Lkmxb> getMxbDataList2(Lkmxb lkmxb);

	Lkmxb getMxbDataList3(Lkmxb lkmxb);
	
	public List<Lkmxb> selectHzbList(Lkmxb lkmxb);

	Lkmxb selectLkhzmxbdata(Lkmxb lkmxb1);

	boolean insertLkhzmxb(Lkmxb lkmxb1);

	boolean insertLkhzmxbdata(List<Map> data);
	
	Boolean deletehzb(Lkmxb lkmxb);
	
	List<Lkmxb> getHzmxbDataList(Lkmxb lkmxb);
	
	Lkmxb getHzbDataList(Lkmxb lkmxb);
	
	Wjgl downLkhzmxbFile(Lkmxb lkmxb);
}
