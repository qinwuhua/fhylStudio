package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

public interface JckwqgzServer {
	boolean insertWqgz(Jckwqgz wqgz);
	List<Jckwqgz> selectWqgzList(Jckwqgz wqgz);
	int selectWqgzCount(Jckwqgz wqgz);
	Jckwqgz selectWqgzById(Jckwqgz wqgz);
	boolean updateWqgzById(Jckwqgz wqgz);
	List<Jckwqgz> selectGpsroad(Jckwqgz wqgz);
	List<Jckwqgz> selectGpsroad1(Jckwqgz wqgz);
	List<Jckwqgz> selectGpsroad11(Jckwqgz wqgz);
	List<Jckwqgz> JckWqgzRoad(Jckwqgz wqgz);
	boolean deleteWqgzById(String delstr);
	boolean xgJckWqgzShzt(String delstr,Jckwqgz wqgz);
	boolean xgJckWqgzSbzt(String delstr,Jckwqgz wqgz);
	List<Excel_list> exportExcel_wqgz(Jckwqgz jckwqgz);
	boolean importWqgz(List<Map<String,String>> list,String tbbmbm,String sbthcd);
	List<Jckwqgz> selectJckShwqgz(Jckwqgz wqgz);
	int selectWqgzShCount(Jckwqgz wqgz);
	boolean xgJckWqgzTH(String delstr);
	List<Excel_list> exportExcel_wqgz_sh(Jckwqgz wqgz);
	boolean onceWqgz(Jckwqgz wqgz);
	public String yanZhen(List<Map<String, String>> data, String tbbmbm);
	Jckwqgz selJsdj(Jckwqgz wqgz);
	boolean importWqgz2(List<Map<String,String>> list,String tbbmbm,String sbthcd);
	List<String> selectTSDQ(Jckwqgz wqgz);
	String selectWqgzCount1(Jckwqgz jckwqgz);
	List<String> selectTSDQ1(String xzqhdm1);
	boolean xgJckWqgzTHxj(String delstr);
}
