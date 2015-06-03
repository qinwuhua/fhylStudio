package com.hdsx.jxzhpt.qqgl.lxsh.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;

public interface LxshServer {

	String selectXmbm(String str);

	Lxsh selectbzcs(Lxsh lxsh);

	boolean selectSFCF(Lxsh lxsh);

	boolean insertSjgz(Lxsh lxsh);

	List<Lxsh> selectSjgzList(Lxsh lxsh);

	int selectSjgzListCount(Lxsh lxsh);

	List<Lxsh> selectSjgzlxList(Lxsh lxsh);

	int selectSjgzlxListCount(Lxsh lxsh);

	boolean sbsjgzSbzt(Lxsh lxsh);

	boolean thSjgzSbzt(Lxsh lxsh);

}
