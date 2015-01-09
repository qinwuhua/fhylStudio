package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;

public interface GcglshServer {

	Boolean insertshYb(Gcglsh gcglsh);

	int selectshYbByJhidCount(Gcglsh gcglsh);

	List<Gcglsh> selectshYbByJhid(Gcglsh gcglsh);

	Boolean updateshYb(Gcglsh gcglsh);

	Boolean deleteshYb(Gcglsh gcglsh);

	Boolean shShYb(Gcglsh gcglsh);


	
}
