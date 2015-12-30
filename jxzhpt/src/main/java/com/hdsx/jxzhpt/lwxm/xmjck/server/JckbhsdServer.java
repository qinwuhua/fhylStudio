package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckbhsd;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface JckbhsdServer {
	boolean insertWqgz(Jckbhsd wqgz);
	List<Jckbhsd> selectWqgzList(Jckbhsd wqgz);
	int selectWqgzCount(Jckbhsd wqgz);
	Jckbhsd selectWqgzById(Jckbhsd wqgz);
	boolean updateWqgzById(Jckbhsd wqgz);
	List<Jckbhsd> selectGpsroad(Jckbhsd wqgz);
	List<Jckbhsd> JckbhsdRoad(Jckbhsd wqgz);
	boolean deleteWqgzById(String delstr);
	boolean xgJckbhsdShzt(String delstr,Jckbhsd wqgz);
	boolean xgJckbhsdSbzt(String delstr,Jckbhsd wqgz);
	List<SjbbMessage> exportExcel_wqgz(Jckbhsd Jckbhsd);
	boolean importWqgz(List<Map<String,String>> list,String tbbmbm,String sbthcd);
	List<Jckbhsd> selectJckShwqgz(Jckbhsd wqgz);
	int selectWqgzShCount(Jckbhsd wqgz);
	boolean xgJckbhsdTH(String delstr,Jckbhsd wJckbhsd);
	List<SjbbMessage> exportExcel_wqgz_sh(Jckbhsd wqgz);
	List<SjbbMessage> exportExcel_wqgz_sd(Jckbhsd wqgz);
	boolean onceWqgz(Jckbhsd wqgz);
	public String yanZhen(List<Map<String, String>> data, String tbbmbm);
	Jckbhsd selJsdj(Jckbhsd wqgz);
	boolean importWqgz2(List<Map<String,String>> list,String tbbmbm,String sbthcd);
	List<String> selectTSDQ(String xzqh);
	boolean xgJckbhsdTH1(String delstr,String unit2);
	List<Jckbhsd> selectJckSdwqgz(Jckbhsd wqgz);
	int selectWqgzSdCount(Jckbhsd wqgz);
	boolean xgJckbhsdSdzt(String delstr,Jckbhsd wqgz);
	
}
