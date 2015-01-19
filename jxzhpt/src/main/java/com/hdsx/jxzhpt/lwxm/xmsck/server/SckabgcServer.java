package com.hdsx.jxzhpt.lwxm.xmsck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.utile.SjbbMessage;

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
		boolean bzAbgc(Sckabgc abgc);
		List<SjbbMessage> exportExcel_abgc_scgl(Sckabgc abgc);
		List<SjbbMessage> exportExcel_abgc_scsh(Sckabgc abgc);
		List<SjbbMessage> insertToSheet();
		boolean importAbgc_sc(List<Map> list);
}
