package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;

public interface GcglyhdzxServer {

	Boolean insertYhdzxYb(Gcglyhdzx gcglyhdzx);

	int selectYhdzxYbByJhidCount(Gcglyhdzx gcglyhdzx);

	List<Gcglyhdzx> selectYhdzxYbByJhid(Gcglyhdzx gcglyhdzx);

	Boolean updateYhdzxYb(Gcglyhdzx gcglyhdzx);

	Boolean deleteYhdzxYb(Gcglyhdzx gcglyhdzx);

	Boolean shYhdzxYb(Gcglyhdzx gcglyhdzx);

	Boolean insertYhdzxCgs(Gcglyhdzx gcglyhdzx);

	int selectYhdzxCgsListCount(Gcglyhdzx gcglyhdzx);

	List<Gcglabgc> selectYhdzxCgsList(Gcglyhdzx gcglyhdzx);

	Boolean updateYhdzxCgs(Gcglyhdzx gcglyhdzx);

	Boolean deleteYhdzxCgs(Gcglyhdzx gcglyhdzx);

	
}
