package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;

public interface GcglzhfzServer {

	Boolean insertZhfzYb(Gcglzhfz gcglzhfz);

	int selectZhfzYbByJhidCount(Gcglzhfz gcglzhfz);

	List<Gcglzhfz> selectZhfzYbByJhid(Gcglzhfz gcglzhfz);

	Boolean updateZhfzYb(Gcglzhfz gcglzhfz);

	Boolean deleteZhfzYb(Gcglzhfz gcglzhfz);

	Boolean shZhfzYb(Gcglzhfz gcglzhfz);

	Boolean deleteZhfzCgs(Gcglzhfz gcglzhfz);

	Boolean updateZhfzCgs(Gcglzhfz gcglzhfz);

	int selectZhfzCgsListCount(Gcglzhfz gcglzhfz);

	List<Gcglabgc> selectZhfzCgsList(Gcglzhfz gcglzhfz);

	Boolean insertZhfzCgs(Gcglzhfz gcglzhfz);

	Gcglzhfz downWqgzFile(Gcglzhfz gcglzhfz);

	boolean uploadWqgzFilesgxk(Gcglzhfz gcglzhfz);

	boolean uploadWqgzFilejgtc(Gcglzhfz gcglzhfz);

	boolean uploadWqgzFilejgys(Gcglzhfz gcglzhfz);

	Boolean insertWqgzkg(Gcglzhfz gcglzhfz);

	Boolean insertWqgzwg(Gcglzhfz gcglzhfz);

	Boolean insertWqgzwwg(Gcglzhfz gcglzhfz);

	List<Gcglzhfz> selectWqgzjhList(Gcglzhfz gcglzhfz);

	Gcglzhfz selectWqgzjhFile(Gcglzhfz gcglzhfz);

	int selectWqgzjhListCount(Gcglzhfz gcglzhfz);

	int selectZhfzYbByJhidCount1(Gcglzhfz gcglzhfz);

	List<Gcglzhfz> selectZhfzYbByJhid1(Gcglzhfz gcglzhfz);

	Boolean sbWqgzYb(Gcglzhfz gcglzhfz);

	Gcglzhfz queryCGSByYf(Gcglzhfz gcglzhfz);

	List<Gcglzhfz> selectWqgzjhList1(Gcglzhfz gcglzhfz);

	int selectWqgzjhListcount1(Gcglzhfz gcglzhfz);

	Gcglwqgz selectZhfzTj(Gcglzhfz gcglzhfz);

	int selZhfzZgYbByJhidCount(Gcglzhfz gcglzhfz);

	List<Gcglzhfz> selZhfzZgYbByJhid(Gcglzhfz gcglzhfz);

}
