package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglhsly;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;

public interface GcglhslyServer {

	Boolean inserthslyYb(Gcglhsly gcglhsly);

	int selecthslyYbByJhidCount(Gcglhsly gcglhsly);

	List<Gcglhsly> selecthslyYbByJhid(Gcglhsly gcglhsly);

	Boolean updatehslyYb(Gcglhsly gcglhsly);

	Boolean deletehslyYb(Gcglhsly gcglhsly);

	Boolean shhslyYb(Gcglhsly gcglhsly);

	Boolean insertHslyCgs(Gcglhsly gcglhsly);

	int selectHslyCgsListCount(Gcglhsly gcglhsly);

	List<Gcglhsly> selectHslyCgsList(Gcglhsly gcglhsly);

	Boolean updateHslyCgs(Gcglhsly gcglhsly);

	Boolean deleteHslyCgs(Gcglhsly gcglhsly);
	
}
