package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface JckabgcServer {
	boolean insertAbgc(Jckabgc abgc);
	List<Jckabgc> selectAbgcList(Jckabgc abgc);
	int selectAbgcCount(Jckabgc abgc);
	Jckabgc selectAbgcById(Jckabgc abgc);
	boolean updateAbgcById(Jckabgc abgc);
	List<Jckabgc> selectGpsroad(Jckabgc abgc);
	List<Jckabgc> selectJckRoad(Jckabgc abgc);
	boolean deleteAbgcById(String delstr);
	boolean xgJckAbgcShzt(String delstr,Jckabgc abgc);
	boolean xgShzt2(String delstr,String xmlx);
	boolean xgJckAbgcSbzt(String delstr,Jckabgc abgc);
	List<Jckabgc> selectJckShabgc(Jckabgc abgc);
	int selectAbgcShCount(Jckabgc abgc);
	boolean xgJckAbgcTH(String delstr);
	boolean importAbgc(List<Map<String,String>> list,String tbbmbm,String sbthcd);
	List<SjbbMessage> exportExcel_abgc(Jckabgc jckabgc);
	List<SjbbMessage> exportExcel_abgc_sh(Jckabgc jckabgc);
	boolean onceAbgc(Jckabgc abgc);
	String yanZhen(List<Map<String,String>> data,String tbbmbm);
	Jckabgc selAbgcCount(Jckabgc abgc);
	Jckabgc selAbgcShCount(Jckabgc abgc);
}
