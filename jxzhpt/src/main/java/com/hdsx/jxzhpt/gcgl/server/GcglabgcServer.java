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

	

}
