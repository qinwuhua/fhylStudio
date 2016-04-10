package com.hdsx.jxzhpt.qqgl.lxsh.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.gcgl.bean.Gcgl_jgys;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;

public interface KxxyjServer {

	List<Kxxyj> selectSjgzList(Lxsh lxsh);

	int selectSjgzListCount(Lxsh lxsh);

	boolean insertFile(Plan_upload uploads);

	boolean updateSjgzkxx(Kxxyj kxxyj);

	boolean sbsjgzkxx(Lxsh lxsh);

	boolean thSjgzkxx(Lxsh lxsh);

	List<Kxxyj> selectSjgzkxshList(Lxsh lxsh);

	int selectSjgzkxshListCount(Lxsh lxsh);

	boolean shsjgzkxx(Lxsh lxsh);

	boolean sjgzsfcb(Lxsh lxsh);

	boolean thSjgzkxx1(Lxsh lxsh);

	List<Kxxyj> selectLmgzkxList(Lxsh lxsh);

	int selectLmgzkxListCount(Lxsh lxsh);

	List<Kxxyj> selectXjkxList(Lxsh lxsh);

	int selectXjkxListCount(Lxsh lxsh);

	List<Kxxyj> selectLmgzkxshList(Lxsh lxsh);

	int selectLmgzkxshListCount(Lxsh lxsh);

	List<Kxxyj> selectXjkxshList(Lxsh lxsh);

	int selectXjkxshListCount(Lxsh lxsh);

	boolean updateLmgzkxx(Kxxyj kxxyj);

	boolean updateXjkxx(Kxxyj kxxyj);

	boolean sblmgzkxx(Lxsh lxsh);

	boolean sbxjkxx(Lxsh lxsh);

	boolean thLmgzkxx(Lxsh lxsh);

	boolean thXjkxx(Lxsh lxsh);

	boolean shlmgzkxx(Lxsh lxsh);

	boolean shxjkxx(Lxsh lxsh);

	boolean lmgzsfcb(Lxsh lxsh);

	boolean thLmgzkxx1(Lxsh lxsh);

	boolean xjsfcb(Lxsh lxsh);

	boolean thXjkxx1(Lxsh lxsh);

	boolean updateJGTC(Gcgl_jgys gcgl_jgys);

	boolean updateWGYS(Gcgl_jgys gcgl_jgys);

	boolean importsjgzkxx(List<Map> data);

	boolean importlmgzkxx(List<Map> data);

	boolean importxjkxx(List<Map> data);

	Lxsh showsjkxxTjxx(Lxsh lxsh);

	Lxsh showlmkxxTjxx(Lxsh lxsh);

	Lxsh showxjkxxTjxx(Lxsh lxsh);

	List<Kxxyj> selectSjgzkxbgList(Lxsh lxsh);

	int selectSjgzkxbgListCount(Lxsh lxsh);

	Lxsh showsjkxxbgTjxx(Lxsh lxsh);

	Lxsh showlmkxxbgTjxx(Lxsh lxsh);

	Lxsh showxjkxxbgTjxx(Lxsh lxsh);

	boolean tzxm(Lxsh lxsh);

	boolean thtzxm(Lxsh lxsh);

	boolean thtzxm1(Lxsh lxsh);

	Kxxyj querygkxmXX(Lxsh lxsh);

	List<Kxxyj> selectLmgzkxbgList(Lxsh lxsh);

	int selectLmgzkxbgListCount(Lxsh lxsh);

	List<Kxxyj> selectXjkxbgList(Lxsh lxsh);

	int selectXjkxbgListCount(Lxsh lxsh);

	List<Kxxyj> selectgsdkxList(Lxsh lxsh);

	int selectgsdkxListCount(Lxsh lxsh);

	Lxsh showgsdkxxTjxx(Lxsh lxsh);

}
