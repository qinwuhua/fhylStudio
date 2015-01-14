package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;

public interface JckabgcServer {
	boolean insertAbgc(Jckabgc abgc);
	List<Jckabgc> selectAbgcList(Jckabgc abgc);
	int selectAbgcCount(Jckabgc abgc);
	Jckabgc selectAbgcById(Jckabgc abgc);
	boolean updateAbgcById(Jckabgc abgc);
	List<Jckabgc> selectGpsroad(Jckabgc abgc);
	List<Jckabgc> selectJckRoad(Jckabgc abgc);
	boolean deleteAbgcById(String delstr);
	boolean xgJckAbgcShzt(Jckabgc abgc);
	boolean xgJckAbgcSbzt(String delstr);
	List<Jckabgc> selectJckShabgc(Jckabgc abgc);
	int selectAbgcShCount(Jckabgc abgc);
	boolean xgJckAbgcTH(Jckabgc abgc);
	boolean onceAbgc(Jckabgc abgc);
}
