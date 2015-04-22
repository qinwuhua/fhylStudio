package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

public interface GcglabgcServer {

	Boolean insertAbgcYb(Gcglabgc gcglabgc);

	int selectAbgcYbByJhidCount(Gcglabgc gcglabgc);

	List<Gcglabgc> selectAbgcYbByJhid(Gcglabgc gcglabgc);

	Boolean updateAbgcYb(Gcglabgc gcglabgc);

	Boolean deleteAbgcYb(Gcglabgc gcglabgc);

	Boolean shAbgcYb(Gcglabgc gcglabgc);

	Boolean updateAbgcCgs(Gcglabgc gcglabgc);

	Boolean deleteabgcCgs(Gcglabgc gcglabgc);

	int selectAbgcCgsListCount(Gcglabgc gcglabgc);

	List<Gcglabgc> selectAbgcCgsList(Gcglabgc gcglabgc);

	Boolean insertAbgcCgs(Gcglabgc gcglabgc);

	Gcglabgc downWqgzFile(Gcglabgc gcglabgc);

	boolean uploadWqgzFilesgxk(Gcglabgc gcglabgc);

	boolean uploadWqgzFilejgtc(Gcglabgc gcglabgc);

	boolean uploadWqgzFilejgys(Gcglabgc gcglabgc);

	Boolean insertWqgzkg(Gcglabgc gcglabgc);

	Boolean insertWqgzwg(Gcglabgc gcglabgc);

	Boolean insertWqgzwwg(Gcglabgc gcglabgc);

	List<Gcglabgc> selectWqgzjhList(Gcglabgc gcglabgc);

	Gcglabgc selectWqgzjhFile(Gcglabgc gcglabgc);

	int selectWqgzjhListCount(Gcglabgc gcglabgc);

	int selectAbgcYbByJhidCount1(Gcglabgc gcglabgc);

	List<Gcglabgc> selectAbgcYbByJhid1(Gcglabgc gcglabgc);

	Boolean sbWqgzYb(Gcglabgc gcglabgc);

	List<Excel_list> exportAbyb(Gcglabgc gcglabgc);

	Gcglabgc queryCGSByYf(Gcglabgc gcglabgc);

	List<Excel_list> exportgjyb(Gcglabgc gcglabgc);

	List<Excel_list> exportsjyb(Gcglabgc gcglabgc);

	List<Excel_list> exporthsyb(Gcglabgc gcglabgc);

	List<Excel_list> exportshyb(Gcglabgc gcglabgc);

	List<Excel_list> exportyhyb(Gcglabgc gcglabgc);

	List<Excel_list> exportzhyb(Gcglabgc gcglabgc);

	List<Excel_list> exportwqyb(Gcglabgc gcglabgc);

	List<Excel_list> exportAbyb1(Gcglabgc gcglabgc);

	Gcglabgc selectabgcxx(Gcglabgc gcglabgc);

	List<Gcglgcgzgj> selectWqgzjhListid1(Gcglabgc gcglabgc);

	List<Gcglabgc> selectWqgzjhList1(Gcglabgc gcglabgc);

	int selectWqgzjhListcount1(Gcglabgc gcglabgc);

	

}
