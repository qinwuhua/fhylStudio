package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;

public interface GcglgcgzgjServer {

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

}
