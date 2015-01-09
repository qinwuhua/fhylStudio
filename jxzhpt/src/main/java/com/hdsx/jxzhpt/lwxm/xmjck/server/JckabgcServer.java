package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;

public interface JckabgcServer {
	boolean insertAbgc(Jckabgc abgc);
	List<Jckabgc> selectAbgcList(Jckabgc abgc,int page,int rows);
	Jckabgc selectAbgcById(Jckabgc abgc);
	boolean updateAbgcById(Jckabgc abgc);
	List<Jckabgc> selectGpsroad(Jckabgc abgc);
	List<Jckabgc> selectJckRoad(Jckabgc abgc);
	boolean deleteAbgcById(String delstr);
	boolean xgJckAbgcShzt(Jckabgc abgc);
	boolean xgJckAbgcSbzt(String delstr);
	int selectAbgcCount(Jckabgc abgc);
}
