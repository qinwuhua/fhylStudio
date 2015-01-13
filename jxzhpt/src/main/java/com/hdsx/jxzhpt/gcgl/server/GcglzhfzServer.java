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

}
