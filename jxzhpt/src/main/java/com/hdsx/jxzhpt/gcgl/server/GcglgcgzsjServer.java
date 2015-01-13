package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzsj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;

public interface GcglgcgzsjServer {

	Boolean insertgcgzsjYb(Gcglgcgzsj gcglgcgzsj);

	int selectgcgzsjYbByJhidCount(Gcglgcgzsj gcglgcgzsj);

	List<Gcglgcgzsj> selectgcgzsjYbByJhid(Gcglgcgzsj gcglgcgzsj);

	Boolean updategcgzsjYb(Gcglgcgzsj gcglgcgzsj);

	Boolean deletegcgzsjYb(Gcglgcgzsj gcglgcgzsj);

	Boolean shgcgzsjyb(Gcglgcgzsj gcglgcgzsj);

	Boolean insertGcgzsjCgs(Gcglgcgzsj gcglgcgzsj);

	int selectGcgzsjCgsListCount(Gcglgcgzsj gcglgcgzsj);

	List<Gcglgcgzsj> selectGcgzsjCgsList(Gcglgcgzsj gcglgcgzsj);

	Boolean updateGcgzsjCgs(Gcglgcgzsj gcglgcgzsj);

	Boolean deleteGcgzsjCgs(Gcglgcgzsj gcglgcgzsj);
	
}
