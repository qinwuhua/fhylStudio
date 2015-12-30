package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglbhsd;

public interface GcglbhsdServer {

	Boolean insertWqgzYb(Gcglbhsd Gcglbhsd);

	int selectWqgzYbByJhidCount(Gcglbhsd Gcglbhsd);

	List<Gcglbhsd> selectWqgzYbByJhid(Gcglbhsd Gcglbhsd);

	Boolean updateWqgzYb(Gcglbhsd Gcglbhsd);

	Boolean deleteWqgzYb(Gcglbhsd Gcglbhsd);

	Boolean shwqgzyb(Gcglbhsd Gcglbhsd);

	Boolean insertWqgzCgs(Gcglbhsd Gcglbhsd);

	int selectWqgzCgsListCount(Gcglbhsd Gcglbhsd);

	List<Gcglbhsd> selectWqgzCgsList(Gcglbhsd Gcglbhsd);

	Boolean updateWqgzCgs(Gcglbhsd Gcglbhsd);

	Boolean deletewqgzCgs(Gcglbhsd Gcglbhsd);

	boolean uploadWqgzFilesgxk(Gcglbhsd Gcglbhsd);

	boolean uploadWqgzFilejgtc(Gcglbhsd Gcglbhsd);

	boolean uploadWqgzFilejgys(Gcglbhsd Gcglbhsd);

	Gcglbhsd downWqgzFile(Gcglbhsd Gcglbhsd);

	Boolean insertWqgzwwg(Gcglbhsd Gcglbhsd);

	Boolean insertWqgzwg(Gcglbhsd Gcglbhsd);

	Boolean insertWqgzkg(Gcglbhsd Gcglbhsd);

	int selectWqgzjhListCount(Gcglbhsd Gcglbhsd);

	List<Gcglbhsd> selectWqgzjhList(Gcglbhsd Gcglbhsd);

	Gcglbhsd selectWqgzjhFile(Gcglbhsd Gcglbhsd);

	Boolean deleteWqgzFile(Gcglbhsd Gcglbhsd);

	Boolean sbWqgzYb(Gcglbhsd Gcglbhsd);

	int selectWqgzYbByJhidCount1(Gcglbhsd Gcglbhsd);

	List<Gcglbhsd> selectWqgzYbByJhid1(Gcglbhsd Gcglbhsd);

	List<Gcglbhsd> selectWqgzyf(Gcglbhsd Gcglbhsd);

	Gcglbhsd selectWqgzwcqk(Gcglbhsd Gcglbhsd);

	Gcglbhsd selectWqgzbzzj(Gcglbhsd Gcglbhsd);

	Gcglbhsd queryCGSByYf(Gcglbhsd Gcglbhsd);

	List<Gcglbhsd> selectWqgzjhList1(Gcglbhsd Gcglbhsd);

	int selectWqgzjhListcount1(Gcglbhsd Gcglbhsd);

	Gcglbhsd selectcgsyf(Gcglbhsd Gcglbhsd);


}
