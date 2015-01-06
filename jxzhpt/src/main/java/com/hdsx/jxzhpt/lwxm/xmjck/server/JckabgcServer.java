package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;

public interface JckabgcServer {
	boolean insertAbgc(Jckabgc abgc);
	List<Jckabgc> selectAbgcList();
	Jckabgc selectAbgcById(Jckabgc abgc);
	boolean updateAbgc(Jckabgc abgc);
	List<Jckabgc> selectGpsroad(Jckabgc abgc);
}
