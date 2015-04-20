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
		boolean xgSckAbgcSbzt(String delstr,Sckabgc abgc);
		List<Sckabgc> selectSckShabgc(Sckabgc abgc);
		int selectAbgcShCount(Sckabgc abgc);
		boolean xgSckAbgcShzt(String delstr,Sckabgc abgc);
		boolean xgSckAbgcTH(String delstr);
		boolean bzAbgc(Sckabgc abgc);
		boolean onceSckAbgc(Sckabgc abgc);
		List<SjbbMessage> exportExcel_abgc_scgl(Sckabgc abgc);
		List<SjbbMessage> exportExcel_abgc_scsh(Sckabgc abgc);
		List<SjbbMessage> insertToSheet(Map map);
		boolean importAbgc_sc(List<Map<String,String>> list,String tbbmbm,String sbthcd);
		boolean lrjhSckabgc(String delstr,String nf);
		boolean xglrjhSckabgc(String delstr);
		String yanZhen(List<Map<String, String>> data, String tbbmbm,String tbbmbm2, String sbthcd1);
		Sckabgc selSckAbgcCount(Sckabgc abgc);
		Sckabgc selSckAbgcShCount(Sckabgc abgc);
		List<Sckabgc> lrjhAbgc(Sckabgc abgc);
		int lrjhAbgcCount(Sckabgc abgc);
}
