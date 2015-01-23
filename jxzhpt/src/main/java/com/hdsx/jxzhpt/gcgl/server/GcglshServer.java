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

	Boolean insertShCgs(Gcglsh gcglsh);

	int selectShCgsListCount(Gcglsh gcglsh);

	List<Gcglsh> selectShCgsList(Gcglsh gcglsh);

	Boolean updateShCgs(Gcglsh gcglsh);

	Boolean deleteShCgs(Gcglsh gcglsh);

	Gcglsh downWqgzFile(Gcglsh gcglsh);

	boolean uploadWqgzFilesgxk(Gcglsh gcglsh);

	boolean uploadWqgzFilejgtc(Gcglsh gcglsh);

	boolean uploadWqgzFilejgys(Gcglsh gcglsh);

	Boolean insertWqgzwg(Gcglsh gcglsh);

	Boolean insertWqgzwwg(Gcglsh gcglsh);

	int selectWqgzjhListCount(Gcglsh gcglsh);

	List<Gcglsh> selectWqgzjhList(Gcglsh gcglsh);

	Gcglsh selectWqgzjhFile(Gcglsh gcglsh);

	Boolean insertWqgzkg(Gcglsh gcglsh);

	int selectshYbByJhidCount1(Gcglsh gcglsh);

	List<Gcglsh> selectshYbByJhid1(Gcglsh gcglsh);

	Boolean sbWqgzYb(Gcglsh gcglsh);


	
}
