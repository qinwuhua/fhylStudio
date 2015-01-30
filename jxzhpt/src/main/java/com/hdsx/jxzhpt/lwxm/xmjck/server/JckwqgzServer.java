package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface JckwqgzServer {
	boolean insertWqgz(Jckwqgz wqgz);
	List<Jckwqgz> selectWqgzList(Jckwqgz wqgz);
	int selectWqgzCount(Jckwqgz wqgz);
	Jckwqgz selectWqgzById(Jckwqgz wqgz);
	boolean updateWqgzById(Jckwqgz wqgz);
	List<Jckwqgz> selectGpsroad(Jckwqgz wqgz);
	List<Jckwqgz> JckWqgzRoad(Jckwqgz wqgz);
	boolean deleteWqgzById(String delstr);
	boolean xgJckWqgzShzt(String delstr,Jckwqgz wqgz);
	boolean xgJckWqgzSbzt(String delstr,Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_wqgz(Jckwqgz jckwqgz);
	boolean importWqgz(List<Map<String,String>> list,String tbbmbm,String sbthcd);
	List<Jckwqgz> selectJckShwqgz(Jckwqgz wqgz);
	int selectWqgzShCount(Jckwqgz wqgz);
	boolean xgJckWqgzTH(String delstr);
	List<SjbbMessage> exportExcel_wqgz_sh(Jckwqgz wqgz);
	boolean onceWqgz(Jckwqgz wqgz);
	public String yanZhen(List<Map<String, String>> data, String tbbmbm);
	Jckwqgz selJsdj(Jckwqgz wqgz);
	boolean importWqgz2(List<Map<String,String>> list,String tbbmbm,String sbthcd);
}
