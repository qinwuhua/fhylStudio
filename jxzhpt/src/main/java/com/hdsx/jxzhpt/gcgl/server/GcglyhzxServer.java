package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhzx;

public interface GcglyhzxServer {

	Boolean insertYhdzxYb(Gcglyhzx Gcglyhzx);

	int selectYhdzxYbByJhidCount(Gcglyhzx Gcglyhzx);

	List<Gcglyhzx> selectYhdzxYbByJhid(Gcglyhzx Gcglyhzx);

	Boolean updateYhdzxYb(Gcglyhzx Gcglyhzx);

	Boolean deleteYhdzxYb(Gcglyhzx Gcglyhzx);

	Boolean shYhdzxYb(Gcglyhzx Gcglyhzx);

	Boolean insertYhdzxCgs(Gcglyhzx Gcglyhzx);

	int selectYhdzxCgsListCount(Gcglyhzx Gcglyhzx);

	List<Gcglabgc> selectYhdzxCgsList(Gcglyhzx Gcglyhzx);

	Boolean updateYhdzxCgs(Gcglyhzx Gcglyhzx);

	Boolean deleteYhdzxCgs(Gcglyhzx Gcglyhzx);

	Gcglyhzx downWqgzFile(Gcglyhzx Gcglyhzx);

	boolean uploadWqgzFilesgxk(Gcglyhzx Gcglyhzx);

	boolean uploadWqgzFilejgtc(Gcglyhzx Gcglyhzx);

	boolean uploadWqgzFilejgys(Gcglyhzx Gcglyhzx);

	Boolean insertWqgzkg(Gcglyhzx Gcglyhzx);

	Boolean insertWqgzwg(Gcglyhzx Gcglyhzx);

	Boolean insertWqgzwwg(Gcglyhzx Gcglyhzx);

	int selectWqgzjhListCount(Gcglyhzx Gcglyhzx);

	List<Gcglyhzx> selectWqgzjhList(Gcglyhzx Gcglyhzx);

	Gcglyhzx selectWqgzjhFile(Gcglyhzx Gcglyhzx);

	int selectYhdzxYbByJhidCount1(Gcglyhzx Gcglyhzx);

	List<Gcglyhzx> selectYhdzxYbByJhid1(Gcglyhzx Gcglyhzx);

	Boolean sbWqgzYb(Gcglyhzx Gcglyhzx);

	Gcglyhzx queryCGSByYf(Gcglyhzx Gcglyhzx);

	List<Map<String, Object>> queryGcgjList(Gcglyhzx Gcglyhzx);

	int queryGcgjListCount(Gcglyhzx Gcglyhzx);

	List<Map<String, Object>> selectWqgzjhList2(Gcglyhzx Gcglyhzx);

	int selectWqgzjhListcount1(Gcglyhzx Gcglyhzx);

	
}
