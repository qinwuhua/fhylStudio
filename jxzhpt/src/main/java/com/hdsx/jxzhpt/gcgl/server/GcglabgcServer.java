package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;

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

	

}
