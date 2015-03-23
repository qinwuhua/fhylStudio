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
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;

public interface ZdxxServer {

	boolean insertzdxx(Zdxx zdxx);

	int selectZdxxListCount(Zdxx zdxx);

	List<Zdxx> selectZdxxList(Zdxx zdxx);

	boolean updatezdxx(Zdxx zdxx);

	boolean deletezdxx(Zdxx zdxx);

	List<Zdxx> selectZdxxList1(Zdxx zdxx);


}
