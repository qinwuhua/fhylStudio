package com.hdsx.jxzhpt.lwxm.xmsck.server;

import java.util.List;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;

public interface SckabgcServer {
		boolean insertSckabgc(Sckabgc abgc);
		List<Sckabgc> selectSckabgc(Sckabgc abgc);
		int selectAbgcCount(Sckabgc abgc);
		boolean deleteSckAbgc(String delstr);
		boolean updateSckabgc(Sckabgc abgc);
		Sckabgc selectSckabgcById(Sckabgc abgc);
		boolean xgSckAbgcSbzt(String delstr);
		List<Sckabgc> selectSckShabgc(Sckabgc abgc);
		int selectAbgcShCount(Sckabgc abgc);
		boolean xgSckAbgcShzt(Sckabgc abgc);
}
