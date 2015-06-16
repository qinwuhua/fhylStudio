package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;

public interface XjgcServer {

	Boolean insertgcgzgjYb(Gcglgcgzgj gcglgcgzgj);

	int selectgcgzgjYbByJhidCount(Gcglgcgzgj gcglgcgzgj);

	List<Gcglgcgzgj> selectgcgzgjYbByJhid(Gcglgcgzgj gcglgcgzgj);

	Boolean updategcgzgjYb(Gcglgcgzgj gcglgcgzgj);

	Boolean deletegcgzgjYb(Gcglgcgzgj gcglgcgzgj);

	Boolean shgcgzgjYb(Gcglgcgzgj gcglgcgzgj);

	Boolean insertGcgzgjCgs(Gcglgcgzgj gcglgcgzgj);

	int selectGcgzgjCgsListCount(Gcglgcgzgj gcglgcgzgj);

	List<Gcglgcgzgj> selectGcgzgjCgsList(Gcglgcgzgj gcglgcgzgj);

	Boolean updateGcgzgjCgs(Gcglgcgzgj gcglgcgzgj);

	Boolean deleteGcgzgjCgs(Gcglgcgzgj gcglgcgzgj);

	Gcglgcgzgj downWqgzFile(Gcglgcgzgj gcglgcgzgj);

	boolean uploadWqgzFilesgxk(Gcglgcgzgj gcglgcgzgj);

	boolean uploadWqgzFilejgtc(Gcglgcgzgj gcglgcgzgj);

	boolean uploadWqgzFilejgys(Gcglgcgzgj gcglgcgzgj);

	Boolean insertWqgzkg(Gcglgcgzgj gcglgcgzgj);

	Boolean insertWqgzwg(Gcglgcgzgj gcglgcgzgj);

	Boolean insertWqgzwwg(Gcglgcgzgj gcglgcgzgj);

	int selectWqgzjhListCount(Gcglgcgzgj gcglgcgzgj);

	List<Gcglgcgzgj> selectWqgzjhList(Gcglgcgzgj gcglgcgzgj);

	Gcglgcgzgj selectWqgzjhFile(Gcglgcgzgj gcglgcgzgj);

	int selectgcgzgjYbByJhidCount1(Gcglgcgzgj gcglgcgzgj);

	List<Gcglgcgzgj> selectgcgzgjYbByJhid1(Gcglgcgzgj gcglgcgzgj);

	Boolean sbWqgzYb(Gcglgcgzgj gcglgcgzgj);

	List<Gcglgcgzgj> selectWqgzjhListid1(Gcglgcgzgj gcglgcgzgj);

	List<Gcglgcgzgj> selectWqgzjhList1(Gcglgcgzgj gcglgcgzgj);

	Gcglgcgzgj queryCGSByYf(Gcglgcgzgj gcglgcgzgj);

	List<Map<String,Object>> queryGcgjList(Gcglgcgzgj gcglgcgzgj);

	int queryGcgjListCount(Gcglgcgzgj gcglgcgzgj);

	int selectWqgzjhListcount1(Gcglgcgzgj gcglgcgzgj);

	List<Map<String,Object>> selectWqgzjhList2(Gcglgcgzgj gcglgcgzgj);

	boolean updatagjSFQX(Gcglgcgzgj gcglgcgzgj);

	boolean updatasjSFQX(Gcglgcgzgj gcglgcgzgj);

	boolean updatashSFQX(Gcglgcgzgj gcglgcgzgj);

	boolean updatahslySFQX(Gcglgcgzgj gcglgcgzgj);


}
