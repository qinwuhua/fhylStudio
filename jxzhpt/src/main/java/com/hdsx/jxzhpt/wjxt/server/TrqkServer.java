package com.hdsx.jxzhpt.wjxt.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;

public interface TrqkServer {

	Boolean insertTrqk(Trqk trqk);

	int selectTrqkListCount(Trqk trqk);

	List<Trqk> selectTrqkList(Trqk trqk);

	boolean insertLqpdmxb(Lkmxb lkmxb1);

	boolean insertLqpdmxbdata(List<Map> data);

}
